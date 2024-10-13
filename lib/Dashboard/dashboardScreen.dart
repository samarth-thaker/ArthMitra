import 'package:budgetplanner/Dashboard/expenseListTile.dart';
import 'package:flutter/material.dart';
import 'analytics_page.dart';
import 'settings_page.dart';
import 'add_page.dart';
import 'goalcards.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    AnalyticsPage(),
    AddPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Goals",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Action for "See All" tap
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Goalcards(
                        icon: Icons.home,
                        title: "House",
                        progressValue: 0.8,
                        progressLabel: "80%",
                      ),
                      SizedBox(width: 16),
                      Goalcards(
                        icon: Icons.flight,
                        title: "Travel",
                        progressValue: 0.5,
                        progressLabel: "50%",
                      ),
                      SizedBox(width: 16),
                      Goalcards(
                        icon: Icons.health_and_safety,
                        title: "Health",
                        progressValue: 0.3,
                        progressLabel: "30%",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Latest Transaction",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const ExpenseListTile(
                    icon: Icons.shopping_bag, title: "Shopping", amount: 5000),
                const SizedBox(height: 10),
                const ExpenseListTile(
                    icon: Icons.restaurant, title: "Dinner", amount: 1500),
                const SizedBox(height: 10),
                const ExpenseListTile(
                    icon: Icons.shopping_bag, title: "Grocery", amount: 3500),
              ],
            ),
          ),

          // This Expanded widget will fill up remaining space between transactions and bottom navigation bar
          Expanded(
            child: _pages[_selectedIndex],
          ),

          // Add the SizedBox here above the BottomAppBar
          const SizedBox(height: 40), // Adjust this height to your needs

          BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: _selectedIndex == 0 ? Colors.blue[800] : Colors.grey,
                    onPressed: () => _onItemTapped(0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.bar_chart),
                    color: _selectedIndex == 1 ? Colors.blue[800] : Colors.grey,
                    onPressed: () => _onItemTapped(1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.blue[800],
                    onPressed: () {
                      // Navigate directly to the AddPage or open a modal
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddPage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    color: _selectedIndex == 2 ? Colors.blue[800] : Colors.grey,
                    onPressed: () => _onItemTapped(2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
