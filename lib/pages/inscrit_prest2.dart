
// ignore_for_file: use_build_context_synchronously


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/authentification.dart';
import 'argument.dart';
import 'loading.dart';
import 'package:http/http.dart' as http;


class InscritPrestataire2 extends StatefulWidget {
  const InscritPrestataire2({super.key});

  @override
  State<InscritPrestataire2> createState() => _PrestataireState();
}

class _PrestataireState extends State<InscritPrestataire2> {

   bool loading = false;
    String diplome = '';
    String description = '';
    String categorie = '';
    String error = "";
    String? value;
    late String code = "";
    final _keyForm = GlobalKey<FormState>();

    Future<bool> check() async{
      bool statut = false;
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult == ConnectivityResult.mobile){
          return true;
      }
      else if(connectivityResult == ConnectivityResult.wifi){
         return true;
      }
      return false;
     
  }
  final AuthentificationService auth = AuthentificationService();
  CollectionReference prestataires =  FirebaseFirestore.instance.collection('Prestataires');

  final items = ['Plomberie','Electricité','Mecaniciens','Maconnerie','Menuisierie','Menagéres','Répetiteurs',
    'Coiffeurs','Infographes','Coiffeuses','Comptables','Financiers','Juristes','Informaticiens','Infirmiers','Chauffeurs',
    'Gardinnages','Jardiniers','Frigoriste','Marketing Digital','Blanchisseur','Manutention','Traducteur','Chaudronier',
    'Soudeur','Vitrier','Carreleur','BabySister','Avocat','Medecin','Déclarant en douane','Autres'];
  @override

   void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as Argus;
    return  loading ? const Loading() : Scaffold(
      appBar: AppBar(
        title: const Text("Inscription Prestataire", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prest'),
           icon: const Icon(Icons.arrow_back_ios_new,color: Colors.deepOrange))
        //automaticallyImplyLeading: false
      ),

        body:   SingleChildScrollView(
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
                      image: AssetImage('assets/sign.png'),
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
                          Text("Vous y êtes encore deux champs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),
                // const SizedBox(height: 2,),
              
                       Container(
                            // decoration: const BoxDecoration(
                            //    color: Colors.white,
                            //    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                            // ),
                                      child: Padding(
                          padding: const EdgeInsets.all(20),
           child: SingleChildScrollView(
             child: Form(
                             key : _keyForm,
                             child: Column(
           
           
                               children: [
           
                                //const SizedBox(height: 25,),
                                 const Text("Etape 3", style: TextStyle(color: Colors.red, fontSize: 14)),
           
           
                                
                           Container(
                               width: 400,
                               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              
                              decoration: BoxDecoration(
                                color: Colors.white,
                              //  borderRadius: BorderRadius.circular(25),
                               border: Border.all( color: Colors.blueGrey, width: 1)
                    
                                
                              ),
                            
                              child: DropdownButtonHideUnderline(
                                
                                child: DropdownButton<String>(
                                  value: value,
                                  iconSize:36,
                                  hint:const  Text("Categorie"),
                                  items: items.map(builMenuItem).toList(),
                                
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                                onChanged: (value) => setState(() => this.value = value)
                                ),
                              ),
                             
                                  ),
                    
           
                              const SizedBox(height: 20,),
                               TextFormField(
                                decoration:  const InputDecoration(
                                  labelText : "Description",
                                  hintText: "Entrez une bref description",
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(12),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide : BorderSide(color: Colors.blue, width: 1)
                                  ),
                                  focusedErrorBorder : OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1)
                                  ),
                                  errorBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1)
                                  ),
                                 
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                validator: (String ? val) => val!.isEmpty ? "Bref description" : null,
                                
                                onChanged: (val) => description = val,
                               ),
                      
                               const SizedBox(height: 30),
                                
                     
                                 Container(
                                     height: 48,
                                     width: double.maxFinite,
                                     decoration: BoxDecoration(
                                       color: Colors.deepOrange,
                                       borderRadius: BorderRadius.circular(5),
                                     ),
                                     child: InkWell(
                                         onTap: () async{
                     
                                       if(_keyForm.currentState!= null){
                                        // bool result = _keyForm.currentState!.validate();

                                        bool result = _keyForm.currentState!.validate();
                                        if(result){ 
                                         
                                         setState(()=> loading = true);
                                        
                                           bool connect = await check(); 
                                         
                                           if(connect){                                 
                                                var headers = {
                                                  'Content-Type': 'application/json'
                                                };
                                                var request = http.Request('POST', Uri.parse("https://www.campay.net/api/token/"));
                                                request.body = json.encode({
                                                  "username": "u7OW0a0L19cLZ59MO1s0p5yv5RWDEZUmEtwX9hytEtaSA3Dbw-HdVxswWHmjm5CXrB0vkZ5O4U7Aarr-p8CAbg",
                                                  "password": "wA_AcRApGISdeFlE5zWeEZQV24N2zCVIbZd6jLPaLmBVLlR4ZqrWDuM9MbR38djN9S3dcjkOTOBchLcJhJltJw"
                                                });
                                                request.headers.addAll(headers);

                                                http.StreamedResponse responses = await request.send();

                                                if (responses.statusCode == 200) {
                                                
                                                  var responseStream = await http.Response.fromStream(responses);
                                                  final result = jsonDecode(responseStream.body) as Map<String, dynamic>;

                                                  print(result['token']);
                                                  print("top gar");
                                                  


var headers = {
  'Authorization': "Token"+" "+result['token'],
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://www.campay.net/api/get_payment_link/'));
request.body = json.encode({
  "amount": "5",
  "currency": "XAF",
  "description": "Souscription a un abonnement sur ALL IN ONE 237",
  "external_reference": "",
  "redirect_url": ""
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  bool statut = false;
  dynamic resu = await auth.registerInWithEmailAndPassword(args.name,args.email, args.passe, args.tel,args.ville,args.quartier,value!,description,statut); 
 // print(await response.stream.bytesToString());
 

   var responseStream1 = await http.Response.fromStream(response);
  final result1 = jsonDecode(responseStream1.body) as Map<String, dynamic>;
  print(result1['link']);
  print("super");

  Navigator.pushReplacementNamed(context,'/paiement', arguments: Argume(token:result['token'] ,link: result1['link'], phone: args.tel));
}
else {
  print(response.reasonPhrase);
  print("errorrrrr");
}




                                                }
                                                else {
                                                  print(responses.reasonPhrase);
                                                  print("rien de bon");
                                                }
                                                                                          




                                      //         bool aff = false;
                                      //         dynamic result = await auth.registerInWithEmailAndPassword(args.name,args.email, args.passe, args.tel,args.ville,args.quartier,value!,description,aff); 
                                      //         //result = null;
                                      //         print(args.name + args.email);
                                      //         if(result == null)
                                      //           {
                                      //             setState(() {
                                      //               loading = false;
                                                    
                                      //                erroSnackBar(context, 'Erreur dans le format de données');
                                      //             });
                                      //           }
                                      //         else{
                                      //              ValideSnackBar(context, 'Création du compte avec succès');
                                      //               // ignore: use_build_context_syn
                                      //               // chronously
                                      //               Navigator.pushReplacementNamed(context, '/paiement');
                                      //             }   
                                             
                                      //      }else{
                                      //         erroSnackBar(context, 'Vérifier si vous êtes bien connecter à internet');
                                      //      }
                                           }
                                       }
                                         
                                       }
                                     
                                     }, 
                                     child: const Padding(
                                       padding:  EdgeInsets.only(top:10.0),
                                       child:  Text("Enregistrer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                     )
                     
                                     ),
                                   ),
                     
                                 
                               ],
                             ),
                           ),
           )
                    
                    
                          ),
                              ),
                           
                    
            ],
          
          ),
        ),
    
    );
    
  }



}

  DropdownMenuItem<String>builMenuItem(String item) => DropdownMenuItem
  (
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    ),
    );
