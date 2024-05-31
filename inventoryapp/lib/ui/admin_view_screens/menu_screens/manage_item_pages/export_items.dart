import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../Model/item_class.dart';

class ExcelExporter {
  static Future<void> exportToExcel(BuildContext context, List<Item> items) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Create Excel file
      var excel = Excel.createExcel();
      var sheet = excel['Sheet1'];

      // Add headers
      sheet.appendRow([TextCellValue('Name'), TextCellValue('Category'), TextCellValue('Price'), TextCellValue('Margin'), TextCellValue('Quantity')]);

      // Add items
      for (var item in items) {
        sheet.appendRow([TextCellValue(item.name), TextCellValue(item.category), TextCellValue(item.price), TextCellValue(item.margin), TextCellValue(item.quantity.toString())]);
      }

      // Get the directory to save the file
      var directory = await getApplicationDocumentsDirectory();
      if (directory != null) {
        var path = '${directory.path}/exported-items.xlsx';

        // Save Excel file
        var bytes = excel.encode();
        File(path)
          ..createSync(recursive: true)
          ..writeAsBytesSync(bytes!);

        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Icon(Icons.check_circle, color: Colors.green, size: 50),
              content: const Text('Data exported successfully!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Show error dialog if directory is null
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Icon(Icons.error, color: Colors.red, size: 50),
              content: const Text('Failed to get the directory to save the file.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Show error dialog if permission is denied
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(Icons.error, color: Colors.red, size: 50),
            content: const Text('Permission denied! Cannot export data.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
