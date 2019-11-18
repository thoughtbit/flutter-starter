import 'package:flutter/material.dart';
import 'package:flutter_provider/routers/router.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _countdownController;

  @override
  void initState() {
    _countdownController = AnimationController(duration: Duration(seconds: 5), vsync: this);
    _countdownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCountdown(
          context: context,
          animation: StepTween(begin: 3, end: 0).animate(_countdownController),
        ),
      ),
    );
  }
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;
  AnimatedCountdown({key, this.animation, context}) : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        AppRouter.freshNavigate(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(
      (value == 0 ? '' : '$value'),
      style: TextStyle(color: Colors.red, fontSize: 48.0),
    );
  }
}
