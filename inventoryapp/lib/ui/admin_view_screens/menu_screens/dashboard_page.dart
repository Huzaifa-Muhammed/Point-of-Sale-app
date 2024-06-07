import 'package:flutter/material.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/assets/widgets/drop_down.dart';
import '../../../assets/widgets/data_table.dart';
import '../../../assets/widgets/line_chart/chart_box.dart';

class DashboardPage extends StatefulWidget {
  bool showAppBar=false;

  DashboardPage(this.showAppBar);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<String> list=['M','T','W','Th'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar?AppBar(title:Text('Dashboard'),backgroundColor: primaryColor,foregroundColor: Colors.white,):null,
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 34),
                    child: MyDropDown(selectedItem: list.first, items: list,haveElevation: 5,width: 100,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: MyDropDown(selectedItem: list.first, items: list,haveElevation: 5,width: 100),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Adjust spacing as needed
              Material(
                elevation: 10,
                child: Container(
                  height: 600,
                  width: widget.showAppBar?MediaQuery.of(context).size.width - 100:MediaQuery.of(context).size.width - 400,
                  color: Colors.white,
                  child: MyGraph(),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 10,
                child: Container(
                  height: 600,
                  width: widget.showAppBar?MediaQuery.of(context).size.width - 100:MediaQuery.of(context).size.width - 400,
                  color: Colors.white,
                  child: MyDataTable(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
