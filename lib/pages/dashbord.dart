// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:all_in_one/pages/argument.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {

 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final args = ModalRoute.of(context)!.settings.arguments as Argument;
      final CollectionReference _produitRef =  FirebaseFirestore.instance.collection("Prestataires");
    return Scaffold(
        appBar: AppBar(
        title: const Text("Dashbord du prestaire", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new,color: Colors.deepOrange))
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
                        image: AssetImage('assets/wom.png'),
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
                            Text("Bienvenue chèr(e) prestataire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
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
                        
                      
                          SizedBox(height: 10,),

              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30,10,30,0),
                padding: EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                 // border: Border.all(width: 1),
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  
                ),

                child: Text("Informations sur vos activités",style: TextStyle(color: Colors.black,fontSize: 16),textAlign: TextAlign.center,),
                
              
              ),

            
             ],
                  ),

                    SizedBox(height: 50,),

              Text("Pas encore disponible 404", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                        
          ],
        ),
      ),
    );
        
               
  }
}