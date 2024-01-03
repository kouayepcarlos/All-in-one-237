// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:all_in_one/pages/produit_comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class ProductDetail extends StatefulWidget {
  
  ProductDetail({ required this.idProduct, Key? key }) : super(key: key);

  String idProduct;
  

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
   int _selectPage = 0;
  //final Query<Map<String, dynamic>> _produitRef = FirebaseFirestore.instance.collection('produit').where('categorie', isEqualTo: "Chaussure");
  final CollectionReference _produitRef =  FirebaseFirestore.instance.collection("Produit");
 
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: _produitRef.doc(widget.idProduct).get(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                Map<String, dynamic> documentData = snapshot.data!.data() as Map<String, dynamic>;
                List ImageList = documentData['url'];
             //     Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
               
                return Scaffold(
                    appBar : AppBar(
                  backgroundColor: Color.fromARGB(255, 145, 69, 46),
                    elevation: 0,
                  centerTitle: true,
                  titleSpacing: 1,
                  title: const Text("Description du produit", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),),
                  leading : IconButton(
                    onPressed: ()=> Navigator.pushReplacementNamed(context, '/produit'),
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
          automaticallyImplyLeading: false
      ),
                body:ListView(
                  padding: EdgeInsets.all(10),
                  
                    children: [
                      
                      Container(
                        height: 380,
                        //margin: const EdgeInsets.symmetric(vertical: 10),
                       child: Stack(
                         children: [
                           
                          
                           PageView(
                             // ignore: avoid_types_as_parameter_names
                             onPageChanged: (num){
                               setState(() {
                                 _selectPage = num;
                               });
                             },
                              children: [
                                for(var i=0; i< ImageList.length; i++)
                                Expanded(
                                  child: Container(
                                    child: Image.network("${ ImageList[i]}",
                                    fit: BoxFit.cover,
                                  
                                    ),
                                    
                                  ),
                                )
                              ],
                            ),

                             Positioned(
                               bottom: 10,
                               left: 0,
                               right: 0,
                               child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,  
                               children: [
                               for (var i = 0; i < ImageList.length; i++) 
                                 AnimatedContainer(
                                   duration: Duration(milliseconds: 300),
                                   curve: Curves.easeInCubic,
                                   margin: const EdgeInsets.symmetric(horizontal: 5),
                                   width: _selectPage == i ? 30.0: 12.0,
                                   height: 12,
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color.fromARGB(255, 146, 36, 36).withOpacity(0.2))
                                 )
                              ],))
                         ],
                       )
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                     
                       Padding(padding:  const EdgeInsets.symmetric(vertical: 8.0),
                       child: Text("Nom du produit : "+" "+documentData['nom'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black))),
                       Padding(padding:  const EdgeInsets.symmetric( vertical: 8.0),
                       child: Text("Prix du produit : "+" "+documentData['prix']+"FCFA", style: const TextStyle(fontSize: 16, color:Colors.deepOrange, fontWeight: FontWeight.w600),)),
                       Padding(padding:  const EdgeInsets.symmetric( vertical: 8.0),  
                       child: Text("Description du produit : "+" "+documentData['description'], style: const TextStyle(fontSize: 16,),)),
                      Padding(padding:  EdgeInsets.symmetric(),  
                       child : Text("Contact en cas de besoin "+" "+documentData['phone'], style: const TextStyle(fontSize: 16, color: Colors.deepOrange,fontWeight: FontWeight.w600),),),
                    


                    Align(
                   alignment: Alignment.bottomRight,
                   child: FloatingActionButton(
                   onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> ProduitCommentaire(idProduct: widget.idProduct)));},
                   child: const Icon(Icons.send, color: Colors.white,),
                   backgroundColor: Colors.deepOrange
                ),
                ),
                    
                    ],
                      )

                         
                        ],
                      
                      
                )
                
        
                );
            }
            
  
            
              return const Scaffold(
                  
                       body:  Center(child:  CircularProgressIndicator(color: Colors.blue, backgroundColor: Colors.white,value: 1,
                        )),
                   );
            }
            )

        ],
      );
  }
      // body: Stack(
      //   children: [
      //     ListView(
      //       children: [
      //         FutureBuilder(
      //           future: _produitRef.doc(widget.idProduct).get(),
      //           builder: (context, snapshot){
                
      //           if(snapshot.hasData){
                       
      //           Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
      //           // ignore: non_constant_identifier_names
      //           print(data);
      //           print(data['prix']);
      //           List ImageList = data['url'];
                
                // return ListView(
                //     children: [
                //       Container(
                //       //  height: 400,
                //        child: Stack(
                //          children: [
                //            Text("carlos"),
                //           //  PageView(
                //           //    onPageChanged: (num){
                //           //      setState(() {
                //           //        _selectPage = num;
                //           //      });
                //           //    },
                //           //     children: [
                //           //       for(var i=0; i< ImageList.length; i++)
                //           //       Container(
                //           //         child: Image.network("${ ImageList[i]}",
                //           //         fit: BoxFit.cover,
                //           //         ),
                                  
                //           //       )
                //           //     ],
                //           //   ),

                //             // Positioned(
                //             //   bottom: 20,
                //             //   left: 0,
                //             //   right: 0,
                //             //   child: Row(
                //             //   mainAxisAlignment: MainAxisAlignment.center,  
                //             //   children: [
                //             //   for (var i = 0; i < ImageList.length; i++) 
                //             //     AnimatedContainer(
                //             //       duration: Duration(milliseconds: 300),
                //             //       curve: Curves.easeInCubic,
                //             //       margin: const EdgeInsets.symmetric(horizontal: 5),
                //             //       width: _selectPage == i ? 30.0: 12.0,
                //             //       height: 12,
                //             //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white.withOpacity(0.2))
                //             //     )
                //             //   ],))
                //          ],
                //        )
                //       ),
                      
                //       // Padding(padding:  const EdgeInsets.only(top: 24.0, left: 24.0, bottom: 4.0, right: 24),
                //        //child: Text(data['nom'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black))),
                //       // Padding(padding:  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                //       // child: Text(data['prix']+"FCFA", style: const TextStyle(fontSize: 18, color:Colors.red, fontWeight: FontWeight.w600),)),
                //       // Padding(padding:  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),  
                //       // child: Text(data['description'], style: const TextStyle(fontSize: 16,),)),
                //       // Padding(padding:  EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),  
                //       // child : Text("Contact en cas de besoin "+" "+data['phone'], style: const TextStyle(fontSize: 16, color: Colors.red),),)
                //     ],
                // );
                // }

                
      //             return const Scaffold(
      //                 body:  Center(child:  Text("Jocelyn"),),
      //             );
              
      //        //  Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          
      //           }
      //           )
      //       ],
      //     )
      //   ],
      // ),
   
}