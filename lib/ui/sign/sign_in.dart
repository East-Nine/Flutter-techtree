import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techtree/bloc/sign/sign_in_bloc.dart';
import 'package:techtree/bloc/sign/sign_in_events.dart';
import 'package:techtree/bloc/sign/sign_in_states.dart';
import 'package:techtree/main.dart';
import 'package:techtree/services/sign_in_repository.dart';
import 'package:techtree/util/text_style.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SignInRepository _repository = SignInRepository();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocProvider<SignInBloc>(
        create: (_) => SignInBloc(repository: _repository),
        child: BlocBuilder<SignInBloc, SignInStates> (
          builder: (context, state) {
            if (state is SignInSuccess) {
              Navigator.popAndPushNamed(context, '/main');
            } else if (state is SignInFail) {
              print(state.message);
            }

            return Scaffold(
              body: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      header(),
                      inputField(),
                      recoveryPassword(),
                      signInButton(context),
                      otherSignInDivide(),
                      otherSignIn(),
                      signUp(context),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      );

  Widget socialButton({required String imagePath, VoidCallback? onPressed}) =>
      OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            fixedSize: Size(60, 40),
            side:  BorderSide(color: Colors.white, width: 0.5)
        ),
        child: SvgPicture.asset(
            imagePath,
            width: 20,
            height: 20
        ),
      );

  Widget header() =>
      Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 0, SIDE_MARGIN, 0),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('sign_in.title'),
                style: textStyleN1(Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  tr('sign_in.content'),
                  style: textStyleN3(Colors.white),
                ),
              ),
            ],
          ),
        ),
      );

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
                      hintText: tr('sign_in.user_email_hint'),
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
                      hintText: tr('sign_in.password_hint'),
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  obscureText: true,
                  controller: _password,
                )
            ),
          ],
        ),
      );

  Widget recoveryPassword() =>
      Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 15, SIDE_MARGIN, 0),
        child: Text(
          tr('sign_in.recovery_password'),
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
            BlocProvider.of<SignInBloc>(context).add(SignInEmailEvent(email: _email.text, password: _password.text));
          },
          child: Text(
              tr('sign_in.button'),
              style: textStyleN3(Colors.white)
          ),
        ),
      );

  Widget otherSignInDivide() =>
      Container(
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 40, SIDE_MARGIN, 0),
        child: Row(
          children: [
            signInLine(isLeft: true),
            Text(
              tr('sign_in.continue_with'),
              style: textStyleN2(Colors.white),),
            signInLine(isLeft: false)
          ],
        ),
      );

  Widget otherSignIn() =>
      Container(
        margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 20, SIDE_MARGIN, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialButton(
                imagePath: 'resource/drawable/ic_google.svg',
                onPressed: () {
                  BlocProvider.of<SignInBloc>(context).add(SignInGoogleChangeEvent());
                }
            ),
            SizedBox(width: 30),
            socialButton(
              imagePath: 'resource/drawable/ic_facebook.svg',
              onPressed: () {
                BlocProvider.of<SignInBloc>(context).add(SignInFacebookChangeEvent());
              },
            )
          ],
        ),
      );

  Widget signUp(context) =>
      Container(
          margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 30, SIDE_MARGIN, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('sign_in.not_member_header'),
                style: textStyleN2(Colors.white),
              ),
              SizedBox(
                  width: 10
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                child: Text(
                  tr('sign_in.not_member_join'),
                  style: textStyleN2(Colors.blue),
                ),
              ),
            ],
          )
      );

  Widget signInLine({required bool isLeft}) {
    EdgeInsetsGeometry margin;
    Gradient gradient;

    if (isLeft) {
      margin = EdgeInsets.only(right: 12);
      gradient = LinearGradient(
          colors: [
            Colors.black,
            Colors.white,
          ]
      );
    } else {
      margin = EdgeInsets.only(left: 12);
      gradient = LinearGradient(
          colors: [
            Colors.white,
            Colors.black,
          ]
      );
    }

    return Flexible(child: Container(
      height: 2,
      margin: margin,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(300)
      ),
    ),
    );
  }
}