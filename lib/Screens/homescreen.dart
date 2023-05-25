import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String selectedType = '';
  bool isChecked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<String> types = [
    'Type A',
    'Type B',
    'Type C',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Appcolors.backgroundColor,
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      hintText: 'Enter price',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Types',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  // DropdownButton<String>(
                  //   value: selectedType,
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       selectedType = newValue!;
                  //     });
                  //   },
                  //   items: types.map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Text('Check me'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
