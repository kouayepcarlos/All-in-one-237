// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';



class DetailPrestation extends StatefulWidget {
   DetailPrestation({ required this.idProduct, Key? key }) : super(key: key);
    String idProduct;

  @override
  State<DetailPrestation> createState() => _DetailPrestationState();
}

class _DetailPrestationState extends State<DetailPrestation> {
   final CollectionReference _produitRef =  FirebaseFirestore.instance.collection("Prestataires");
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: _produitRef.doc(widget.idProduct).get(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                Map<String, dynamic> documentData = snapshot.data!.data() as Map<String, dynamic>;
               
             //     Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
               
                return Scaffold(
                     appBar: AppBar(
        title: const Text("Description Du Service", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new,color: Colors.deepOrange,))
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
                        image: AssetImage('assets/men.png'),
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
                            Text("Détails sur le prestataire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),


                      Column(
                
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                      
                        
                         Padding(padding:  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0 ),
                         child: Text("Nom du prestataire :"+" "+documentData['name'], style: const TextStyle(fontSize: 16, color: Colors.black))),
                         Padding(padding:  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                         child: Text("Ville du prestataire :"+" "+ documentData['ville'], style: const TextStyle(fontSize: 16, color:Colors.black),)),
                         Padding(padding:  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),  
                         child: Text("Quartier du prestataire :"+" "+ documentData['quartier'], style: const TextStyle(fontSize: 16, color: Colors.black),)),
                        Padding(padding:  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),  
                         child : Text("Description du prestataire :"+" "+documentData['description'], style: const TextStyle(fontSize: 16, color: Colors.black),),),
                         Padding(padding:  EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                         child : Text("Numéro du prestataire :"+" "+ documentData['phone'], style: const TextStyle(fontSize: 16, color: Colors.black),),
                         
                         ),

                          SizedBox(height: 10,),

              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                height: 200,
                decoration: BoxDecoration(
                 // border: Border.all(width: 1),
                  color: Color(0xFFFDD287),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  
                ),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 20,),
                    Text("All in one 237 une application 2 en 1.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(height: 10,),
                    Text("Bénéficier de l'expérience de nos prestataires à un prix imbattable.",style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Text("Pour un service de qualité et créatif",style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Rating(),
                   
                  ],
                ),
              ),
               Align(
                   alignment: Alignment.bottomRight,
                   child: FloatingActionButton(
                   onPressed: () {_launchURL("+237"+documentData['phone']);},
                   child: const Icon(Icons.call, color: Colors.white,),
                   backgroundColor: Colors.deepOrange
                ),
                ),
                        

                      ],
                  ),
          ],
        ),
      ),

        
               
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

    RatingBar Rating() {
    return RatingBar.builder(
 initialRating: 3,
 minRating: 1,
 direction: Axis.horizontal,
 allowHalfRating: true,
 itemCount: 5,
 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
 itemBuilder: (context, _) => Icon(
   Icons.star,
   color: Colors.deepOrange,
 ),
 onRatingUpdate: (rating) {
   print(rating);
 },
);
  }

  void _launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
}