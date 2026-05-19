import 'package:calculator_starter/model/calculator_model.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel calculator = CalculatorModel();

  static const List<String> buttons = [
    'C',
    '*',
    '/',
    '←',
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    '%',
    '0',
    '.',
    '=',
  ];

  void handleButton(String label) {
    setState(() {
      if (label == 'C') {
        calculator.clear();
      } else if (label == '←') {
        calculator.delete();
      } else if (label == '=') {
        calculator.calculate();
      } else if ('+-*/%'.contains(label)) {
        calculator.setOperator(label);
      } else {
        calculator.addNumber(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 226, 137, 214),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: const BackButton(color: Color.fromARGB(255, 7, 7, 7)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 190, 184, 184),
                border: Border.all(
                  color: const Color.fromARGB(255, 17, 17, 17),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                calculator.display,
                style: const TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 16, 15, 15),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: [
                  for (final label in buttons)
                    ElevatedButton(
                      onPressed: () => handleButton(label),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          226,
                          137,
                          214,
                        ),
                        foregroundColor: const Color.fromARGB(255, 10, 10, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(label, style: const TextStyle(fontSize: 28)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
