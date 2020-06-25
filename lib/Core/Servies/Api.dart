import 'package:cloud_firestore/cloud_firestore.dart';

class Api{
final Firestore firestore = Firestore.instance;
final String collectionsName;
CollectionReference ref;

  Api(this.collectionsName){
   ref = firestore.collection(collectionsName);
  }

  Future<QuerySnapshot> getCollectionsDoc(){
    return ref.getDocuments();
  }
  Stream<QuerySnapshot>getCollentionsDocStream(){
    return ref.snapshots();

  }
  Future<DocumentSnapshot> getDocsById(String id ){
    return ref.document(id).get();
  }
  Future<DocumentReference> addDocs(Map data){
    return ref.add(data);
  }
  DeleteDoc(String id ){
     ref.document(id).delete();

  }
  UpdateDocs(String id , Map data){

  ref.document(id).updateData(data);
  }
}
