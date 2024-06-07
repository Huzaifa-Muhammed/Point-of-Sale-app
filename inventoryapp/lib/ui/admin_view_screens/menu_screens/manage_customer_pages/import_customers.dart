import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import '../../../../Model/customer_class.dart';
import '../../../../data/customer_data.dart';
import 'package:inventoryapp/Utils/constants.dart';

class ImportCustomer extends StatefulWidget {
  @override
  _ImportCustomerState createState() => _ImportCustomerState();
}

class _ImportCustomerState extends State<ImportCustomer> {
  List<Map<String, dynamic>> dataList = [];
  List<String> headers = [];

  Future<void> pickAndLoadCustomerExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      List<Customer> tempList = []; // Temporary list to hold customers
      List<Map<String, dynamic>> dataList = [];
      List<String> headers = [];

      for (var table in excel.tables.keys) {
        var sheet = excel.tables[table];
        if (sheet == null) continue;

        // Initialize headers from the first row of the Excel sheet
        headers = sheet.rows.first
            .map((cell) => cell?.value?.toString() ?? '')
            .toList();

        for (var row in sheet.rows.skip(1)) {
          Customer newCustomer = Customer(
            name: row[0]?.value?.toString(),
            email: row[1]?.value?.toString(),
            phone: row[2]?.value?.toString(),
            city: row[3]?.value?.toString(),
            region: row[4]?.value?.toString(),
            postalCode: row[5]?.value?.toString(),
            country: row[6]?.value?.toString(),
            customerCode: row[7]?.value?.toString(),
            note: row[8]?.value?.toString(),
          );
          tempList.add(newCustomer);

          dataList.add({
            'Name': newCustomer.name,
            'Email': newCustomer.email,
            'Phone': newCustomer.phone,
            'City': newCustomer.city,
            'Region': newCustomer.region,
            'PostalCode': newCustomer.postalCode,
            'Country': newCustomer.country,
            'CustomerCode': newCustomer.customerCode,
            'Note': newCustomer.note,
          });
        }
      }

      CustomerData.customers.addAll(tempList);
      setState(() {
        this.dataList = dataList;
        this.headers = headers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Import Customer Data',
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
        onPressed: pickAndLoadCustomerExcel,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
