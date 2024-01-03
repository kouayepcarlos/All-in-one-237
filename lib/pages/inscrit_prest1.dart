import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'argument.dart';



class InscritPrestataire1 extends StatefulWidget {
  const InscritPrestataire1({super.key});

  @override
  State<InscritPrestataire1> createState() => _PrestataireState();
}

class _PrestataireState extends State<InscritPrestataire1> {


  String ville = '';
  String phone = '';
  String quartier = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading =false;
  String error = '';
  bool isHidden = true;
  @override

   void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Argu;
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Inscription Prestataire", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
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
                          Text("S'inscrit comme prestataire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
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
                                 const Text("Etape 2", style: TextStyle(color: Colors.deepOrange, fontSize: 14)),
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
                                  labelText : "Ville",
                                  hintText: "Entrez votre ville de resisdence",
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
                                validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre ville" : null,
                                
                                onChanged: (val) => ville = val,
                               ),
                               const SizedBox(height: 20,),
                       
                               TextFormField(
                                decoration:  const InputDecoration(
                                  labelText : "Quartier",
                                  hintText: "Entrez votre quartier de resisdence",
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
                                validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre quartier" : null,
                                
                                onChanged: (val) => quartier = val,
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
                                         bool result = _keyForm.currentState!.validate();
                                         if(result){ 
                       
                                            print(args.name);
                                            print(args.email);
                                            print(args.passe);
                                            print(ville);
                                            print(phone);
                                            print(quartier);
                                            Navigator.pushReplacementNamed(context,'/prest2', arguments: Argus(name: args.name, email: args.email, passe:args.passe, tel: phone, ville: ville, quartier: quartier));
                                       
                                         }
                                         
                                       }
                                    
                                     
                                     }, 
                                      child: const Padding(
                                       padding:  EdgeInsets.only(top:10.0),
                                       child:  Text("Suivant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                     )
                                 
                                     ),
                                   ),
                                 
                                   const SizedBox(height: 15,),
                                   Text(error,
                                   style: const TextStyle(color: Colors.red, fontSize: 16,),),
                                   const SizedBox(height: 15,),
                                 
                                
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

   void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }


}
