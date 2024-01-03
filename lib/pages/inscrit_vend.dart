// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/authentification.dart';
import 'global.dart';



class InscritVendeur extends StatefulWidget {
  const InscritVendeur({super.key});

  @override
  State<InscritVendeur> createState() => _InscritVendeurState();
}

class _InscritVendeurState extends State<InscritVendeur> {
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
    return  Scaffold(

        body:   Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.orange,
                    Colors.deepOrange,
                    Color.fromARGB(255, 163, 71, 9)
                  ]
                )
              ),
              
              child: Column(
                
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                const SizedBox(height: 20,),                  
                   Positioned(
                    
                    top: 10,
                    
                    //width: -90,
                     child:
                      
                      IconButton(
                           onPressed: ()=> Navigator.pushReplacementNamed(context, '/splash'),
                           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
                      
                         
                   ),
                   // const SizedBox(height: 60,), 
                   Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const[
                         Text(" Bienvenue à nouveau", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),),
                         SizedBox(width: 5,),
                         Text(" Cher(e) vendeur(se)", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),)
                      ],
                    ),
                    ),
          
                    const SizedBox(height: 60,),
          
                    Expanded(
                      
                      child: Container(
                        decoration: const BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                                child: SingleChildScrollView(
                                  child: Form(
                                                             key: _keyForm,
                                                             child: Column(
                                                               children: [
                                  const SizedBox(height: 30,),
                                         
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
                                    validator: (String ?  val) =>val != null && !EmailValidator.validate(val) ? "Veuillez entrer votre email valide" : null,
                                    
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
                                                
                                  const SizedBox(height: 20,),
                                                
                                  Row(
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                     onTap: () => Navigator.pushReplacementNamed(context, '/forget'),
                                     child: const Text("mot de passe oublier",style: TextStyle(decoration: TextDecoration.underline,) ,)),
                                    ],
                                  ),
                                  
                                   const  SizedBox(height: 20),
                                   // ignore: sized_box_for_whitespace
                                   Container(
                                    //padding:  const EdgeInsets.all(20),
                                    // color: Colors.deepOrange,
                                     height: 48,
                                     width: double.maxFinite,
                                        
                                     color: Colors.deepOrange,
                                        
                                     
                                    
                                     child: InkWell(
                                      
                                        hoverColor: Colors.orange,
                                        onTap: () async{
                                        
                                        
                                                
                                       if(_keyForm.currentState!= null){
                                      
                                      
                                       }
                                    
                                     
                                     }, 
                                     child: const Padding(
                                       padding:  EdgeInsets.only(top:10.0),
                                       child:  Text("Se connecter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                     )
                                                
                                     ),
                                   ),
                                  
                                     
                                     const SizedBox(height: 17,),
                                     Text(error,
                                     textAlign: TextAlign.center,
                                     style: const TextStyle(color: Colors.red, fontSize: 16,),),
                                                
                                      const SizedBox(height: 20,),
                                                
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                   
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                          
                                     
                                       
                                          GestureDetector(
                                        
                                            onTap: () => Navigator.popAndPushNamed(context, '/vend1'),
                                            child: const Text(
                                              "Creer votre Compte",
                                              style: TextStyle(color: Colors.red, fontSize: 18),
                                            ),
                                          ),
                                        
                                      ],
                                    )
                                                
                                   
                                                               ],
                                                             
                                                            ),
                                                     ),
                                ),
                
                          ),
                          ),
                       
                      )
                       
                  
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
