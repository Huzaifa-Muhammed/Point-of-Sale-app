import 'package:flutter/material.dart';
import 'package:inventoryapp/Model/employee_class.dart';
import 'package:inventoryapp/Utils/constants.dart';
import '../../../../sevices/employee_table_helper.dart';

class AddEmployeePage extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController accessController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedRole;
  String? nameError;
  String? cityError;
  String? contactError;
  String? positionError;
  String? accessError;
  String? emailError;
  String? passwordError;

  final EmployeeClassDatabaseHelper databaseHelper = EmployeeClassDatabaseHelper();

  void validateFields() {
    setState(() {
      nameError = nameController.text.isEmpty ? 'Field cannot be empty' : null;
      cityError = cityController.text.isEmpty ? 'Field cannot be empty' : null;
      contactError = contactController.text.isEmpty ? 'Field cannot be empty' : null;
      positionError = selectedRole == null ? 'Field cannot be empty' : null;
      accessError = accessController.text.isEmpty ? 'Field cannot be empty' : null;
      emailError = emailController.text.isEmpty ? 'Field cannot be empty' : null;
      passwordError = passwordController.text.isEmpty ? 'Field cannot be empty' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Add Employee'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: SizedBox(
          width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                    errorText: nameError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: nameError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: cityError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: cityError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: contactError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              contactError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: DropdownButtonFormField<String>(
                  value: selectedRole,
                  items: ['Cashier', 'Manager'].map((role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value;
                      positionError = null;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Role',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: positionError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              positionError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: accessController,
                  decoration: InputDecoration(
                    labelText: 'Access',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: accessError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              accessError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: emailError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: emailError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: passwordError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              passwordError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  validateFields();
                  if (nameError == null && cityError == null && contactError == null && positionError == null && accessError == null && emailError == null && passwordError == null) {
                    await databaseHelper.insertEmployee(Employee(
                      id: 0,
                      name: nameController.text,
                      city: cityController.text,
                      contact: contactController.text,
                      role: selectedRole!,
                      access: accessController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                    nameController.clear();
                    cityController.clear();
                    contactController.clear();
                    setState(() {
                      selectedRole = null;
                      accessController.clear();
                      emailController.clear();
                      passwordController.clear();
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.green[50],
                          title: const Text('Employee Added Successfully'),
                          shape: const RoundedRectangleBorder(),
                          icon: const Icon(
                            Icons.check,
                            size: 20,
                          ),
                          iconColor: Colors.green,
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Add Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
