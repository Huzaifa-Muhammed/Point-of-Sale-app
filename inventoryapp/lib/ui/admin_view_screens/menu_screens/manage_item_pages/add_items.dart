import 'package:flutter/material.dart';
import 'package:inventoryapp/Utils/constants.dart';

import '../../../../Model/item_class.dart';
import '../../../../data/item_data.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController marginController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String? nameError;
  String? categoryError;
  String? marginError;
  String? quantityError;
  String? priceError;

  void validateFields() {
    setState(() {
      nameError = nameController.text.isEmpty ? 'Field cannot be empty' : null;
      categoryError = categoryController.text.isEmpty ? 'Field cannot be empty' : null;
      marginError = marginController.text.isEmpty ? 'Field cannot be empty' : null;
      quantityError = quantityController.text.isEmpty || int.tryParse(quantityController.text) == null ? 'Invalid input' : null;
      priceError = priceController.text.isEmpty || double.tryParse(priceController.text) == null ? 'Invalid input' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Add Item'),
        backgroundColor: primaryColor, // Replace with your primary color
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
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: nameError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: nameError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: categoryError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: categoryError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: marginController,
                  decoration: InputDecoration(
                    labelText: 'Margin',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: marginError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: marginError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: quantityError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: quantityError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: primaryColor, // Replace with your primary color
                    ),
                    errorText: priceError,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: priceError != null ? Colors.red : Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  validateFields();
                  if (nameError == null && categoryError == null && marginError == null && quantityError == null && priceError == null)
                  {
                    setState(() {
                      ItemData.items.add(Item(
                        id: Item.I_ID,
                        name: nameController.text,
                        category: categoryController.text,
                        margin: marginController.text,
                        quantity: quantityController.text,
                        price: priceController.text,
                      ));
                      Item.I_ID++;
                    });
                    nameController.clear();
                    categoryController.clear();
                    marginController.clear();
                    quantityController.clear();
                    priceController.clear();
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(backgroundColor: Colors.green[50],title: const Text('Item Added successfully',),shape: const RoundedRectangleBorder(),icon: const Icon(Icons.check,size: 20,),iconColor: Colors.green,);
                    });
                  }
                },
                style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(),backgroundColor: primaryColor,foregroundColor: Colors.white),
                child: const Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}