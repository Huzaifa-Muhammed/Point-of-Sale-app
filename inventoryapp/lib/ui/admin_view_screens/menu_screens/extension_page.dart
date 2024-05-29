import 'package:flutter/material.dart';

class ExtensionPage extends StatefulWidget {
  @override
  _ExtensionPageState createState() => _ExtensionPageState();
}

class _ExtensionPageState extends State<ExtensionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.extension,
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Extension Features',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Premium Subscription',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Unlock premium features with our subscription plan. Enjoy advanced functionalities and exclusive content.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement subscription purchase flow
                },
                child: Text('Subscribe Now'),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Ad-Free Experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Enjoy an uninterrupted experience with our ad-free feature. No more distractions while using the app.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement ad-free purchase flow
                },
                child: Text('Go Ad-Free'),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Priority Support',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Get priority access to our support team. Receive faster responses and personalized assistance.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement priority support feature
                },
                child: Text('Get Priority Support'),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Exclusive Content',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Access exclusive content that is only available to premium members. Enjoy unique features and updates.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement exclusive content feature
                },
                child: Text('Unlock Exclusive Content'),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Feature 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Description of the first feature. This is where you can explain how this feature works and what benefits it provides.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Feature 2',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Description of the second feature. This section provides details on how to use this feature effectively.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 20, thickness: 2),
              Text(
                'Feature 3',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Description of the third feature. Here, users can learn about the unique aspects of this feature and its applications.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
