import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/calculator.dart';
import 'package:lab15/main.dart';

void main() {
  group('Unit Test: FunctionCalculator', () {
    test('Calculates y = 2x^2 correctly', () {
      final calculator = FunctionCalculator();

      expect(calculator.calculate(0), 0);
      expect(calculator.calculate(2), 8);
      expect(calculator.calculate(3), 18);
    });
  });

  // 2. WIDGET TESTS: Перевірка UI
  testWidgets('App UI and Logic tests', (WidgetTester tester) async {
    // Запускаємо додаток
    await tester.pumpWidget(const MyApp());

    final titleFinder = find.text("AV-31: Petro's last Flutter App");
    expect(titleFinder, findsOneWidget);

    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);

    expect(find.byIcon(Icons.electric_car), findsOneWidget);

    expect(
        find.descendant(of: fabFinder, matching: find.byIcon(Icons.electric_car)),
        findsOneWidget
    );

    expect(find.text('0'), findsNWidgets(2));

    await tester.tap(fabFinder);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);

    await tester.tap(fabFinder);
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
  });
}
