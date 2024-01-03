// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:all_in_one/loginVendeur.dart';
import 'package:all_in_one/pages/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'global.dart';
import 'inscrit_vend.dart';
import 'market.dart';



class Produit extends StatefulWidget {
  const Produit({super.key});

  @override
  State<Produit> createState() => _ProduitState();
}

class _ProduitState extends State<Produit> {

   void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }



  @override

  
  Widget build(BuildContext context) {
      final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
     return  Scaffold(
       appBar: AppBar(
        title: const Text("Market Place", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
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
                        image: AssetImage('assets/vente.png'),
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
                            Text("Hello, Bienvenue sur la Market place", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Text("Comment ça marche ?", style: TextStyle(color: Colors.deepOrange, fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ),
                      
                    

                          // const SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("01", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder : (context) => const Market(),
                                ));
                            },
                            child: const Text("Visiter la\nMarket place", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepOrange), textAlign: TextAlign.center,)),
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("02",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        InkWell(
                            onTap: (){
                              // if(currentUser!.email !=null){
                              //   ValideSnackBar(context, 'Vous êtez déjà Connecter');
                              //              // ignore: use_build_context_synchronously
                              //              Navigator.pushReplacementNamed(context, '/ajout');

                              // }else{
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginVendeur()));
                             // }
                             
                            },
                            child: const Text("Vendre dans\nLa market place", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue ), textAlign: TextAlign.center,)),
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("03",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                         InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder : (context) => const Contact(),
                                ));
                            },
                            child: const Text("En savoir\nPlus", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange), textAlign: TextAlign.center,)),
                      ],
                    )
                  ],
                ),
              ),

                
                        //  const Padding(
                // padding:  EdgeInsets.all(8.0),
                // child:  Text("  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.justify,),
                //           ),
                          const SizedBox(height: 20,),
                        //    InkWell(
                        //     onTap: (){
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //           builder : (context) => const Market(),
                        //         ));
                        //     },
                        //     child: const Text("Visiter la Market place", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepOrange), textAlign: TextAlign.center,)),
                        //   const SizedBox(height: 20,),
                        //   InkWell(
                        //     onTap: (){
                        //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginVendeur()));
                        //     },
                        //     child: const Text("Vendre dans la market place", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue ), textAlign: TextAlign.center,)),
                        // const SizedBox(height: 30,),
          Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDD287),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(top:16.0,left: 5),
                    child: Text("Une plateforme qui vous permet de vendre ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const  EdgeInsets.only(top:8.0,left: 5),
                    child: Text("Ou d'acheter un produit en quelques clics ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 5),
                    child: Text("Tout en etant chez vous.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                  ],
                 ),
                ),
              ),
                         const SizedBox(height: 30,),     
                          Row(
                children: [
                 const Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: const Icon(Icons.shopping_bag, color: Colors.white,),
                    ),
                    const SizedBox(width: 6,),


                      Container(
                      width: 60,
                      height: 60,
                      color: Colors.black,
                      child: const Icon(Icons.shopify_sharp, color: Colors.white,),
                    ),
                             const SizedBox(width: 6,),
                    
                    
                      Container(
                      width: 60,
                      height: 60,
                      color: Colors.deepOrange,
                      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                    ),
                     const SizedBox(width: 6,),
                    
                      Container(
                      width: 60,
                      height: 60,
                      color: Colors.blue,
                      child: const Icon(Icons.shopping_basket_sharp, color: Colors.white,),
                    ),
                     const SizedBox(width: 6,),
                    
                      Container(
                      width: 60,
                      height: 60,
                      color: Colors.amber,
                      child: const Icon(Icons.shopping_cart_sharp, color: Colors.white,),
                    ),
                ],
                          )
              
          ],
          ),
      )
    
    );
  }
}