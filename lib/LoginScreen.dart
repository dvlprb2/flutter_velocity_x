import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VxBox(
              child: VStack(
        [
          Expanded(
            child: VStack(
              [
                VxBox(child: FlutterLogo(size: 80.0))
                    .margin(EdgeInsets.only(bottom: 48.0))
                    .makeCentered(),
                "Welcome Back"
                    .text
                    .coolGray700
                    .uppercase
                    .headline6(context)
                    .letterSpacing(0.5)
                    .bold
                    .make()
                    .box
                    .margin(EdgeInsets.only(bottom: 16.0))
                    .makeCentered(),
                TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email Address",
                      isDense: true,
                      contentPadding: EdgeInsets.all(16.0)),
                )
                    .box
                    .withRounded(value: 12.0)
                    .border(color: Vx.coolGray400, width: 1.0)
                    .margin(EdgeInsets.only(bottom: 16.0))
                    .make(),
                TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      isDense: true,
                      contentPadding: EdgeInsets.all(16.0)),
                  obscureText: true,
                )
                    .box
                    .withRounded(value: 12.0)
                    .border(color: Vx.coolGray400, width: 1.0)
                    .margin(EdgeInsets.only(bottom: 16.0))
                    .make(),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  minWidth: context.screenWidth,
                  color: Vx.coolGray900,
                  child: "Login"
                      .text
                      .size(16.0)
                      .uppercase
                      .center
                      .white
                      .bodyText2(context)
                      .semiBold
                      .letterSpacing(1.0)
                      .make(),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ).box.margin(EdgeInsets.only(bottom: 16.0)).make()
              ],
              alignment: MainAxisAlignment.center,
            ),
          ),
          VxBox(
              child: VStack([
            "Don't have an account yet?".text.coolGray500.makeCentered(),
            "Sign up".text.semiBold.coolGray600.makeCentered()
          ])).make()
        ],
        alignment: MainAxisAlignment.spaceBetween,
        crossAlignment: CrossAxisAlignment.center,
      ))
          .height(context.screenHeight)
          .width(context.screenWidth)
          .padding(EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0))
          .gray100
          .makeCentered(),
    );
  }
}
