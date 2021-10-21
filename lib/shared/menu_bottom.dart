import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      //fixedColor: Colors.red,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor),
          label: 'BMI',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_outlined),
          label: 'Bill',
          //backgroundColor: Colors.blue,
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/bmi');
            break;
          case 2:
            Navigator.pushNamed(context, '/weather');
            break;
          case 3:
            Navigator.pushNamed(context, '/bill');
            break;
        }
      },
    );
  }
}
