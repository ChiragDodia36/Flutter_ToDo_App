import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

void main() {
  testWidgets('App starts and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that the app bar shows "My Tasks"
    expect(find.text('My Tasks'), findsOneWidget);

    // Verify that the FAB exists
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}