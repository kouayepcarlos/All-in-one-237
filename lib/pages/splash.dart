// ignore_for_file: dead_code

import 'package:all_in_one/pages/prestation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   final Controller = LiquidController();
   int currentPage = 0;
   final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // ignore: non_constant_identifier_names
   
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: Controller,
             onPageChangeCallback: OnPageChangeCallback,
            pages: [
              Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children:  [
                    Image(image: const AssetImage('assets/service.png'), height: size.height * 0.4,),

                    Column(
                      children: 
                      const [
                         Text("Bienvenu sur All in one 237", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold, fontSize: 20)),
                         SizedBox(height: 20,),
                         Text("Une application qui vous permettra d'acheter ou de vendre un service", style: TextStyle(fontSize: 16),)
                      ],
                    
                    ),
                   const SizedBox(height: 60,),
                   const Text("1/3", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold),),
                  // const SizedBox(height: 20,),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                color: const Color.fromARGB(255, 203, 227, 247),
                child: Column(
                  children: [
                    const SizedBox(height:20),
                     Image(image: const AssetImage('assets/maker.png'), height: size.height * 0.45,),
                     const SizedBox(height:10),
                    Column(
                      children: const[
                         Text("Vous avez besoin d'un service",style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold, fontSize: 20)),
                         SizedBox(height: 20,),
                         Text("Pour tous vos problèmes de réparations, d'entretiens, de coaching, de marketing, de remise a niveau, d'achat de produits, cours de langue, chauffeur etc. alors vous êtes au bon endroit.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                      ],
                    ),
                    const SizedBox(height: 135,),
                    const Text("2/3", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              Container(
                 padding: const EdgeInsets.all(5),
                color:  Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height:20),
                     Image(image: const AssetImage('assets/colla.png'), height: size.height * 0.45,),
                     const SizedBox(height:5),
                    Column(
                      children: const[
                         Text("Vous avez une compétence",style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold,fontSize: 20)),
                         SizedBox(height: 20,),
                         Text("Vous êtes techniciens dans un domaine où vous avez des produits à vendre alors cette d'application est idéal enfin de mettre vos compétences à la portée de tous.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
                       
                      ],
                    ),
                    const SizedBox(height: 160,),
                    const Text("3/3", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                  ],
                ),
              )
            ],
            //slideIconWidget: const Icon(Icons.arrow_back_ios_new),
            //enableSideReveal: true,

            
            ),

            Positioned(
              bottom: 60,
              child: OutlinedButton(
                onPressed: (){
                  int nextPage = Controller.currentPage + 1;
                  Controller.animateToPage(page: nextPage);

                  if(nextPage == 3){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder : (context) =>  const Prestation(),
                    ));
                 }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  side: const BorderSide(color: Colors.black26),
                  onPrimary:  Colors.white
                ),

                child: Container(

                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                  ),
                  child:  const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),

            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: (){
                 // Controller.jumpToPage(page: 2);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder : (context) =>  const Prestation(),
                  ));
                }, 
                child: const Text("Sauter", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),))
              ),


              Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  activeIndex: Controller.currentPage, 
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: Colors.black26,
                    dotHeight: 5
                  ),
                  
                  ) 
                )
        ],
      )
    );


  }
     // ignore: non_constant_identifier_names
     void OnPageChangeCallback(int Activepage){
     setState(() {
        currentPage = Activepage;
     });
  }
 
}