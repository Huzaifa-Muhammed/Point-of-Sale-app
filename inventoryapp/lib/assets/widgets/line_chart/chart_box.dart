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
  String? selectedOption = 'Gross Value'; // Default selected option
  String selectedMonth = 'Months'; // Default selected month

  @override
  void initState() {
    super.initState();
    try {
      grossValue(DateTime
          .now()
          .month);
    }catch(e)
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[50],
            title: const Text('Item Added Successfully'),
            shape: const RoundedRectangleBorder(),
            icon: const Icon(Icons.check, size: 20),
            iconColor: Colors.green,
          );
        },
      );
    }
    for (int i = 0; i < MyData.dataList.length; i++) {
      print("x: ${MyData.dataList[i].x}  y: ${MyData.dataList[i].y} ");
    }
  }

  void updateChartData(String month) {
    setState(() {
      selectedMonth = month;
      int monthNumber = getMonthNumber(month);
      // Update the data based on the selected month
      if (monthNumber != 0) {
        try {
          grossValue(monthNumber);
        }catch(e){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.green[50],
                title: const Text('Item Added Successfully'),
                shape: const RoundedRectangleBorder(),
                icon: const Icon(Icons.check, size: 20),
                iconColor: Colors.green,
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
                  option: 'Gross Value\n€0.0\n€0.00 (0%)',
                  isSelected: selectedOption == 'Gross Value',
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Gross Value';
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
                  option: 'Discounts Value\n€0.0\n€0.00 (0%)',
                  isSelected: selectedOption == 'Discounts Value',
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Discounts Value';
                    });
                  },
                ),
              ),
              Expanded(
                child: DataSelectionButton(
                  option: 'New Sales Value\n€0.0\n€0.00 (0%)',
                  isSelected: selectedOption == 'New Sales Value',
                  onPressed: () {
                    setState(() {
                      selectedOption = 'New Sales Value';
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
              const Text('Gross Sales'),
              Row(
                children: [
                  MyDropDown(
                    selectedItem: selectedMonth,
                    items: const ["Months", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                    onChanged: (value) {
                      if (value != "Months") {
                        updateChartData(value);
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