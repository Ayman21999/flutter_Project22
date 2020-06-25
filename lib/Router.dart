
import 'package:finalproject/UI/Views/AddProducts.dart';
import 'package:finalproject/UI/Views/HomeView.dart';
import 'package:finalproject/UI/Views/ProductsDetalies.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> GenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeView());

      case '/addProduct':
        return MaterialPageRoute(builder: (context) => AddProducts());

      case '/ProductsDetails':
        return MaterialPageRoute(builder: (context) => ProductsDetalies());

      default:
        return MaterialPageRoute
        (builder: (context)
        {
          return Scaffold(
            body: Center(
              child: Text('Not defind Route'),
            ),
          );
        });
    }
  }
}
