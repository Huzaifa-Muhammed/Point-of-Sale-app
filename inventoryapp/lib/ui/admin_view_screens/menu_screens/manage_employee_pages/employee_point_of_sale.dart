import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventoryapp/Model/sold_item_class.dart';
import 'package:inventoryapp/UI/auth_screens/login_screen.dart';
import 'package:inventoryapp/assets/widgets/custom_drawer.dart';
import 'package:inventoryapp/data/sold_items_data.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_item_pages/add_items.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_item_pages/add_items_page.dart';
import 'package:inventoryapp/ui/admin_view_screens/menu_screens/manage_item_pages/import_items.dart';
import '../../../../Model/item_class.dart';
import '../../../../data/item_data.dart';
import 'package:inventoryapp/Utils/constants.dart';

class PointofSalePage extends StatefulWidget {
  @override
  _PointofSalePageState createState() => _PointofSalePageState();
}

class _PointofSalePageState extends State<PointofSalePage> {
  List<Item> cartItems = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  double getSubtotal() {
    return cartItems.fold(0, (sum, item) => sum + double.parse(item.price));
  }

  void importItems() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ImportItemsPage()));
  }

  void addItem() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItemPage()));
  }

  Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.inbox,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          const Text(
            'No items available',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: importItems,
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Import Items'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: addItem,
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildItemList() {
    return ListView.builder(
      itemCount: ItemData.items.length,
      itemBuilder: (context, index) {
        final item = ItemData.items[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text("Price: \$${item.price} - Category: ${item.category}"),
          trailing: Text("Quantity: ${item.quantity}"),
          onTap: () {
            if (item.quantity=='0') {
              showErrorDialog('This item is out of stock or quantity is invalid.');
            } else if (item.price.isEmpty || item.name.isEmpty ) {
              showErrorDialog('Item data is invalid. Item details like name or price is missing.');
            } else {
              setState(() {
                Item cartItem = Item(
                  id: item.id,
                  name: item.name,
                  price: item.price,
                  quantity: (1).toString(),
                  category: item.category,
                  margin: item.margin,
                );
                cartItems.add(cartItem);
                ItemData.items[index].quantity = (int.parse(ItemData.items[index].quantity)-1).toString();
              });
            }
          },
        );
      },
    );
  }

  Widget buildCartList() {
    return ListView.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemBuilder: (context, index) {
        final cartItem = cartItems[index];
        return ListTile(
          title: Text(cartItem.name),
          subtitle: Text("Price: \$${cartItem.price}"),
          trailing: GestureDetector(
              onTap: (){
                setState(() {
                  for(int i=0;i<ItemData.items.length;i++){
                    if(ItemData.items[i].id==cartItem.id){
                      ItemData.items[i].quantity= (int.parse(ItemData.items[i].quantity)+1).toString();
                    }
                  }
                  cartItems.removeAt(index);
                });
              },
              child: Icon(Icons.minimize)
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        onProfilePressed: () {},
        onAddItemPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddItem(showAppBar: true)));
        },
        onLogoutPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Point of Sale',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          // Items List
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: ItemData.items.isEmpty
                  ? buildEmptyState()
                  : buildItemList(),
            ),
          ),
          // Divider
          Container(
            width: 1,
            color: primaryColor,
          ),
          // Cart
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: buildCartList(),
                  ),
                ),
                // Subtotal
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Subtotal:\t',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$${getSubtotal().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Check Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  List<Item> temp=cartItems;
                                  for(int i=0;i<temp.length;i++){
                                    SoldItem si=SoldItem(item: temp[i], date: DateTime(DateTime.now().day,DateTime.now().month,DateTime.now().year));
                                    SoldItemsData.soldItems.add(si);
                                    cartItems.clear();
                                  }
                                });
                              },
                              child: const Icon(Icons.arrow_right_outlined,color: Colors.white,size: 40,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
