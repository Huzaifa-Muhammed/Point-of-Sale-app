import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:inventoryapp/Utils/constants.dart';
import '../../../../Model/item_class.dart';
import '../../../../data/item_data.dart';

class ImportItemsPage extends StatefulWidget {
  @override
  _ImportItemsPageState createState() => _ImportItemsPageState();
}

class _ImportItemsPageState extends State<ImportItemsPage> {
  List<Map<String, dynamic>> dataList = [];
  List<String> headers = [];

  Future<void> pickAndLoadExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      List<Item> tempList = []; // Temporary list to hold items

      for (var table in excel.tables.keys) {
        var sheet = excel.tables[table];
        if (sheet == null) continue;

        // Initialize headers from the first row of the Excel sheet
        headers = sheet.rows.first
            .map((cell) => cell?.value?.toString() ?? '')
            .toList();

        for (var row in sheet.rows.skip(1)) {
          Item newItem = Item(
            id: Item.I_ID,
            name: row[0]?.value?.toString() ?? '',
            category: row[1]?.value?.toString() ?? '',
            price: row[2]?.value?.toString() ?? '',
            margin: row[3]?.value?.toString() ?? '',
            quantity: row[4]?.value?.toString() ?? '',
          );
          tempList.add(newItem);
          Item.I_ID++;

          dataList.add({
            'Name': newItem.name,
            'Category': newItem.category,
            'Price': newItem.price,
            'Margin': newItem.margin,
            'Quantity': newItem.quantity,
          });
        }
      }

      setState(() {
        ItemData.items.addAll(tempList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Import Excel Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: dataList.isEmpty
          ? const Center(child: Text('No data loaded.'))
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: headers.map((header) {
                    return DataColumn(
                      label: Text(
                        header,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  }).toList(),
                  rows: dataList.map((data) {
                    return DataRow(
                      cells: headers.map((header) {
                        return DataCell(
                          Text(
                            data[header]?.toString() ?? '', // Convert to string explicitly
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAndLoadExcel,
        child: const Icon(Icons.add),
      ),
    );
  }
}
