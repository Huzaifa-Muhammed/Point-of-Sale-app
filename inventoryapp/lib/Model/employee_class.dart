class Employee {
  int id;
  final String name;
  final String city;
  final String contact;
  final String role;
  final String access;
  final String email;
  final String password;

  static int E_ID=1;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.city,
    required this.contact,
    required this.role,
    required this.access,
  });
}