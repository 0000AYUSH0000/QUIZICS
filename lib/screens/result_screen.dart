import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score, required this.amount});
  final int score;
  final int amount;

  @override
  Widget build(BuildContext context) {
    double accuracy = score / amount;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'RESULTS',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
        child: Center(
          child: Column(
            children: [
              const Text(
                'SCORE',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.pinkAccent),
              ),
              Text(
                score.toString(),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: 55,
                    color: Colors.greenAccent),
              ),
              const Text(
                'ACCURACY',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.pinkAccent),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ((accuracy * 100).toStringAsFixed(2)),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: 85,
                          color: Colors.greenAccent),
                    ),
                    const Text(
                      '%',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: 55,
                          color: Colors.greenAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('PLAY AGAIN'))
            ],
          ),
        ),
      ),
    );
  }
}
