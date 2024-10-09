import 'package:flutter/material.dart';

class Goalcards extends StatelessWidget {
  final IconData icon;
  final String title;
  final double progressValue;
  final String progressLabel;
  const Goalcards({
    Key? key,
    required this.icon,
    required this.title,
    required this.progressValue,
    required this.progressLabel,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Set card width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circular icon at the top
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(height: 16),
          // Goal title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Progress bar
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              // Progress label (percentage)
              Text(
                progressLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
