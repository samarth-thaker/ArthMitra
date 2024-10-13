import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String _dropdownValue = "Select category"; 

  void dropdownCallback(String? selectedValue) {
    setState(() {
      _dropdownValue = selectedValue!; 
    });
  }

  Widget customTextButton(
      String action, VoidCallback ontap, double buttonWidth) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
          padding:
              WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
        ),
        child: Text(
          action,
          style: const TextStyle(
              color: Color.fromARGB(249, 255, 255, 255), fontSize: 16),
        ),
      ),
    );
  }

  void save() {}
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add Transaction'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Goal'),
              Tab(text: 'Expense'),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          dateController.text =
                              pickedDate.toString().substring(0, 10);
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity, // Makes it take full width
                    child: DropdownButtonFormField<String>(
                      value: _dropdownValue, // Value must match exactly
                      items: const [
                        DropdownMenuItem(
                          value: "Select category",
                          child: Text("Select category"),
                        ),
                        DropdownMenuItem(
                          value: "Food",
                          child: Text("Food"),
                        ),
                        DropdownMenuItem(
                          value: "Travel",
                          child: Text("Travel"),
                        ),
                        DropdownMenuItem(
                          value: "Electricity",
                          child: Text("Electricity"),
                        ),
                        DropdownMenuItem(
                          value: "Rent",
                          child: Text("Rent"),
                        ),
                        DropdownMenuItem(
                          value: "Entertainment",
                          child: Text("Entertainment"),
                        ),
                        DropdownMenuItem(
                          value: "Refreshment",
                          child: Text("Refreshment"),
                        ),
                        DropdownMenuItem(
                          value: "Education",
                          child: Text("Education"),
                        ),
                        DropdownMenuItem(
                          value: "Extra-curricular",
                          child: Text("Extra-curricular"),
                        ),
                        DropdownMenuItem(
                          value: "Clothing",
                          child: Text("Clothing"),
                        ),
                      ],
                      onChanged: dropdownCallback,
                      iconEnabledColor: Colors.blue,
                      isExpanded: true, // Ensures the dropdown is full width
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextButton("Save", save, buttonWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
