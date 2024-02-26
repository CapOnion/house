import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:house/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 3200),
          () async {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 1200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.fastEaseInToSlowEaseOut;
            var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ));
        // Navigator.of(context).push(CupertinoPageRoute(
        //   builder: (context) => const HomeScreen(),
        // ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimateList(
            interval: const Duration(milliseconds: 100),
            onComplete: (controller) {
              Future.delayed(
                const Duration(milliseconds: 1500),
                    () {
                  controller.reverse();
                },
              );
            },
            effects: [
              const FadeEffect(duration: Duration(milliseconds: 800)),
              const SlideEffect(begin: Offset(-1, 0), end: Offset(0, 0))
            ],
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/images/logo.svg'
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}