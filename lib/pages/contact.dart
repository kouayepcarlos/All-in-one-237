// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'global.dart';
import 'loading.dart';



class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  String description = '';
  String phone = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading = false;
   void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: const Text("Commentaire Utilisateur",style: TextStyle(color:Colors.deepOrange, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange,))
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
                      image: AssetImage('assets/contact.png'),
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
                          Text("Laissez nous un commentaire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
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
           
                              //  const SizedBox(height: 25,),
                                 const Text("Contactez Nous aux +237 697723063", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
           
                                  const SizedBox(height: 15,),
                            TextFormField(
                                decoration:  const InputDecoration(
                                   labelText : "Phone",
                                   hintText: "Numero téléphone",
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
                               validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre numero" : null,
                              onChanged : (val) => phone = val,
                               ),
                             const SizedBox(height: 20,),
                  
                               TextFormField(
                                decoration:  const InputDecoration(
                                  labelText : "Description",
                                  hintText: "Commentaire",
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
                                       color: Colors.blueAccent,
                                       borderRadius: BorderRadius.circular(5),
                                     ),
                                     child: InkWell(
                                         onTap: () async{
                     
                                       if(_keyForm.currentState!= null){
                                        // bool result = _keyForm.currentState!.validate();


                                            bool result = _keyForm.currentState!.validate();

                                         if(result){

                                          setState(()=> loading = true);

                                          await FirebaseFirestore.instance.collection('Contacts').add({
                                            'phone' : phone,
                                            'message' : description
                                          });

                                         
                                           Navigator.pushReplacementNamed(context, '/prestation');
                                          ValideSnackBar(context, 'Message envoyer avec succès');
                                         }
                                         
                                       }
                                     
                                     }, 
                                     child: const Padding(
                                       padding:  EdgeInsets.only(top:10.0),
                                       child:  Text("Envoyer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
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