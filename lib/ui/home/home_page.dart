import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:techtree/main.dart';
import 'package:techtree/util/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 10, SIDE_MARGIN, 10),
        child: Column(
            children: [
              _profile(context),
              _personalData(),
            ]
        ),
      ),
    );

  Widget _profile(BuildContext context) =>
      IntrinsicHeight(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                        'hello ${Auth.getUserName(context)}!!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Image.asset(
                'resource/drawable/ic_default_avatar.png',
                width: 20.0,
                height: 20.0,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {  },
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );

  Widget _personalData() =>
      Expanded(
        child: Container(
          color: Colors.blue,
          child: Center(
              child: Text('User Personal Data', style: TextStyle(color: Colors.white),)
          ),
        ),
      );
}