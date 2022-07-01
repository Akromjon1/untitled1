import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled1/pages/hive_learn_page.dart';
import 'package:untitled1/pages/lang-page.dart';
import 'package:untitled1/pages/mode_page.dart';
import 'package:untitled1/services/pref_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  await Hive.initFlutter();
  await Hive.openBox('testBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  HiveLearnPage(),
    );
  }
}

