import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  // final VoidCallback? onRestart;
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You answered 1 on 2 !',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none, 
                ),
                textAlign: TextAlign.center,
              ),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 30,
                  ),
                  Text("What is london",
                  style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none, 
                ),
                  ),
                ],
              ),
             Column(
              children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Icon(
                 Icons.check,
                  color: Colors.black,
          ),
              const SizedBox(width: 8), 
                const Text(
                "Paris",
                style: TextStyle(
                color: Colors.green,
          ),
        ),
      ],
    ),
        const SizedBox(height: 16),
             const Text(
                "Paris",
                style: TextStyle(
                color: Colors.black,
              ),
            ),
               const Text(
                "Paris",
                style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
             
              const SizedBox(height: 50),
              ElevatedButton.icon(
                icon: const Icon(Icons.close),
                label: const Text(
                  "Restart Quiz",
                  style: TextStyle(
                    decoration: TextDecoration.none, 
                  ),
                ),
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

