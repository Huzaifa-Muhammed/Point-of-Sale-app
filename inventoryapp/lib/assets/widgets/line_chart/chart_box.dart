import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/data/chart_data.dart'; // Import your data class
import 'components/data_selection_button.dart';
import 'components/line_chart.dart';

class MyGraph extends StatefulWidget {
  @override
  _MyGraphState createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  String? selectedOption = 'Gross Value';
  String? selectedMonth = 'Month';

  @override
  void initState() {
    super.initState();
    grossValue();
  }

  @override
  Widget build(BuildContext context) {
    String chartTitle = '';
    switch (selectedOption) {
      case 'Gross Value':
        chartTitle = 'Gross Sales';
        break;
      case 'Refunds Value':
        chartTitle = 'Refunds';
        break;
      case 'Discounts Value':
        chartTitle = 'Discounts';
        break;
      case 'New Sales Value':
        chartTitle = 'New Sales';
        break;
      case 'Gross Profit Value':
        chartTitle = 'Gross Profit';
        break;
      default:
        chartTitle = 'Gross Sales';
    }

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
              Text(chartTitle), // Display selected chart title
              DropdownButton<String>(
                value: selectedMonth,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                    // Add your logic to filter data based on selected month
                    // You may call a function here to fetch data for the selected month from the database
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'Month',
                    child: Text('Month'),
                  ),
                  for (int i = 1; i <= 12; i++)
                    DropdownMenuItem<String>(
                      value: '$i',
                      child: Text('$i'),
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
                child: MyLineChart(spots: MyData.dataList), // Pass MyData.dataList to the chart
              ),
            ),
          ),
        ],
      ),
    );
  }
}
