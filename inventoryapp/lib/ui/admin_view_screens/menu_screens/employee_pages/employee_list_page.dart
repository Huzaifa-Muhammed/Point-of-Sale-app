import 'package:flutter/material.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/data/employee_data.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Container(
          width: 900,
          height: 1000,
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
              ],
              rows: EmployeeData.employees.map((employee) {
                return DataRow(
                  cells: [
                    DataCell(Text(employee.name)),
                    DataCell(Text(employee.city)),
                    DataCell(Text(employee.contact)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),

      floatingActionButton: Tooltip(
        message: 'Add Employee',
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(),backgroundColor: primaryColor,foregroundColor: Colors.white),
          onPressed: () {
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
