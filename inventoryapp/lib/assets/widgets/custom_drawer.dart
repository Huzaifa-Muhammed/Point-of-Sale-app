import 'package:flutter/material.dart';
import 'package:inventoryapp/Utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onProfilePressed;
  final VoidCallback onAddItemPressed;
  final VoidCallback onLogoutPressed;

  const CustomDrawer({
    required this.onProfilePressed,
    required this.onAddItemPressed,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              'Employee Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: onProfilePressed,
          ),
          ListTile(
            title: const Text('Add Item'),
            onTap: onAddItemPressed,
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: onLogoutPressed,
          ),
        ],
      ),
    );
  }
}
