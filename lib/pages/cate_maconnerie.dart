import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail_prestation.dart';



class CategorieMaconnerie extends StatefulWidget {
  const CategorieMaconnerie({super.key});

  @override
  State<CategorieMaconnerie> createState() => _CategorieMaconnerieState();
}

class _CategorieMaconnerieState extends State<CategorieMaconnerie> {
   
  final Stream<QuerySnapshot> _produitRef = FirebaseFirestore.instance.collection('Prestataires').where('categorie', isEqualTo: "Maconnerie").snapshots();
  @override
  Widget build(BuildContext context) {
    return 
Container(
        child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _produitRef,
              builder: (BuildContext context, snapshot){
   
             if(snapshot.hasData){
              print(snapshot.hasData);
           
    
    return Scaffold(
       appBar: AppBar(
        title: const Text("Catégorie Maçonnerie", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange,))
        //automaticallyImplyLeading: false
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2,),
                      Container(
                    //margin: EdgeInsets.all(2),
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/macon.jpg'),
                        fit: BoxFit.cover 
                        )
                    ),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                
                       decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 189, 49, 7).withOpacity(.9),
                                              Color.fromARGB(255, 199, 108, 102).withOpacity(.1)
                                            ])
                                        ),
                      
                      child: Padding(padding: EdgeInsets.only(top:200),
                        child: Column(
                          children:const  [
                            Text("Retrouvez les meilleurs Maçons", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),

                Padding(
                                     padding: const EdgeInsets.fromLTRB(12,8,12,0),
                                     child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: const [
                                                           Text("Catégorie Maçonnerie", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),),
                                                           Text("All", style: TextStyle(fontWeight: FontWeight.bold))
                                                         ],
                                                       ),
                                   ),

                    SafeArea(
               child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,),
                      child: Column(
              
                        mainAxisSize: MainAxisSize.min,
                  
                        children:  [
                        
                        const SizedBox(height: 5,),
                 
                         GridView.count(
                           physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: .85,
                            children: snapshot.data!.docs.map((DocumentSnapshot document){
             
                                   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                                   return   CategoryProdut(tilte: data['name'], ville: data['ville'] , quartier: data['quartier'],description: data['description'],press: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPrestation(idProduct: document.id))));
                            
                            
                            }).toList(),
                          ),
                      
                      
                  //   const Center(child: CircularProgressIndicator(color: Colors.blue, backgroundColor: Colors.white,value: 0.8)),
                               
                        ])
          )
        ),

            
          ],
        ),
      ),
    );

      } if(snapshot.hasError){
 return Scaffold(
       appBar: AppBar(
        title: const Text("Catégorie Maçonnerie", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new))
        //automaticallyImplyLeading: false
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2,),
                      Container(
                    //margin: EdgeInsets.all(2),
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/macon.jpg'),
                        fit: BoxFit.cover 
                        )
                    ),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                
                       decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 189, 49, 7).withOpacity(.9),
                                              Color.fromARGB(255, 199, 108, 102).withOpacity(.1)
                                            ])
                                        ),
                      
                      child: Padding(padding: EdgeInsets.only(top:200),
                        child: Column(
                          children:const  [
                            Text("Retrouvez les meilleurs Maçons", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),


                           const SizedBox(height: 30,),

              Container(
                child: const Text("Aucune prestation pour le moment", textAlign: TextAlign.center,style: TextStyle(fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.bold),),
              )
          ],
        ),
      ),
    );
      }
            return const Scaffold(
                body:  Center(child: CircularProgressIndicator()),
              );
            

      
              }
            )
          ],
        ),
      
    );

    
  }
}



class CategoryProdut extends StatelessWidget {
  String tilte="";
  String quartier="";
  String ville = "";
  String description ="";
  VoidCallback? press;
   // ignore: use_key_in_widget_constructors
   CategoryProdut({
     required this.tilte,
    required this.ville,
     required this.quartier,
     required this.description,
    required this.press,
   

  }) ;
 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        // borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.all(20),
          
          decoration:  BoxDecoration(
             
          color: Colors.white,
          image: const DecorationImage(image: AssetImage("assets/etoile.png")),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(),
             
            boxShadow: const [
              BoxShadow(
                offset: Offset(0,17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.blueGrey,
              )
            ]
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(height: 1,),
                
                 Text(tilte,style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color:Colors.deepOrange)),
                  const SizedBox(height: 8,),
                 Text(ville,style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Colors.black)),
                  const SizedBox(height: 8,),
                
                 Text(quartier,style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Colors.deepOrange)),

                 const SizedBox(height: 8,),
                
                 Text(description.substring(0,20)+'...',style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Colors.black)),
             
                
                
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}