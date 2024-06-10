import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventoryapp/data/customer_data.dart';
import '../../../../Model/customer_class.dart';
import '../../../../Utils/constants.dart';
import 'add_customer_page.dart';
import 'import_customers.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  List<Customer> customers =[];

  @override
  void initState() {
    super.initState();
    customers = CustomerData.customers;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        customers = CustomerData.customers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            height: 600,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(Icons.group_rounded,
                        size: 50, color: primaryColor),
                    Text(
                      'Customers',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Manage your Customers',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final newCustomer = await Navigator.push<Customer>(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddCustomer(),
                              ),
                            );
                            if (newCustomer != null) {
                              setState(() {
                               CustomerData.customers.add(newCustomer);
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            shape: const RoundedRectangleBorder(),
                          ),
                          child: Text(
                            "Add Customers",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ImportCustomer()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            shape: const RoundedRectangleBorder(),
                          ),
                          child: Text(
                            "Import Customers",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FixedColumnWidth(100),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(100),
                              3: FixedColumnWidth(100),
                              4: FixedColumnWidth(100),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(100),
                              7: FixedColumnWidth(100),
                              8: FixedColumnWidth(100),
                            },
                            children: [
                              const TableRow(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                ),
                                children: [
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Phone', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('City', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Region', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Postal Code', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Country', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Customer Code', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                  Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Note', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),),),
                                ],
                              ),
                              ...CustomerData.customers.map((customer) {
                                return TableRow(
                                  children: [
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.name ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.email ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.phone ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.city ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.region ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.postalCode ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.country ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.customerCode ?? ''))),
                                    Center(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(customer.note ?? ''))),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
