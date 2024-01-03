// ignore_for_file: prefer_const_constructors

import 'package:all_in_one/pages/cate_avocat.dart';
import 'package:all_in_one/pages/cate_babysister.dart';
import 'package:all_in_one/pages/cate_blanchisseur.dart';
import 'package:all_in_one/pages/cate_carreleur.dart';
import 'package:all_in_one/pages/cate_chauffeur.dart';
import 'package:all_in_one/pages/cate_coiffeur.dart';
import 'package:all_in_one/pages/cate_coiffeuse.dart';
import 'package:all_in_one/pages/cate_douanier.dart';
import 'package:all_in_one/pages/cate_electricite.dart';
import 'package:all_in_one/pages/cate_financier.dart';
import 'package:all_in_one/pages/cate_frigoriste.dart';
import 'package:all_in_one/pages/cate_gardinnage.dart';
import 'package:all_in_one/pages/cate_infirmier.dart';
import 'package:all_in_one/pages/cate_info.dart';
import 'package:all_in_one/pages/cate_jardinerie.dart';
import 'package:all_in_one/pages/cate_juriste.dart';
import 'package:all_in_one/pages/cate_maconnerie.dart';
import 'package:all_in_one/pages/cate_maketing.dart';
import 'package:all_in_one/pages/cate_mecanique.dart';
import 'package:all_in_one/pages/cate_menagere.dart';
import 'package:all_in_one/pages/cate_menuiserie.dart';
import 'package:all_in_one/pages/cate_plomberie.dart';
import 'package:all_in_one/pages/cate_repetiteur.dart';
import 'package:all_in_one/pages/navigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Prestation extends StatefulWidget {
  const Prestation({super.key});

  @override
  State<Prestation> createState() => _PrestationState();
}

class _PrestationState extends State<Prestation> {
  @override
  Widget build(BuildContext context) {
   
    
    return  Scaffold(
      drawer:  NavigationDrawers(),
      appBar : AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange,),
        title: Text("Nos prestation de services",style: TextStyle(color:Colors.deepOrange, fontWeight: FontWeight.bold)),
       // title: Image.asset('assets/'),
         backgroundColor : Colors.white,
        elevation: 0,
        centerTitle: true,
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.all(2),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/service.png'),
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
                      Text("Découvrez nos catalogues de service", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              ),


              SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.all(20),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Categorie Reparation", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 17),),
                        Text("All", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),

                    SizedBox(height:20),
                    Container(
                      height: 150,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                           
                            CategoriePrestation(tilte: "Électricité", img: "assets/elect.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieElectricite()));}, ),
                            CategoriePrestation(tilte: "Maçonnerie", img: "assets/macon.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMaconnerie()));}, ),
                            CategoriePrestation(tilte: "Menuiserie", img: "assets/menuserie.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMenuiserie()));}, ),
                            CategoriePrestation(tilte: "Mécanique", img: "assets/mecan.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMecanique()));}, ),
                            CategoriePrestation(tilte: "Jardinerie", img: "assets/jardi.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieJardinerie()));}, ),
                            CategoriePrestation(tilte: "Frigoriste", img: "assets/colla.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieFrigoriste()));}, ),
                            CategoriePrestation(tilte: "Carreleur", img: "assets/carr.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieCarreleur()));}, ),
                            CategoriePrestation(tilte: "Plomberie", img: "assets/plom.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategoriePLomberie()));}, ),
                        ],
                      ),
    
                    ),

                      SizedBox(height: 20,),

                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Categorie Ménagère", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),),
                        Text("All", style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),

                    SizedBox(height:20),
                    Container(
                      height: 150,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                            CategoriePrestation(tilte: "Gardinnage", img: "assets/garde.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieGardinnage()));}, ),
                            CategoriePrestation(tilte: "Chauffeur", img: "assets/chauffe.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieChauffeur()));}, ),
                            CategoriePrestation(tilte: "Blanchisseur", img: "assets/blanchi.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieBlanchisseur()));}, ),
                            CategoriePrestation(tilte: "BabySister", img: "assets/baby.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieBabysister()));}, ),
                            CategoriePrestation(tilte: "Coiffeur", img: "assets/hon.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieCoiffeur()));}, ),
                            CategoriePrestation(tilte: "Coiffeuse", img: "assets/coiffese.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieCoiffeuse()));}, ),
                            CategoriePrestation(tilte: "Ménagère", img: "assets/menagere.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMenagere()));}, ),
                        ],
                      ),
      
                    ),
                      SizedBox(height: 20,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Catégorie Professionnelle", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 17),),
                        Text("All",style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),

                    SizedBox(height:20),
                    Container(
                      height: 150,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                            CategoriePrestation(tilte: "Financier", img: "assets/finance.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieFiancier()));}, ),
                            CategoriePrestation(tilte: "Informaticien", img: "assets/info.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieInformatique()));}, ),
                            CategoriePrestation(tilte: "Marketing", img: "assets/makerting.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMarketing()));}, ),
                           // CategoriePrestation(tilte: "BabySister", img: "assets/baby.jpg", press: (){}, ),
                            CategoriePrestation(tilte: "Juriste", img: "assets/juriste1.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieJuriste()));}, ),
                            CategoriePrestation(tilte: "Avocat", img: "assets/avocat.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieAvocat()));}, ),
                            CategoriePrestation(tilte: "Répétiteur", img: "assets/repeti.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieRepetiteur()));}, ),
                            CategoriePrestation(tilte: "Infirmier", img: "assets/patient.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieInfirmier()));}, ),
                            CategoriePrestation(tilte: "Douanier", img: "assets/douanier.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieDouanier()));}, ),
                        ],
                      ),
          
                    ),









                  ],
                ),
              ),

              SizedBox(height: 20,),

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
                    Text("Mettant à votre disposition des meilleures professionnelles.",style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Text("Et des meilleurs articles du 237",style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Rating(),
                  ],
                ),
              )
          ],
        ),
      ),
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

}


class CategoriePrestation extends StatelessWidget {

  String tilte="";
  String img="";
  VoidCallback? press;
   // ignore: use_key_in_widget_constructors
   CategoriePrestation({
     required this.tilte,
    required this.img,
    required this.press,
  }) ;
  

  @override
  Widget build(BuildContext context) {
    return 
             AspectRatio(
                            aspectRatio: 3/3,
                            child: InkWell(
                              onTap: press,
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                               
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(),
                                    //  boxShadow: const [
                                    //   BoxShadow(
                                    //     offset: Offset(0,17),
                                    //     blurRadius: 17,
                                    //     spreadRadius: -23,
                                    //    color: Colors.blueGrey,
                                    //   )
                                    // ],
                                  image: DecorationImage(
                                    image: AssetImage(img),
                                    fit: BoxFit.cover
                                    )
                                ),
                            
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //   gradient: LinearGradient(
                                  //     begin: Alignment.bottomRight,
                                  //     colors: [
                                  //       Colors.black.withOpacity(.9),
                                  //       Colors.black.withOpacity(.0)
                                  //     ])
                                  // ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(tilte, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                 )
                            
                              ),
                            ), 
                            );
  }
}


