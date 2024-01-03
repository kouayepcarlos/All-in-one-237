import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'argument.dart';



class InscritPrestataire extends StatefulWidget {
  const InscritPrestataire({super.key});

  @override
  State<InscritPrestataire> createState() => _PrestataireState();
}

class _PrestataireState extends State<InscritPrestataire> {


  String nom = '';
  String email = '';
  String password = '';
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
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Inscription Prestataire", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new,color: Colors.deepOrange,))
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
                                       // const SizedBox(height: 25,),
                                        const Text("Etape 1", style: TextStyle(color: Colors.deepOrange, fontSize: 14)),
                                     TextFormField(
                                        decoration:  const InputDecoration(
                                           labelText : "Nom",
                                           hintText: "Entrez votre mot nom",
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
                                       validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre nom" : null,
                                      onChanged : (val) => nom = val,
                                       ),
                                     const SizedBox(height: 20,),
                                         
                                       TextFormField(
                                        decoration:  const InputDecoration(
                                          labelText : "Email",
                                          hintText: "Entrez votre email",
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
                                        validator: (val) =>val != null && !EmailValidator.validate(val) ? "Veuillez entrer votre email valide" : null,
                                        
                                        onChanged: (val) => email = val,
                                       ),
                                       const SizedBox(height: 20,),
                                     TextFormField(
                                         obscureText: isHidden,
                                        decoration:  InputDecoration(
                                          suffix : InkWell(
                                              onTap: _togglePasswordView,
                                              child : const Icon(Icons.visibility),
                                          ),
                                          labelText : "Mot Passe",
                                          hintText: "Entrez votre mot passe",                      
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: const EdgeInsets.all(12),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide : BorderSide(color: Colors.blue, width: 1)
                                          ),
                                          focusedErrorBorder : const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),                       
                                        ),
                                                      
                                        validator: (String ? val) => val!.length < 6 ? "Vous devez fournir un passe au moins a 6 caractere": null,
                                        onChanged: (val) => password = val,
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
                                                
                                                    print(nom);
                                                    print(email);
                                                    print(password);
                                                    Navigator.pushReplacementNamed(context,'/prest1', arguments: Argu(name: nom, email: email, passe:password));
                                               
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Scaffold(

    //     body: Container(
    //               width: double.maxFinite,
    //               height: double.maxFinite,
    //                   decoration: const BoxDecoration(
    //                     gradient: LinearGradient(
    //                       begin: Alignment.topCenter,
    //                       colors: [
    //                         Colors.orange,
    //                         Colors.deepOrange,
    //                         Color.fromARGB(255, 163, 71, 9)
    //                       ]
    //                     )
    //                   ),
                      
    //                   child: Column(
                        
                        
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
              
    //                     const SizedBox(height: 20,),                  
    //                        Positioned(
                            
    //                         top: 10,
                            
    //                         //width: -90,
    //                          child:
                              
    //                           IconButton(
    //                                onPressed: ()=> Navigator.pushReplacementNamed(context, '/splash'),
    //                                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
                              
                                 
    //                        ),
    //                        // const SizedBox(height: 60,), 
    //                        Padding(
    //                         padding: const EdgeInsets.all(20),
    //                         child: Column(
    //                           children: const[
    //                              Text("S'inscrit comme prestataire", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)
    //                           ],
    //                         ),
    //                         ),
                  
    //                         const SizedBox(height: 60,),
                  
    //                         Expanded(
                              
    //                           child: Container(
    //                             decoration: const BoxDecoration(
    //                                color: Colors.white,
    //                                borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
    //                             ),
    //                             child: Padding(
    //                               padding: const EdgeInsets.all(20),
    //                               child: SingleChildScrollView(
    //                                 child: Form(
    //                                  key : _keyForm,
    //                                  child: Column(
    //                                    children: [
    //                                     const SizedBox(height: 25,),
    //                                     const Text("Etape 1", style: TextStyle(color: Colors.deepOrange, fontSize: 14)),
    //                                  TextFormField(
    //                                     decoration:  const InputDecoration(
    //                                        labelText : "Nom",
    //                                        hintText: "Entrez votre mot nom",
    //                                       fillColor: Colors.white,
    //                                       filled: true,
    //                                       contentPadding: EdgeInsets.all(12),
    //                                       enabledBorder: OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.blueGrey, width: 1),
    //                                       ),
    //                                       focusedBorder: OutlineInputBorder(
    //                                         borderSide : BorderSide(color: Colors.blue, width: 1)
    //                                       ),
    //                                       focusedErrorBorder : OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.red, width: 1)
    //                                       ),
    //                                       errorBorder:  OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.red, width: 1)
    //                                       ),
                                         
    //                                     ),
    //                                    validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre nom" : null,
    //                                   onChanged : (val) => nom = val,
    //                                    ),
    //                                  const SizedBox(height: 20,),
                                         
    //                                    TextFormField(
    //                                     decoration:  const InputDecoration(
    //                                       labelText : "Email",
    //                                       hintText: "Entrez votre email",
    //                                       fillColor: Colors.white,
    //                                       filled: true,
    //                                       contentPadding: EdgeInsets.all(12),
    //                                       enabledBorder: OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.blueGrey, width: 1),
    //                                       ),
    //                                       focusedBorder: OutlineInputBorder(
    //                                         borderSide : BorderSide(color: Colors.blue, width: 1)
    //                                       ),
    //                                       focusedErrorBorder : OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.red, width: 1)
    //                                       ),
    //                                       errorBorder:  OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.red, width: 1)
    //                                       ),
                                         
    //                                     ),
    //                                     validator: (val) =>val != null && !EmailValidator.validate(val) ? "Veuillez entrer votre email valide" : null,
                                        
    //                                     onChanged: (val) => email = val,
    //                                    ),
    //                                    const SizedBox(height: 20,),
    //                                  TextFormField(
    //                                      obscureText: isHidden,
    //                                     decoration:  InputDecoration(
    //                                       suffix : InkWell(
    //                                           onTap: _togglePasswordView,
    //                                           child : const Icon(Icons.visibility),
    //                                       ),
    //                                       labelText : "Mot Passe",
    //                                       hintText: "Entrez votre mot passe",                      
    //                                       fillColor: Colors.white,
    //                                       filled: true,
    //                                       contentPadding: const EdgeInsets.all(12),
    //                                       enabledBorder: const OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.blueGrey, width: 1),
    //                                       ),
    //                                       focusedBorder: const OutlineInputBorder(
    //                                         borderSide : BorderSide(color: Colors.blue, width: 1)
    //                                       ),
    //                                       focusedErrorBorder : const OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.red, width: 1)
    //                                       ),
    //                                       errorBorder: const OutlineInputBorder(
    //                                         borderSide: BorderSide(color: Colors.red, width: 1)
    //                                       ),                       
    //                                     ),
                                                      
    //                                     validator: (String ? val) => val!.length < 6 ? "Vous devez fournir un passe au moins a 6 caractere": null,
    //                                     onChanged: (val) => password = val,
    //                                    ),
                                     
                                                      
    //                                   const SizedBox(height: 30),
                                        
                                                    
    //                                      Container(
    //                                          height: 48,
    //                                          width: double.maxFinite,
    //                                          decoration: BoxDecoration(
    //                                            color: Colors.deepOrange,
    //                                            borderRadius: BorderRadius.circular(5),
    //                                          ),
    //                                          child: InkWell(
    //                                              onTap: () async{
                                                    
    //                                            if(_keyForm.currentState!= null){
    //                                              bool result = _keyForm.currentState!.validate();
    //                                              if(result){ 
                                                
    //                                                 print(nom);
    //                                                 print(email);
    //                                                 print(password);
    //                                                 Navigator.pushReplacementNamed(context,'/prest1', arguments: Argu(name: nom, email: email, passe:password));
                                               
    //                                              }
                                                 
    //                                            }
                                            
                                             
    //                                          }, 
    //                                            child: const Padding(
    //                                            padding:  EdgeInsets.only(top:10.0),
    //                                            child:  Text("Suivant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
    //                                          )
                                                          
                                                    
    //                                          ),
    //                                        ),
                                                    
    //                                        const SizedBox(height: 15,),
    //                                        Text(error,
    //                                        style: const TextStyle(color: Colors.red, fontSize: 16,),),
    //                                        const SizedBox(height: 15,),
                                                    
                                        
    //                                    ],
    //                                  ),
    //                                                                ),
    //                               )
                            
    //                               ),
    //                               ),
                               
    //                           )
                               
                          
    //                     ],
    //                   ),
                    
                  

            
          
    //     ),
    
    // );

  }

   void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }


}
