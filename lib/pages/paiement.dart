
// ignore_for_file: unused_import, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unused_label

import 'dart:async';
import 'dart:convert';

import 'package:all_in_one/pages/argument.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

//import 'package:webview_flutter/webview_flutter.dart';


class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {

  
   
                                                              
  
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Argume;
     final Stream<QuerySnapshot> validation = FirebaseFirestore.instance.collection('Prestataires').where('phone', isEqualTo: args.phone.toString()).snapshots();

   return 
Container(
        child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: validation,
              builder: (BuildContext context, snapshot){
   
             if(snapshot.hasData){
              print(snapshot.hasData);


    return  Scaffold(
      appBar: AppBar(
         title: const Text('Paiement All in one 237', style: TextStyle(color: Colors.deepOrange),),
         backgroundColor: Colors.white,
         elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prest'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange,))
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
                            Text("Effectuer votre paiement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),

                const SizedBox(height: 15,),

                Text("Cliquer sur le bouton paiement", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                 const SizedBox(height: 15,),
                
                 Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
                                      //  padding:  const EdgeInsets.all(12),
                                          // color: Colors.deepOrange,
                                           height: 40,
                                           width: 120,
                                         decoration: BoxDecoration(
                                         border: Border.all(width: 3,  color: Colors.deepOrange),
                                          color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        
                  ),
                                                 
                                           child: InkWell(
                                            
                                              hoverColor: Colors.orange,
                                              onTap: () async{
                                              
                                                _launchURL(args.link);


                                                var headers = {
                                                        'Authorization': "Token"+" "+args.token.toString(),
                                                        'Content-Type': 'application/json'
                                                      };
                                                      var request = http.Request('GET', Uri.parse('https://www.campay.net/api/transaction/'));

                                                      request.headers.addAll(headers);

                                                      http.StreamedResponse response = await request.send();

                                                      if (response.statusCode == 200) {
                                                        var responseStream = await http.Response.fromStream(response);
                                                        final result = jsonDecode(responseStream.body) as Map<String, dynamic>;
                                                        if(result['status']=="SUCCESSFUL"){
                                                         
                                  children: snapshot.data!.docs.map((DocumentSnapshot document){
             
                                   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                                    data['statut']= true;
                            }).toList();
                                                           
                                                           SizedBox(height: 10);
                                                           Text("Bien");
                                                        }

                                                        if(result['status']=="FAILED"){
                                                          SizedBox(height: 10);
                                                           Text("False");

                                                        }

                                                        if(result['status']=="PENDING"){
                                                          SizedBox(height: 10);
                                                           Text("En cours");

                                                        }
                                                      }
                                                      else {
                                                        print(response.reasonPhrase);
                                                      }

                                           
                                           }, 
                                           child: const Padding(
                                             padding:  EdgeInsets.only(top:8.0),
                                             child:  Text("Paiement", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center,),
                                           )
                                                      
                                           ),
                                         ),
      ),
        const SizedBox(height: 15,),

              Text("Comment ça marche ?", style: TextStyle(color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
           
              const SizedBox(height: 15,),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("01", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),
                        Text("Cliquer Sur\nPaiement")
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("02",style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                        Text("Entrer Votre\nNumero")
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("03",style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                        Text("Valider Votre\nCode")
                      ],
                    )
                  ],
                ),
              ),

const SizedBox(height: 15,),
               Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDD287),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(top:16.0,left: 5),
                    child: Text("Votre paiement est valable 1 ans renouvelable",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                    ,),
                  ),
                    Padding(
                    padding: const  EdgeInsets.only(top:8.0,left: 5),
                    child: Text("Votre profil sera visible par tous nos visiteurs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                    ,),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 5),
                    child: Text("Et vous avez la possiblité de vendre un produit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                    ,),
                  ),
                  ],
                 ),
                ),
              ),
          ],
        ),
      ) 
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

  void _launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
}

