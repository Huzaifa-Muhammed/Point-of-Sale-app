import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiscountPage(),
    );
  }
}

class Discount {
  final String name;
  final String description;

  Discount(this.name, this.description);
}

class DiscountPage extends StatelessWidget {
  final List<Discount> discounts = [
    Discount(
      'Ramdom 10%',
      'Enjoy your fasting with us',
    ),
    Discount(
      'Independence Day upto 40%',
      'Show your love for country and be happy with your team',
    ),
    Discount(
      'BirthDay 55%',
      'This one is special for special ones',
    ),
  ];

  DiscountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Change the number of columns as needed
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: discounts.length,
        itemBuilder: (context, index) {
          return DiscountCard(discount: discounts[index]);
        },
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  final Discount discount;

  const DiscountCard({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              discount.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              discount.description,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Claim'),
            ),
          ),
        ],
      ),
    );
  }
}
