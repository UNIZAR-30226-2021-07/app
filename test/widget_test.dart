// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gatovidapp/autentificacion/login.dart';

void main() {
  testWidgets('build app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MediaQuery(
        data: new MediaQueryData(), child: new MaterialApp(home: new Login())));

    // Verificar que hay botón de inicio de sesión
    expect(find.text('INICIAR SESIÓN'), findsOneWidget);
  });
}
