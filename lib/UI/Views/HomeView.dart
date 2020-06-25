
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Core/Models/Models.dart';
import 'package:finalproject/View_Models/OpreationModels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Oprearations>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page '),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
            stream: productsProvider.FetchProductsStream(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List<Products> products = snapshot.data.documents
                    .map((doc) => Products.fromJeso(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductsCard(
                      productDetails: products[index],
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('Fetching '),
                );
              }
            }),
      ),
    );
  }
}

class ProductsCard extends StatelessWidget {
  final Products productDetails;

  ProductsCard({this.productDetails});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Card(
          child: Container(
            height: size.height * 0.45,
            width: size.width * 0.9,
            child: Row(
                children: <Widget>[
                  Hero(
                    tag: productDetails.id,
                    child: Image.asset(
                      'asset/image/${productDetails.img}.jpg',
                      height: size.height * 0.4,
                      width: size.width * 0.4,

                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(productDetails.name, style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 25),),
                      Text('${productDetails.price}\$', style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 25,color: Colors.blue),),
                    ],)
                ]),
          ),),),);
  }
}
