import 'package:firstapp/shared/menu_bottom.dart';
import 'package:firstapp/shared/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BillScreen> {
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;
  late double height;
  double initReading= 1000;
  late double weight;
  TextEditingController txtReading = TextEditingController();
  TextEditingController txtWeight = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String heightMessage =
        'Please insert your Bill reading';
    String weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      appBar: AppBar(
        title: Text('Electricity Bill Calculator'),
        backgroundColor: Colors.redAccent,
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToggleButtons(
                isSelected: isSelected,
                color: Colors.brown,
                selectedColor: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
                onPressed: toggleMeasure),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: txtReading,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: heightMessage,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: weightMessage),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Calculate Bill',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              onPressed: findBill,
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: fontSize,
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBill() {
    double bill = 0;
    double reading = double.tryParse(txtReading.text) ?? 0;

      bill = (reading - initReading) * 1000;

    setState(() {
      result = 'Your BMI is ' + bill.toStringAsFixed(2);
    });
  }
}
