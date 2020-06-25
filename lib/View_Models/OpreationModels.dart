import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Core/Models/Models.dart';
import 'package:finalproject/Core/Servies/Api.dart';
import 'package:finalproject/Locater.dart';
import 'package:flutter/foundation.dart';

class Oprearations extends ChangeNotifier{

  Api api = getIt<Api>();
  List<Products>products ;

  Future<List<Products>> FetchPro()async{
    var result = await api.getCollectionsDoc();
    products = result.documents.map((doc) => Products.fromJeso(doc.data,doc.documentID)).toList();
    return products;

  }

  Stream<QuerySnapshot> FetchProductsStream(){
    return api.getCollentionsDocStream();
  }

  Future<Products>getProductById (String id ) async{
    DocumentSnapshot documentSnapshot = await api.getDocsById(id);
    Products product = Products.fromJeso(documentSnapshot.data, documentSnapshot.documentID);

    return product ;


  }
  Future<String> AddProducts(Products product) async {

    DocumentReference reference = await api.addDocs(product.toJson());
    return reference .documentID;
  }

  RemoveProduct(String id ) async{

    api.DeleteDoc(id);
    notifyListeners();
  }

  UpdateProducts(String id ,  Map data) async{
      api.UpdateDocs(id, data);
      notifyListeners();

  }

}