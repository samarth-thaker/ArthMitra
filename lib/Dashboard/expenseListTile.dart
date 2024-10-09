import 'package:flutter/material.dart';

class ExpenseListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double amount;
  const ExpenseListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tileHeight = MediaQuery.of(context).size.height * 0.06;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // How far the shadow spreads
            blurRadius: 5, // How blurry the shadow is
            offset: const Offset(0, 3), // Changes position of shadow (x, y)
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 12), // Moderate padding for height
      margin: const EdgeInsets.symmetric(
          vertical: 8), // Moderate margin between tiles
      child: SizedBox(
        height: tileHeight, // Reduced height to fit 3 tiles evenly
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon,
                color: Colors.blue,
                size: 32), // Icon size adjusted to fit better
            Text(
              title,  
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              amount.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
