// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';


// class CategorieVoiture extends StatefulWidget {
//   const CategorieVoiture({super.key});

//   @override
//   State<CategorieVoiture> createState() => _CategorieMontreState();
// }

// class _CategorieMontreState extends State<CategorieVoiture> {
//       final Stream<QuerySnapshot> _produitRef = FirebaseFirestore.instance.collection('Produit').where('categorie', isEqualTo: "Voitures").snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//              appBar: AppBar(
//         title: const Text("Catégorie Voiture", style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.deepOrange,
//         centerTitle: true,
//         leading : IconButton(
//           onPressed: ()=> Navigator.pushReplacementNamed(context, '/market'),
//            icon: const Icon(Icons.arrow_back_ios_new))
//         //automaticallyImplyLeading: false
//       ),

//         body: SingleChildScrollView(
//         child: Column(
//           children: [
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 2,),
//                       Container(
//                     //margin: EdgeInsets.all(2),
//                     height: 250,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/montre.jpeg'),
//                         fit: BoxFit.cover 
//                         )
//                     ),
//                     // ignore: avoid_unnecessary_containers
//                     child: Container(
                
//                        decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                             begin: Alignment.bottomRight,
//                                             colors: [
//                                               Color.fromARGB(255, 189, 49, 7).withOpacity(.9),
//                                               Color.fromARGB(255, 199, 108, 102).withOpacity(.1)
//                                             ])
//                                         ),
                      
//                       child: Padding(padding: EdgeInsets.only(top:200),
//                         child: Column(
//                           children:const  [
//                             Text("Retrouvez les meilleurs Voitures", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
//                           ],
//                         ),
//                       ),
//                     ),
//                     ),
//                   ],
//                 ),
//                   Padding(
//                                      padding: const EdgeInsets.fromLTRB(12,8,12,0),
//                                      child: Row(
//                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                          children: const [
//                                                            Text("Catégorie VOiture", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),),
//                                                            Text("All", style: TextStyle(fontWeight: FontWeight.bold))
//                                                          ],
//                                                        ),
//                                    ),
//           ],
//         ),
//       ),
//     );
//   }
// }