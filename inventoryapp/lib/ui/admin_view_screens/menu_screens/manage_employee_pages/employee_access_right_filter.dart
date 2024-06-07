import 'package:flutter/material.dart';
import '../../../../Model/employee_class.dart';
import '../../../../data/employee_data.dart';
import '../../../../Utils/constants.dart';

class EmployeeAccessRightsFilterPage extends StatefulWidget {
  final String role;

  const EmployeeAccessRightsFilterPage({Key? key, required this.role}) : super(key: key);

  @override
  _EmployeeAccessRightsFilterPageState createState() => _EmployeeAccessRightsFilterPageState();
}

class _EmployeeAccessRightsFilterPageState extends State<EmployeeAccessRightsFilterPage> {
  late List<Employee> filteredEmployees;

  @override
  void initState() {
    super.initState();
    filteredEmployees = EmployeeData.employees.where((employee) => employee.role == widget.role).toList();
    if (filteredEmployees.isEmpty && widget.role == "Owner") {
      // If no employee is found for Owner role, add a default entry
      filteredEmployees.add(
        Employee(
          id: 0,
          name: 'Admin',
          email: 'admin123@gmail.com',
          password: '', // Fill with actual default password if needed
          city: '',
          contact: '311-38-1838173',
          role: 'Owner',
          access: 'Full', // Or any other default access level
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: Text('Employees - ${widget.role}'),
      ),
      body: SizedBox(
        width: 600,
        child: ListView.separated(
          padding: EdgeInsets.all(16.0),
          itemCount: filteredEmployees.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  filteredEmployees[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Email :  ${filteredEmployees[index].email}'),
                trailing: Text('Contact :  ${filteredEmployees[index].contact}'),
                onTap: () {
                  // Add onTap logic here
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
