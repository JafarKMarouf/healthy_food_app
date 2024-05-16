import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const FoodHealthy());
}

class FoodHealthy extends StatelessWidget {
  const FoodHealthy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montaga',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Healthy Food',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,

        ),
        body: const Center(
          child: Text(
            'Healthy Food App',
          ),
        ),
      ),
    );
  }
}
