import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house/screens/splash_screen.dart';
import 'package:house/widgets/horizontal_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 712),
      minTextAdapt: true,
      splitScreenMode: true,
      child: CupertinoApp(
        routes: {
          '/man':(context)=> HorList(sex: 'man',),
          '/woman':(context)=> HorList(sex: 'woman',)
        },
        localizationsDelegates: [DefaultMaterialLocalizations.delegate],
        theme: CupertinoThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}