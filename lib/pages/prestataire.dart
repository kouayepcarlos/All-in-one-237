// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/authentification.dart';
import 'argument.dart';
import 'global.dart';
import 'loading.dart';



class Prestataire extends StatefulWidget {
  const Prestataire({super.key});

  @override
  State<Prestataire> createState() => _PrestataireState();
}

class _PrestataireState extends State<Prestataire> {

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


  final AuthentificationService _auth = AuthentificationService();


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


  Widget build(BuildContext context) {
    return  loading ? Loading(): Scaffold(
      appBar: AppBar(
        title: const Text("Connexion Prestataire", style: TextStyle(color: Colors.deepOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/prestation'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange,))
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
                      image: AssetImage('assets/login.png'),
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
                          Text("Veillé vous connectez cher prestataire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
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
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                                            
                                         color: Colors.blueAccent,
                                            
                                         
                                        
                                         child: InkWell(
                                          
                                            hoverColor: Colors.orange,
                                            onTap: () async{
                                            
                                            
                                                    
                                           if(_keyForm.currentState!= null){
                                          
                                                  bool result = _keyForm.currentState!.validate();
                                   if(result){ 
                                     bool connect = await check(); 
                                    // bool emailValid = RegExp(r"^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})+").hasMatch(email);
                                      
                                    if(connect){ 
                           
                                      
                                    setState(()=> loading = true);
                                    var mail = email;
                                    var pass = password;

                                    dynamic result = await _auth.signInWithEmailAndPassword(mail, pass);
                                    
                                    if(result == null)
                                    {
                                      setState(() {
                                        loading = false;
                                        erroSnackBar(context, 'Adresse email ou mot de passe incorrect');

                                      });
                                    }
                                    else{
                                          ValideSnackBar(context, 'Connexion réussit valide avec succès');
                                           Navigator.pushReplacementNamed(context, '/dashbord');
                                    }
                                     
                                       
                                      
                                    
                                  }else{
                                     erroSnackBar(context, 'Vérifier si vous êtes bien connecter à internet');
                                  }         
      
                                   }
                                           }
                                        
                                         
                                         }, 
                                         child: const Padding(
                                           padding:  EdgeInsets.only(top:10.0),
                                           child:  Text("Se connecter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                         )
                                                    
                                         ),
                                       ),
                                      
                                         
                                         const SizedBox(height: 12,),
                                         Text(error,
                                         textAlign: TextAlign.center,
                                         style: const TextStyle(color: Colors.red, fontSize: 16,),),
                                                    
                                          const SizedBox(height: 15,),
                                                    
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                       
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                              
                                         
                                           
                                              GestureDetector(
                                            
                                                onTap: () => Navigator.popAndPushNamed(context, '/prest'),
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
