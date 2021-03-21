import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

const TWO_PI = 3.14 * 2;

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        title: "VelocityX Animation".text.make(),
        backgroundColor: Vx.coolGray900,
        brightness: Brightness.dark,
      ),
      body: VxAnimator<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(seconds: 30),
        builder: (context, anim1, child) {
          int percentage = (anim1.value * 100).ceil();
          return ZStack([
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                        startAngle: 0.0,
                        endAngle: TWO_PI,
                        stops: [anim1.value, anim1.value],
                        center: Alignment.center,
                        colors: [Vx.coolGray900, Vx.blueGray400])
                    .createShader(rect);
              },
              child: VxCircle(radius: 50.0, backgroundColor: Vx.coolGray50)
                  .box
                  .width(200.0)
                  .height(200.0)
                  .make(),
            ),
            VxCircle(
              radius: 50.0,
              backgroundColor: Vx.white,
              child: Center(
                  child: Text(
                "$percentage",
                style: TextStyle(fontSize: 40),
              )),
            ).box.width(180.0).height(180.0).makeCentered()
          ]).box.width(200.0).height(200.0).make();
        },
      ).makeCentered(),
    );
  }
}
