import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/aboutUs_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/dashboard_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/favorite_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_customer_pages/customer_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_employee_pages/employee_point_of_sale.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_item_pages/add_items_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/discount_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_item_pages/Item_list_Page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/profile_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/settings_page.dart';
import '../Utils/image_paths.dart';
import '../assets/widgets/sidebar.dart';
import 'admin_view_screens/menu_screens/manage_employee_pages/employee_access_right.dart';
import 'admin_view_screens/menu_screens/manage_employee_pages/employee_list_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Images images = Images();

  int _cartSelectedIndex=0;
  int _employeeSelectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ProfilePage(),
      DashboardPage(false),
      FavoritePage(),
      PointofSalePage(false,eRole: ""),
      EmployeeAccessRightsPage(),
      CustomerPage(),
      SettingsPage(),
      AboutUsPage(),
    ];
    final List<Widget> cartPages=[
      AddItem(showAppBar: false,),
      ItemListPage(),
      DiscountPage(),
    ];
    final List<Widget> employeePages=[
      EmployeeList(),
      EmployeeAccessRightsPage(),
    ];
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(images.lightLogo, scale: 5),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 20,
        backgroundColor: primaryColor,
        title: Text('Sales Summary', style: GoogleFonts.aBeeZee(color: Colors.white, letterSpacing: 2, wordSpacing: 10,),),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              if (!isMobile)
                Expanded(
                  flex: 3,
                  child: SideBar(
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              Expanded(
                flex: 9,
                child: Builder(
                  builder: (context) {
                    if (_selectedIndex == 2) {
                      return cartPages[_cartSelectedIndex];
                    } else if (_selectedIndex == 4) {
                      return employeePages[_employeeSelectedIndex];
                    } else {
                      return pages[_selectedIndex];
                    }
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: _selectedIndex==2?130:260,
            left: MediaQuery.of(context).size.width*0.25,
            child: Visibility(
              visible: _selectedIndex == 2 || _selectedIndex == 4,
              child: Container(
                width: 150,
                color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex==2?_cartSelectedIndex=0:_employeeSelectedIndex=0;
                        });
                      },
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(),fixedSize: const Size.fromWidth(150),),
                      child: _selectedIndex==4?const Text('Employee List'):const Text('Add Items'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex==2?_cartSelectedIndex=1:_employeeSelectedIndex=1;
                        });
                      },
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(),fixedSize: const Size.fromWidth(150)),
                      child: _selectedIndex==4?const Text('Access Right'):const Text('Items List'),
                    ),
                    if(_selectedIndex==2)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _cartSelectedIndex=2;
                          });
                        },
                        style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(),fixedSize: const Size.fromWidth(150)),
                        child: const Text('Discount'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
