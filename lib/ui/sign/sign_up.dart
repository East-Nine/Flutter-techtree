import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techtree/main.dart';
import 'package:techtree/util/text_style.dart';

class SignUp extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: CupertinoNavigationBar(
          border: Border(bottom: BorderSide(color: Colors.transparent)),
          backgroundColor: Colors.black,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white)
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                header(),
                inputField(),
                term(),
                signInButton(context),
              ],
            ),
          ),
        ),
      );

  Widget header() =>
      Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 0, SIDE_MARGIN, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            tr('sign_up.title'),
            style: textStyleN1(Colors.white),
          ),
        ),
      );

  Future<void> emailSignUp(BuildContext context, String email, String password) async {
    try {
      final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      )).user;

      if (user == null) {
        print('sign up error: user is null');
      } else {
        print('sign up!!');
        Navigator.popAndPushNamed(context, '/main');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('sign up error: weak-password');
      } else if (e.code == 'email-already-in-use') {
        print('sign up error: email-already-in-use');
      } else {
        print('sign up error: ${e.code}');
      }
    }
  }

  Widget inputField() =>
      Container(
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 0, SIDE_MARGIN, 0),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      hintText: tr('sign_up.user_email_hint'),
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                )
            ),
            Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      hintText: tr('sign_up.password_hint'),
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  obscureText: true,
                  controller: _password,
                )
            ),
          ],
        ),
      );

  Widget term() =>
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 15, SIDE_MARGIN, 0),
        child: Text(
          tr('sign_up.terms'),
          style: textStyleN2(Colors.grey.shade500),
        ),
      );

  Widget signInButton(BuildContext context) =>
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 50, SIDE_MARGIN, 0),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextButton(
          onPressed: () {
            emailSignUp(context, _email.text, _password.text);
          },
          child: Text(
              tr('sign_up.button'),
              style: textStyleN3(Colors.white)
          ),
        ),
      );
}