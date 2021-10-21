import 'package:firstapp/screens/bill_screen.dart';
import 'package:firstapp/screens/bmi_screen.dart';
import 'package:firstapp/screens/intro_screen.dart';
import 'package:firstapp/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Bill Calculator',
      'Weather',
      'Help'
          'Contact us'
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Text(
          'Globo Fitness',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
    menuTitles.forEach(
      (element) {
        Widget screen = Container();
        menuItems.add(
          ListTile(
            title: Text(
              element,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              switch (element){
                case 'Home':
                  screen = IntroScreen();
                  break;
                case 'BMI Calculator':
                  screen = BmiScreen();
                  break;
                case 'Weather':
                  screen = WeatherScreen();
                  break;
                case 'Bill Calculator':
                  screen = BillScreen();
                  break;
              }
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
            },
          ),
        );
      },
    );

    return menuItems;
  }
}
