import 'package:bob/pages/Tutorial.dart';
import 'package:bob/utils/CustomColors.dart';
import 'package:bob/utils/Screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Screen.width(context),
            height: Screen.height(context),
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  child: Lottie.asset(
                    'assets/bobKiss.json',
                    height: Screen.height(context) * 0.3,
                    width: Screen.width(context) * 0.6,
                  ),
                ),

                TextField(
                  decoration: InputDecoration(
                      hintText: 'usuário'
                  ),
                ),

                SizedBox(height: Screen.height(context) * 0.03,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'senha',
                  ),
                ),

                SizedBox(height: Screen.height(context) * 0.03,),

                Container(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (_) => Tutorial()
                      ));
                    },
                    color: CustomColors.primary,
                    child: Text('Entrar', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
