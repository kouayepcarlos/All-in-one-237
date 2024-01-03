
import 'package:all_in_one/pages/cate_accessoire.dart';
import 'package:all_in_one/pages/cate_aliment.dart';
import 'package:all_in_one/pages/cate_autre.dart';
import 'package:all_in_one/pages/cate_bijoux.dart';
import 'package:all_in_one/pages/cate_blanc.dart';
import 'package:all_in_one/pages/cate_chaussure.dart';
import 'package:all_in_one/pages/cate_document.dart';
import 'package:all_in_one/pages/cate_machine.dart';
import 'package:all_in_one/pages/cate_montre.dart';
import 'package:all_in_one/pages/cate_multimedia.dart';
import 'package:all_in_one/pages/cate_parfum.dart';
import 'package:all_in_one/pages/cate_rouge.dart';
import 'package:all_in_one/pages/cate_telephone.dart';
import 'package:all_in_one/pages/cate_vetement.dart';
import 'package:all_in_one/pages/cate_whisky.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
         backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Market Place",style: TextStyle(color:Colors.deepOrange, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/produit'),
           icon: const Icon(Icons.arrow_back_ios_new,color: Colors.deepOrange,))
       
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
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
                      Text("Découvrez nos catalogues de produit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              ),


              const SizedBox(height: 10,),

              Container(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Categorie Shoping", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 17),),
                        Text("All", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),

                    SizedBox(height:20),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 150,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                           
                            CategoriePrestation(tilte: "Chaussures", img: "assets/chaussure.jpeg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieChaussure()));}, ),
                            CategoriePrestation(tilte: "Vêtements", img: "assets/vet.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieVetement()));}, ),
                            CategoriePrestation(tilte: "Montres", img: "assets/montre.jpeg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMontre()));}, ),
                            CategoriePrestation(tilte: "Bijoux", img: "assets/bijou.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieBijoux()));}, ),
                            CategoriePrestation(tilte: "Parfuns", img: "assets/parfun.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieParfum()));}, ),
                            
                        ],
                      ),
    
                    ),

                      SizedBox(height: 20,),

                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Categorie Électronique", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),),
                        Text("All", style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),

                    SizedBox(height:20),
                    Container(
                      height: 150,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                            CategoriePrestation(tilte: "Téléphones", img: "assets/phone.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieTelephone()));}, ),
                            CategoriePrestation(tilte: "Machines", img: "assets/ordi.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMachine()));}, ),
                            CategoriePrestation(tilte: "Documents", img: "assets/document.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieDocument()));}, ),
                            CategoriePrestation(tilte: "Multimédia", img: "assets/ordi.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieMultimedia()));}, ),
                            CategoriePrestation(tilte: "Accessoires", img: "assets/manager.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieAccessoire()));}, ),
                           
                        ],
                      ),
      
                    ),
                      SizedBox(height: 20,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Catégorie Alimentaires", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 17),),
                        Text("All",style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),

                    SizedBox(height:20),
                    Container(
                      height: 150,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                            CategoriePrestation(tilte: "Vins Blancs", img: "assets/blanc.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieBlanc()));}, ),
                            CategoriePrestation(tilte: "Vins Rouges", img: "assets/vin-rouge.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieRouge()));}, ),
                            CategoriePrestation(tilte: "Whisky", img: "assets/whisky.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieWhisky()));}, ),
                            CategoriePrestation(tilte: "Aliments", img: "assets/aliment.png", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieAliment()));}, ),
                            CategoriePrestation(tilte: "Autres", img: "assets/manager.jpg", press: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorieAutre()));}, ),
                           
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
                decoration: const BoxDecoration(
                 // border: Border.all(width: 1),
                  color: Color(0xFFFDD287),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  
                ),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 20,),
                    const Text("All in one 237 une application 2 en 1.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                   const SizedBox(height: 10,),
                  const  Text("Mettant à votre disposition des meilleures professionnelles.",style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold)),
                   const SizedBox(height: 10,),
                   const Text("Et des meilleurs articles du 237",style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                   const SizedBox(height: 10,),
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
                                    padding: EdgeInsets.only(top: 60),
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


