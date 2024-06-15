import 'package:fl_chart/fl_chart.dart';
import 'package:inventoryapp/Model/sold_item_class.dart';
import '../sevices/soldItem_table_helper.dart';

class MyData {
  static final List<FlSpot> dataList = [];
}

Future<void> grossValue(int month,int year) async {
  final SoldItemClassDatabaseHelper soldItemDBHelper = SoldItemClassDatabaseHelper(); // Initialize SoldItemClassDatabaseHelper
  Map<DateTime, double> cartMap = {};

  final currentDate = DateTime.now();
  final lastDayOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

  for (int day = 1; day <= lastDayOfMonth; day++) {
    cartMap[DateTime(currentDate.year, currentDate.month, day)] = 0.0;
  }

  final List<SoldItem> soldItemsList = await soldItemDBHelper.getSoldItemsByMonthAndYear(month, year);
  for (SoldItem soldItem in soldItemsList) {
    final DateTime date = DateTime(soldItem.date.year, soldItem.date.month, soldItem.date.day);
    cartMap.update(date, (value) => value + double.parse(soldItem.item.price));
  }

  MyData.dataList.clear();

  for (int day = 1; day <= lastDayOfMonth; day++) {
    final date = DateTime(currentDate.year, currentDate.month, day);
    MyData.dataList.add(FlSpot(day.toDouble(), cartMap[date]!));
  }
}