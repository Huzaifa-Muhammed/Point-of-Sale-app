import '../Model/employee_class.dart';

class EmployeeData {
  static List<Employee> employees = [
    Employee(
      name: 'John Doe',
      email:'JohnDoe@gmail.com',
      password: '123',
      city: 'New York',
      contact: '123-456-7890',
      position: 'CEO',
      access: 'full',
    ),
    Employee(
      name: 'Jane Smith',
      email:'JaneSmith@gmail.com',
      password: '123',
      city: 'Los Angeles',
      contact: '987-654-3210',
      position: 'CTO',
      access: 'full',
    ),
    Employee(
      name: 'Alice Johnson',
      email:'AliceJohnson@gmail.com',
      password: '123',
      city: 'Chicago',
      contact: '555-123-4567',
      position: 'CFO',
      access: 'full',
    ),
  ];
}
