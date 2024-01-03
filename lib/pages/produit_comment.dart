// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new, prefer_interpolation_to_compose_strings

import 'package:all_in_one/pages/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProduitCommentaire extends StatefulWidget {
   
   ProduitCommentaire({ required this.idProduct, Key? key }) : super(key: key);
   String idProduct;
  

  @override
  State<ProduitCommentaire> createState() => _ProduitCommentaireState();
}

class _ProduitCommentaireState extends State<ProduitCommentaire> {




  TextEditingController commentController = TextEditingController();
     final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? currentUser = _auth.currentUser;
    final size = MediaQuery.of(context).size;
    var maintenant = new DateTime.now();
String formattedDate = '${maintenant.hour} h${maintenant.minute}';
print('Date actuelle : $formattedDate');
    return MaterialApp(
      theme : AppTheme.lightBase,
      darkTheme : AppTheme.lightBase,
      themeMode : ThemeMode.light,
      debugShowCheckedModeBanner:false,
    
    home : Scaffold(
      appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          
          centerTitle: true,
          title: const Text("Commentaire sur le produit", style: TextStyle(color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('commentaires')
                  .doc(widget.idProduct)
                  .collection('comments')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                       title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            Expanded(
                             child: Container(
                                                     padding: EdgeInsets.only(top:8,left: 3,right: 3),
                              width: size.width,
                              decoration: BoxDecoration(
                                color:  'User' == snapshot.data!.docs[index].data()['username'].toString() ? Color(0xFF188C74) :  Color(0xFFFDD287),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                   Text(
                                       // snapshot.data!.docs[index].data().toString(),
                                        snapshot.data!.docs[index].data()['comment'].toString(), style: TextStyle(color: 'User1' == snapshot.data!.docs[index].data()['username'].toString() ? Colors.black: Colors.white),),
                                     Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(snapshot.data!.docs[index].data()['jour'].toString(),style: TextStyle(color: 'User1' == snapshot.data!.docs[index].data()['username'].toString() ? Colors.black: Colors.white)),
                                     )
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                            // subtitle: Text(snapshot
                            // .data!.docs[index].data().toString()),
                        
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Entrer un commentaire',
                    ),
                   // maxLines: 2,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send,color: Colors.deepOrange,),
                  onPressed: () {
                     currentUser?.email ?? "0";
                    if(currentUser!.email !="0"){
                         FirebaseFirestore.instance
                        .collection('commentaires')
                        .doc(widget.idProduct)
                        .collection('comments')
                        .add({
                      'comment': commentController.text,
                      'username': 'User',
                      'timestamp':  new DateTime.now(),
                      'jour' : formattedDate
                    });
                    }else if(currentUser.email =="0"){
                       FirebaseFirestore.instance
                        .collection('commentaires')
                        .doc(widget.idProduct)
                        .collection('comments')
                        .add({
                      'comment': commentController.text,
                      'username': 'User1',
                      'timestamp':  new DateTime.now(),
                      'jour' : formattedDate
                    });
                    }
                   
                    commentController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}