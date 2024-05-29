import 'package:flutter/material.dart';
import '../../../Model/chart_data.dart';
import '../drop_down.dart';
import 'components/data_selection_button.dart';
import 'components/line_chart.dart';

class MyGraph extends StatefulWidget {
  @override
  _MyGraphState createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  String? selectedOption = 'Gross Value'; // Default selected option

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
                    selectedItem: 'Area',
                    items: const ['Area', 'Item 1', 'Item 2', 'Item 3'],
                  ),
                  SizedBox(width: 20,),
                  MyDropDown(
                    selectedItem: 'Days',
                    items: const ['Days', 'Option 1', 'Option 2', 'Option 3'],
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
