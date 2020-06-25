import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Locater.dart';
import 'package:finalproject/Router.dart';
import 'package:finalproject/View_Models/OpreationModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  SetUpLoacter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<Oprearations>())
      ],
      child: MaterialApp(
        title: 'wac flutter app',
        initialRoute: '/',
        onGenerateRoute: Router.GenerateRoute,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Firestore firestore;

  @override
  void initState() {
    super.initState();
    firestore = Firestore.instance;
  }

  @override
  Widget build(BuildContext context) {

  }
}
