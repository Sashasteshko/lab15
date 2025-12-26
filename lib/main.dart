import 'package:flutter/material.dart';
import 'calculator.dart'; // Імпортуємо наш клас розрахунку

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 15',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Це наш x
  int _result = 0;  // Це наш y
  final FunctionCalculator _calculator = FunctionCalculator();

  void _incrementCounter() {
    setState(() {
      _counter++; // Крок лічильника +1
      _result = _calculator.calculate(_counter); // Розрахунок y = 2x^2
    });
  }

  @override
  Widget build(BuildContext context) {
    // ЗАВДАННЯ: Замініть текст нижче на свою групу та ім'я
    // Наприклад: "AV-31: Petro's last Flutter App"
    const String appTitle = "AV-31: Sasha's last Flutter App";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times (x):',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text(
              'Function result (y = 2x²):',
            ),
            Text(
              '$_result', // Виводимо результат функції
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.deepPurple),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        // ЗАВДАННЯ: Іконка згідно варіанту 1
        child: const Icon(Icons.electric_car),
      ),
    );
  }
}
