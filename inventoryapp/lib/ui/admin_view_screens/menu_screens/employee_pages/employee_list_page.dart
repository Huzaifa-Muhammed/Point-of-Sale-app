import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/data/employee_data.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/employee_pages/add_employee_page.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateEmployeeList());
  }

  void _updateEmployeeList() {
    setState(() {
      // Trigger UI update
    });
  }

  void _navigateToAddEmployeePage() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployeePage()));
    _updateEmployeeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Text(
                'Your Employees',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C1E5E),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 900,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Name',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'City',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Contact',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Email',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Password',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                  rows: EmployeeData.employees.map((employee) {
                    return DataRow(
                      cells: [
                        DataCell(Text(employee.name)),
                        DataCell(Text(employee.city)),
                        DataCell(Text(employee.contact)),
                        DataCell(Text(employee.email)),
                        DataCell(Text(employee.password)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Add Employee',
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          onPressed: _navigateToAddEmployeePage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
