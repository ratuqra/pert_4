// Renders the app with real fonts and saves PNG screenshots to screenshots/.
// Run with: flutter test tool/screenshots_test.dart

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pert_4/main.dart';

Future<void> _loadFont(String family, List<String> files) async {
  final fontsDir = '${Platform.environment['FLUTTER_ROOT']}/bin/cache/artifacts/material_fonts';
  final loader = FontLoader(family);
  for (final file in files) {
    final bytes = File('$fontsDir/$file').readAsBytesSync();
    loader.addFont(Future.value(ByteData.view(bytes.buffer)));
  }
  await loader.load();
}

Future<void> _capture(WidgetTester tester, String name) async {
  await tester.pumpAndSettle();
  await tester.runAsync(() async {
    final element = tester.element(find.byType(MaterialApp));
    final image = await captureImage(element);
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    File('screenshots/$name.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(png!.buffer.asUint8List());
  });
}

void main() {
  testWidgets('Generate screenshots', (WidgetTester tester) async {
    await _loadFont('Roboto', [
      'Roboto-Regular.ttf',
      'Roboto-Medium.ttf',
      'Roboto-Bold.ttf',
    ]);
    await _loadFont('MaterialIcons', ['MaterialIcons-Regular.otf']);

    // Pixel-like phone: 412x915 logical pixels at 2.625x.
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    tester.view.padding = const FakeViewPadding(top: 63);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await _capture(tester, '1_home');

    await tester.tap(find.text('Open Profile'));
    await _capture(tester, '2_profile');

    await tester.tap(find.text('Open Detail'));
    await _capture(tester, '3_detail');

    await tester.tap(find.text('Back to Profile'));
    await _capture(tester, '4_back_to_profile');

    await tester.tap(find.text('Back to Home'));
    await _capture(tester, '5_back_to_home');
  });
}
