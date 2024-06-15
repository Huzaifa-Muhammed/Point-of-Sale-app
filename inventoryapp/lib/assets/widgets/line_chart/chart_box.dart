import 'package:flutter/material.dart';
import '../../../data/chart_data.dart';
import '../drop_down.dart';
import 'components/data_selection_button.dart';
import 'components/line_chart.dart';

class MyGraph extends StatefulWidget {
  @override
  _MyGraphState createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  String? selectedOption = 'Gross Sales';
  String selectedMonth = 'Months';
  String selectedYear = 'Year';
  List<String> years = ['Year'];

  @override
  void initState() {
    super.initState();
    // Initialize the years list with the range 2023 to 2050
    for (int i = 2023; i <= 2050; i++) {
      years.add(i.toString());
    }

    try {
      grossValue(DateTime.now().month, DateTime.now().year);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[50],
            title: const Text('Error'),
            shape: const RoundedRectangleBorder(),
            icon: const Icon(Icons.error, size: 20),
            iconColor: Colors.red,
          );
        },
      );
    }
    for (int i = 0; i < MyData.dataList.length; i++) {
      print("x: ${MyData.dataList[i].x}  y: ${MyData.dataList[i].y} ");
    }
  }

  void updateChartData(String month, String year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
      int monthNumber = getMonthNumber(month);
      int yearNumber = int.parse(year);

      // Update the data based on the selected month and year
      if (monthNumber != 0 && yearNumber != 0) {
        try {
          grossValue(monthNumber, yearNumber);
        } catch (e) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.green[50],
                title: const Text('Error'),
                shape: const RoundedRectangleBorder(),
                icon: const Icon(Icons.error, size: 20),
                iconColor: Colors.red,
              );
            },
          );
        }
      }
    });
  }

  int getMonthNumber(String month) {
    switch (month) {
      case "January":
        return 1;
      case "February":
        return 2;
      case "March":
        return 3;
      case "April":
        return 4;
      case "May":
        return 5;
      case "June":
        return 6;
      case "July":
        return 7;
      case "August":
        return 8;
      case "September":
        return 9;
      case "October":
        return 10;
      case "November":
        return 11;
      case "December":
        return 12;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DataSelectionButton(
                  option: 'Gross Sales\n€0.0\n€0.00 (0%)',
                  isSelected: selectedOption == 'Gross Sales',
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Gross Sales';
                    });
                  },
                ),
              ),
              Expanded(
                child: DataSelectionButton(
                  option: 'Refunds Value\n€0.0\n€0.00 (0%)',
                  isSelected: selectedOption == 'Refunds Value',
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Refunds Value';
                    });
                  },
                ),
              ),
              Expanded(
                child: DataSelectionButton(
                  option: 'Gross Profit Value\n€0.0\n€0.00 (0%)',
                  isSelected: selectedOption == 'Gross Profit Value',
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Gross Profit Value';
                    });
                  },
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(selectedOption!),
              Row(
                children: [
                  MyDropDown(
                    selectedItem: selectedMonth,
                    items: const [
                      "Months",
                      "January",
                      "February",
                      "March",
                      "April",
                      "May",
                      "June",
                      "July",
                      "August",
                      "September",
                      "October",
                      "November",
                      "December"
                    ],
                    onChanged: (value) {
                      if (value != "Months" || selectedYear != "Year") {
                        updateChartData(value, selectedYear);
                      }
                    },
                  ),
                  MyDropDown(
                    selectedItem: selectedYear,
                    items: years,
                    onChanged: (value) {
                      if (value != "Year" || selectedMonth != "Months") {
                        updateChartData(selectedMonth, value);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MyLineChart(spots: MyData.dataList),
              ),
            ),
          ),
        ],
      ),
    );
  }
}