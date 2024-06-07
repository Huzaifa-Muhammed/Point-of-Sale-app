import 'package:flutter/material.dart';

class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 16,
      columns: [
        DataColumn(label: Text('Date',style: TextStyle(fontWeight: FontWeight.bold),)),
        DataColumn(label: Text('Gross Sale',style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Refund',style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Discounts',style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Net Sales',style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Current Sales',style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: List<DataRow>.generate(
        10,
            (index) => DataRow(
          cells: [
            DataCell(Text('Data ${index + 1}1')),
            DataCell(Text('Data ${index + 1}2')),
            DataCell(Text('Data ${index + 1}3')),
            DataCell(Text('Data ${index + 1}4')),
            DataCell(Text('Data ${index + 1}5')),
            DataCell(Text('Data ${index + 1}6')),
          ],
        ),
      ),
    );
  }
}
