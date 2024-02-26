import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final LiquidController controller = LiquidController();
    final page = [
      const Scaffold(backgroundColor: Colors.black,
        body: Center(
          child: Text('ДЛЯ НЕЇ',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
        ),),
      const Scaffold(
          body:  Center(
            child: Row(
                children: [
                  Spacer(),
                  Icon(Icons.arrow_circle_left_outlined,
                    color: Colors.black,
                    size: 30,),
                  Text('ДЛЯ НЕЇ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  Spacer(),
                  Text('ДЛЯ НЬОГО',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  Icon(Icons.arrow_circle_right_outlined,
                    color: Colors.black,
                    size: 30,),
                  Spacer(),
                ]
            ),
          )),
      const Scaffold(backgroundColor: Colors.black,
        body:  Center(
          child: Text('ДЛЯ НЬОГО',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
        ),),
    ];
    myChangeCallback(int screen){
      if(screen == 2){
        Navigator.of(context).pushNamed('/man');
      }else if(screen == 0 ){
        Navigator.of(context).pushNamed('/woman');
      }
    }
    return Scaffold(
        body: LiquidSwipe(
        pages: page,
        liquidController: controller,
        enableLoop: false,
        initialPage: 1,
        onPageChangeCallback: myChangeCallback,
    ),
    );

  }
}












