// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, unused_import, prefer_if_null_operators

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
import 'argument.dart';
import 'global.dart';
import 'loading.dart';



class AjoutProduit1 extends StatefulWidget {
  const AjoutProduit1({super.key});

  @override
  State<AjoutProduit1> createState() => _AjoutProduit1State();
}

class _AjoutProduit1State extends State<AjoutProduit1> {


  final _keyForm = GlobalKey<FormState>();
  List<Asset> images = [];
  String _error = 'No Error Dectected';
  bool loading =false;
  String error = '';
  String? value;
  String description = "";
  bool isHidden = true;

  List<String> urlImage =[];
  String phone = '';

  final items = ['Vêtements','Documents','Electromenegers','Téléphones','Ordinateurs','Accesoires','Multimédias',
    'Bijoux','Chaussures','Parfuns','Vin Blanc','Vin Rouge','Whisky','Autres'];
  
  
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
Future<void> loadAssets() async {
    List<Asset> resultList = [];
    String error = 'No Error Detected';

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      print(error);
      print("C'est ca gar");
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
     // _error = error;
    });
  }
 Widget buildGridView1() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Argum;
    return loading ? Loading():Scaffold(
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

                               const Text("Etape 2"),
                            
                               
                           const SizedBox(height: 10,),
                            
                               TextFormField(
                              decoration:  const InputDecoration(
                                 labelText : "description",
                                 hintText: "Decription du produit",
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
                             validator: (String ? val) => val!.isEmpty ? "Veuillez entrer une description du produit" : null,
                            onChanged : (val) => description = val,
                             ),
                               const SizedBox(height: 20,),
                             Container(
                             width: 400,
                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            
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
      
                             const SizedBox(height: 20),
                               Container(
                                   height: 48,
                                   width: double.maxFinite,
                                   decoration: BoxDecoration(
                                     color: Colors.orangeAccent,
                                     //  border: Border.all( color: Colors.orange, width: 1),
                                     borderRadius: BorderRadius.circular(5),
                                   ),
                                  //  child: ElevatedButton(
                                  //      onPressed: loadAssets,
                                  //   child: const Text("Images du produit")
          
                                  //  ),
                                  child: IconButton(onPressed: loadAssets, icon: const Icon(Icons.add_a_photo, size: 30,color: Colors.white,)),
                                 ),
           const SizedBox(height: 15),

         //  buildGridView1(),

           Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              
              child: GridView.count(
               physics: const NeverScrollableScrollPhysics(),
               scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,          
                  
                   children: List.generate(images.length, (index) {
                Asset asset = images[index];
                return AssetThumb(
                  asset: asset,
                  width: 200,
                  height: 200,
                );
                   }),
                 ),
            ),
           
          
            const SizedBox(height: 0),
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
                                                 bool connect = await check();
                                                  if(connect){ 
                                               setState(()=> loading = true);
                                                                   
                                            DocumentReference produit = await FirebaseFirestore.instance.collection('Produit').add({
                                                    'nom' : args.name,
                                                    'prix' : args.prix,
                                                    'phone' : args.tel,
                                                    'description' : description,
                                                    'categorie' : value,            
                                                    'url' : '',
                                               });
                                    
                                    
                                               final fileNames = <String>[];
                                                for (final image in images) {
                                                  final fileName = await UploadImage(image);
                                                  fileNames.add(fileName);
                                                }
                                                                              
                            
                                                produit.update({
                                                        'url' : fileNames,
                                                     });
                                                 Navigator.pushReplacementNamed(context, '/ajout');
                                                  ValideSnackBar(context, 'Produit ajouté avec succès');
                                                                   
                                             }else{
                                               erroSnackBar(context, 'Vérifier votre connexion internet');
                                             }
                                             }
                                           }
                                        
                                         
                                         }, 
                                         child: const Text("Enregistrer")
                                             
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
                          ),


          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    
    return GridView.count(
       physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: .85,
      
       
     
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  DropdownMenuItem<String>builMenuItem(String item) => DropdownMenuItem
  (
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    ),
    );


Future UploadImage(Asset asset) async {
String? fileName = asset.name != null? asset.name : 'img';
ByteData byteData = await asset.getByteData();
List<int> imageData = byteData.buffer.asUint8List();
Reference ref = FirebaseStorage.instance.ref().child(fileName!);
UploadTask uploadTask = ref.putData(Uint8List.fromList(imageData));

  TaskSnapshot snapshot= await uploadTask;
  String url= await snapshot.ref.getDownloadURL();

    print(url);
  
  ///       After this Update user Profile or add url to collection


return url;


}
}