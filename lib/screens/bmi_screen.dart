import 'package:firstapp/shared/menu_bottom.dart';
import 'package:firstapp/shared/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;
  late double height;
  late double weight;
  TextEditingController txtHeight = TextEditingController();
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
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    String weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
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
                controller: txtHeight,
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
                'Calculate BMI',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              onPressed: findBMI,
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

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }
}
