import 'package:firstapp/shared/menu_drawer.dart';
import 'package:firstapp/shared/menu_bottom.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Globo Fitness'),
        backgroundColor: Colors.redAccent,
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/sunset.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(14.0),
            padding: EdgeInsets.all(22.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
            ),
            child: Text('Commit to be fit, dare to be great with Globo Fitness',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey,
                      )
                    ])),
          ),
        ),
      ),
    );
  }
}
