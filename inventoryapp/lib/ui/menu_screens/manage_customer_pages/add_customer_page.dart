import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Model/customer_class.dart';
import '../../../../Utils/constants.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _customerCodeController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final Customer customer = Customer();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _postalCodeController.dispose();
    _customerCodeController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 200),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildNameField(),
              const SizedBox(height: 16.0),
              _buildOptionalTextField(_emailController, 'Email', Icons.email),
              const SizedBox(height: 16.0),
              _buildOptionalTextField(_phoneController, 'Phone', Icons.phone, inputTypenumber: true),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _buildOptionalTextField(_cityController, 'City', null),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: _buildOptionalTextField(_regionController, 'Region', null),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _buildOptionalTextField(_postalCodeController, 'Postal code', null, inputTypenumber: true),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(color: primaryColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      items: _getCountriesList().map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          customer.country = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              _buildOptionalTextField(_customerCodeController, 'Customer code', Icons.qr_code),
              _buildOptionalTextField(_noteController, 'Note', Icons.message),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Cancel and return to the previous screen
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor,foregroundColor: Colors.white,shape: const RoundedRectangleBorder()),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Set the customer data based on the text field values
                        customer
                          ..name = _nameController.text
                          ..email = _emailController.text
                          ..phone = _phoneController.text
                          ..city =  _cityController.text
                          ..region = _regionController.text
                          ..postalCode = _postalCodeController.text
                          ..customerCode = _customerCodeController.text
                          ..note = _noteController.text;

                        // Return the customer data to the previous screen
                        Navigator.pop(context, customer);
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(backgroundColor: Colors.green[50],title: const Text('Customer Added successfully',),shape: const RoundedRectangleBorder(),icon: const Icon(Icons.check,size: 20,),iconColor: Colors.green,);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor,foregroundColor: Colors.white,shape: const RoundedRectangleBorder()),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
    );
  }

  Widget _buildOptionalTextField(TextEditingController controller, String label, IconData? icon, {bool inputTypenumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: primaryColor),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          prefixIcon: icon != null ? Icon(icon, color: primaryColor) : null,
        ),
        keyboardType: inputTypenumber ? TextInputType.number : TextInputType.text,
        inputFormatters: inputTypenumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      ),
    );
  }

  List<String> _getCountriesList() {
    return [
      'Afghanistan',
      'Albania',
      'Algeria',
      'Andorra',
      'Angola',
      'Antigua and Barbuda',
      'Argentina',
      'Armenia',
      'Australia',
      'Austria',
      'Azerbaijan',
      'Bahamas',
      'Bahrain',
      'Bangladesh',
      'Barbados',
      'Belarus',
      'Belgium',
      'Belize',
      'Benin',
      'Bhutan',
      'Bolivia',
      'Bosnia and Herzegovina',
      'Botswana',
      'Brazil',
      'Brunei',
      'Bulgaria',
      'Burkina Faso',
      'Burundi',
      'Cabo Verde',
      'Cambodia',
      'Cameroon',
      'Canada',
      'Central African Republic',
      'Chad',
      'Chile',
      'China',
      'Colombia',
      'Comoros',
      'Congo (Congo-Brazzaville)',
      'Costa Rica',
      'Croatia',
      'Cuba',
      'Cyprus',
      'Czech Republic',
      'Democratic Republic of the Congo',
      'Denmark',
      'Djibouti',
      'Dominica',
      'Dominican Republic',
      'East Timor',
      'Ecuador',
      'Egypt',
      'El Salvador',
      'Equatorial Guinea',
      'Eritrea',
      'Estonia',
      'Eswatini',
      'Ethiopia',
      'Fiji',
      'Finland',
      'France',
      'Gabon',
      'Gambia',
      'Georgia',
      'Germany',
      'Ghana',
      'Greece',
      'Grenada',
      'Guatemala',
      'Guinea',
      'Guinea-Bissau',
      'Guyana',
      'Haiti',
      'Honduras',
      'Hungary',
      'Iceland',
      'India',
      'Indonesia',
      'Iran',
      'Iraq',
      'Ireland',
      'Israel',
      'Italy',
      'Jamaica',
      'Japan',
      'Jordan',
      'Kazakhstan',
      'Kenya',
      'Kiribati',
      'Kuwait',
      'Kyrgyzstan',
      'Laos',
      'Latvia',
      'Lebanon',
      'Lesotho',
      'Liberia',
      'Libya',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Madagascar',
      'Malawi',
      'Malaysia',
      'Maldives',
      'Mali',
      'Malta',
      'Marshall Islands',
      'Mauritania',
      'Mauritius',
      'Mexico',
      'Micronesia',
      'Moldova',
      'Monaco',
      'Mongolia',
      'Montenegro',
      'Morocco',
      'Mozambique',
      'Myanmar',
      'Namibia',
      'Nauru',
      'Nepal',
      'Netherlands',
      'New Zealand',
      'Nicaragua',
      'Niger',
      'Nigeria',
      'North Macedonia',
      'Norway',
      'Oman',
      'Pakistan',
      'Palau',
      'Palestine',
      'Panama',
      'Papua New Guinea',
      'Paraguay',
      'Peru',
      'Philippines',
      'Poland',
      'Portugal',
      'Qatar',
      'Romania',
      'Russia',
      'Rwanda',
      'Saint Kitts and Nevis',
      'Saint Lucia',
      'Saint Vincent and the Grenadines',
      'Samoa',
      'San Marino',
      'Sao Tome and Principe',
      'Saudi Arabia',
      'Senegal',
      'Serbia',
      'Seychelles',
      'Sierra Leone',
      'Singapore',
      'Slovakia',
      'Slovenia',
      'Solomon Islands',
      'Somalia',
      'South Africa',
      'South Korea',
      'South Sudan',
      'Spain',
      'Sri Lanka',
      'Sudan',
      'Suriname',
      'Sweden',
      'Switzerland',
      'Syria',
      'Taiwan',
      'Tajikistan',
      'Tanzania',
      'Thailand',
      'Togo',
      'Tonga',
      'Trinidad and Tobago',
      'Tunisia',
      'Turkey',
      'Turkmenistan',
      'Tuvalu',
      'Uganda',
      'Ukraine',
      'United Arab Emirates',
      'United Kingdom',
      'United States of America',
      'Uruguay',
      'Uzbekistan',
      'Vanuatu',
      'Vatican City',
      'Venezuela',
      'Vietnam',
      'Yemen',
      'Zambia',
      'Zimbabwe'
    ];
  }
}