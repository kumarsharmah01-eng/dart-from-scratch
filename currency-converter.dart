import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterMaterialApp(),
    );
  }
}

class CurrencyConverterMaterialApp extends StatefulWidget {
  const CurrencyConverterMaterialApp({super.key});

  @override
  State<CurrencyConverterMaterialApp> createState() =>
      _CurrencyConverterMaterialAppState();
}

class _CurrencyConverterMaterialAppState
    extends State<CurrencyConverterMaterialApp> {
  // Controller to read input
  final TextEditingController textEditingController = TextEditingController();

  // Store result here
  double result = 0.0;

  // Conversion rate (1 USD = 83 INR)
  final double conversionRate = 83.0;

  // Conversion function
  void convertCurrency() {
    double input = double.tryParse(textEditingController.text) ?? 0.0;
    setState(() {
      result = input * conversionRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(80),
        right: Radius.circular(80),
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(59, 58, 58, 0.39),
      appBar: AppBar(
        title: const Text(
          ' Currency Converter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(59, 58, 58, 0.39),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Result Text
              Text(
                '₹ ${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // TextField for input
              TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter amount in USD',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(137, 0, 0, 0),
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),

              const SizedBox(height: 20),

              // Convert Button
              ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
