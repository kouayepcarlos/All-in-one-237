import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CategorieRouge extends StatefulWidget {
  const CategorieRouge({super.key});

  @override
  State<CategorieRouge> createState() => _CategorieRougeState();
}

class _CategorieRougeState extends State<CategorieRouge> {
      final Stream<QuerySnapshot> _produitRef = FirebaseFirestore.instance.collection('Produit').where('categorie', isEqualTo: "Vin Rouge").snapshots();
  @override
  Widget build(BuildContext context) {
    return 
Container(
        child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _produitRef,
              builder: (BuildContext context, snapshot){
   
             if(snapshot.hasData){
              print(snapshot.hasData);

                
    
    
    
    return Scaffold(
             appBar: AppBar(
        title: const Text("Catégorie Vin Rouge", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/market'),
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
                        image: AssetImage('assets/vin-rouge.jpg'),
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
                            Text("Retrouvez les meilleurs Vin Rouge", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),

                Padding(
                                     padding: const EdgeInsets.fromLTRB(12,8,12,0),
                                     child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: const [
                                                           Text("Catégorie Vin Rouge", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),),
                                                           Text("All", style: TextStyle(fontWeight: FontWeight.bold))
                                                         ],
                                                       ),
                                   ),
          ],
        ),
      ),
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
}



class CategoryProdut extends StatelessWidget {
  String tilte="";
  String img="";
  VoidCallback? press;


  String prix;
   // ignore: use_key_in_widget_constructors
   CategoryProdut({
     required this.tilte,
    required this.img,
    required this.press,
    required this.prix,

  }) ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        // borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.fromLTRB(5,3,5,3),
          
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Colors.blueGrey,
              width: 3,
        
            ),
             
            boxShadow: const [
              BoxShadow(
                offset: Offset(0,17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.blueGrey,
              )
            ]
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  const Spacer(),
                  const SizedBox(height: 0,),
                  Text(tilte, textAlign: TextAlign.center,style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Expanded(child: Image.network(img,height: 250, width: 400,)),
                 const SizedBox(height: 2,),
                 Text(prix, textAlign: TextAlign.center,style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.deepOrange))
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}

