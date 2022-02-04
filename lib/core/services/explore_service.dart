import 'package:cloud_firestore/cloud_firestore.dart';


class ExploreService {
   final CollectionReference _categoryCollectionRef=
     FirebaseFirestore.instance.collection("categories");
     final CollectionReference _productsCollectionRef=
     FirebaseFirestore.instance.collection("products");
     

     

   Future<List<QueryDocumentSnapshot>>  getCategory()async{
    
     var valueResult=  await _categoryCollectionRef.get();
   
       return valueResult.docs;
     }
     Future<List<QueryDocumentSnapshot>>  getallProducts()async{
    
     var valueResult=  await _productsCollectionRef.get();
   
       return valueResult.docs;
     }
}