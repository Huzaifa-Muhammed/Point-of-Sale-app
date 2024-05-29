import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'dart:io';

class PointofSalePage extends StatefulWidget {
  @override
  _PointofSalePageState createState() => _PointofSalePageState();
}

class _PointofSalePageState extends State<PointofSalePage> {
  String category = 'No category';
  bool soldByEach = true;
  bool trackStock = false;
  String selectedItem = 'Color and shape';
  Color selectedColor = Colors.green; // Default selected color
  File? selectedImage; // Selected image file
  TextEditingController stockController = TextEditingController();
  final ImagePicker _picker = ImagePicker(); // Image picker instance

  final List<Color> colors = [
    Colors.grey,
    Colors.red,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        selectedItem =
        'Image'; // Set selected item to image when an image is picked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery
        .of(context)
        .size
        .width * 2 / 3;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Create item'),
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              // Save functionality here
            },
            child: Text(
              'SAVE',
              style: TextStyle(
                  color: Colors.white, fontSize: 16, letterSpacing: 2),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Combined Name, Category, Sold by, Price, Cost, SKU, and Barcode fields
              Card(
                child: Container(
                  width: cardWidth,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(fontSize: 16,
                                color: primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: DropdownButtonFormField<String>(
                          value: category,
                          onChanged: (value) {
                            setState(() {
                              category = value!;
                            });
                          },
                          items: ['No category', 'Category 1', 'Category 2']
                              .map((label) =>
                              DropdownMenuItem(
                                child: Text(
                                    label, style: TextStyle(color: primaryColor)),
                                value: label,
                              ))
                              .toList(),
                          decoration: InputDecoration(
                            labelText: 'Category',
                            labelStyle: TextStyle(fontSize: 16,
                                color: primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Sold by:', style: TextStyle(
                                fontSize: 16, color: primaryColor)),
                            Row(
                              children: [
                                Radio<bool>(
                                  value: true,
                                  groupValue: soldByEach,
                                  onChanged: (value) {
                                    setState(() {
                                      soldByEach = value!;
                                    });
                                  },
                                ),
                                Text('Each', style: TextStyle(
                                    fontSize: 16, color: primaryColor)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<bool>(
                                  value: false,
                                  groupValue: soldByEach,
                                  onChanged: (value) {
                                    setState(() {
                                      soldByEach = value!;
                                    });
                                  },
                                ),
                                Text('Weight', style: TextStyle(
                                    fontSize: 16, color: primaryColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Price',
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Cost',
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'SKU',
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Barcode',
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Inventory switch with stock value input field
              Card(
                child: Container(
                  width: cardWidth,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text('Inventory',
                            style: TextStyle(fontSize: 14, color: primaryColor)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Track stock', style: TextStyle(
                              fontSize: 16, color: primaryColor)),
                          Switch(
                            value: trackStock,
                            onChanged: (value) {
                              setState(() {
                                trackStock = value;
                              });
                            },
                          ),
                        ],
                      ),
                      if (trackStock)
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: stockController,
                            decoration: InputDecoration(
                              labelText: 'Stock value',
                              labelStyle: TextStyle(
                                  fontSize: 16, color: primaryColor),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Additional options with color and image picker
              Card(
                child: Container(
                  width: cardWidth,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Color and shape', style: TextStyle(
                              fontSize: 16, color: primaryColor)),
                          Radio<String>(
                            value: 'Color and shape',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      if (selectedItem == 'Color and shape')
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 5,
                          children: colors.map((color) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                  selectedItem =
                                  'Color and shape'; // Activate color radio button
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: color,
                                  border: Border.all(
                                    color: selectedColor == color
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Image', style: TextStyle(
                              fontSize: 16, color: primaryColor)),
                          Radio<String>(
                            value: 'Image',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      if (selectedItem == 'Image')
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            margin: EdgeInsets.only(top: 16.0),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: selectedImage != null
                                ? Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            )
                                : Icon(
                              Icons.add_a_photo,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}