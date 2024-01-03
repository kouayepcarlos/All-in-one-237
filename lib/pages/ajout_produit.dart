// ignore_for_file: prefer_const_constructors

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

import 'argument.dart';



class AjoutProduit extends StatefulWidget {
  const AjoutProduit({super.key});

  @override
  State<AjoutProduit> createState() => _AjoutProduitState();
}

class _AjoutProduitState extends State<AjoutProduit> {

  List<Asset> images = [];
  String _error = 'No Error Dectected';
  bool loading =false;
  String error = '';
  String? value;
  bool isHidden = true;
  String nameProduit="";
  String prix ="";

  List<String> urlImage =[];
  String phone = '';
final _keyForm = GlobalKey<FormState>();

  final items = ['vêtements','Documents','Electromenegers','Téléphone','Ordinateurs','Accesoires','Multimedias',
    'Bijoux','Chaussures','Parfums','Voiture','Terrain','Location','Moto','Autres'];
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout Produit", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
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
                      image: AssetImage('assets/makert.png'),
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
                          Text("Ajouter un produit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),

                Container(
                            
                                           child: Padding(
                          padding: const EdgeInsets.all(20),
                                

                
               child: Form(
                     key: _keyForm,
                         
                           child: Column(
                             children: [
                               
                               const Text("Etape 1"),
                               SizedBox(height: 10,),
                               
                             TextFormField(
                              decoration:  const InputDecoration(
                                labelText : "Nom du produit",
                                hintText: "Entrez le nom du produit",
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
                              validator: (String ? val) => val!.isEmpty ? "Veuillez entrer le nom du produit" : null,
                              
                              onChanged: (val) => nameProduit = val,
                             ),
                             const SizedBox(height: 20,),

                             TextFormField(
                              decoration:  const InputDecoration(
                                labelText : "Prix",
                                hintText: "Entrez le prix du produit",
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
                              validator: (String ? val) => val!.isEmpty ? "Veuillez entrer le prix du produit" : null,
                              
                              onChanged: (val) => prix = val,
                             ),
const SizedBox(height: 20,),

                               TextFormField(
                              decoration:  const InputDecoration(
                                labelText : "Numero",
                                hintText: "Entrez le numero à contacter en cas de besoin",
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
                              validator: (String ? val) => val!.isEmpty ? "Veuillez entrer le numero" : null,
                              
                              onChanged: (val) => phone = val,
                             ),

                      
                           const SizedBox(height: 30,),
                           
                               Container(
                                   height: 48,
                                   width: double.maxFinite,
                                   decoration: BoxDecoration(
                                     color: Colors.blue,
                                     borderRadius: BorderRadius.circular(5),
                                   ),
                                   child: ElevatedButton(
                                       onPressed: () async{
          
                                     if(_keyForm.currentState!= null){
                                       bool result = _keyForm.currentState!.validate();
                                       if(result){ 

                                          print(nameProduit);
                                          print(prix);
                                          
                                          print(phone);
                                          Navigator.pushReplacementNamed(context,'/ajout1', arguments: Argum(name: nameProduit, prix: prix, tel: phone));
                                     
                                       }
                                       
                                     }
                                  
                                   
                                   }, 
                                   child: const Text("Suivant")
          
                                   ),
                                 ),
          
                                 const SizedBox(height: 15,),
                                 Text(error,
                                 style: const TextStyle(color: Colors.red, fontSize: 16,),),
                                 const SizedBox(height: 15,),
          
                              
                             ],
                           ),
                         )
              



                                    )

                )
          ],
        ),
      ),
    );
  }

  
}