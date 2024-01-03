import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DatabaseService{

  String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("Prestataires");

  // ignore: non_constant_identifier_names
  Future<void> SaveUser(String name, String email, String password, String phone, String ville, String quartier, String categorie, String description ) async{

    return await userCollection.doc(uid).set({
      
      'name' : name,
      'email' : email,
      'password' : password,
      'phone' : phone,
      'ville' : ville,
      'quartier' : quartier,
      'categorie' : categorie,
      'description' : description,
    });

  }

 


  AppUserData _userFromSnapshot(DocumentSnapshot snapshot){

    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    return AppUserData(
      uid: uid,
      nom: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      phone: data['phone'],
      ville: data['ville'] ?? '',
      quartier: data['quartier'] ?? '',
      categorie: data['categorie'] ?? '',
      description: data['description'] ?? '',
      );
  }


  Stream<AppUserData> get user{
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  Iterable<AppUserData> _userListFromSnapshot(QuerySnapshot snapshot){
    
    return snapshot.docs.map((doc) {
      return AppUserData(
        uid: uid, 
        nom: doc.get('name'),
        email: doc.get('email'),
        password: doc.get('password'),
        phone: doc.get('phone'),
        ville: doc.get('ville'),
        quartier: doc.get('quartier'),
        categorie: doc.get('categorie'),
        description: doc.get('description'),

        );
    });
  }

  
  Stream<Iterable<AppUserData>> get users{
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  
}
