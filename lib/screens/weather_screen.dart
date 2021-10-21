import 'package:firstapp/data/http_helper.dart';
import 'package:firstapp/shared/menu_bottom.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Report'),
      ),
      bottomNavigationBar: MenuBottom(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: getData, child: Text('Get Weather'),
            ),
            Text(result),
          ],
        ),
      ),
    );
  }

  Future getData() async{
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('London');
    setState(() {

    });
  }
}
