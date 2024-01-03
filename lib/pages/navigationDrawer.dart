import 'package:all_in_one/pages/dashbord.dart';
import 'package:all_in_one/pages/paiement.dart';
import 'package:all_in_one/pages/parametre.dart';
import 'package:all_in_one/pages/prestataire.dart';
import 'package:all_in_one/pages/prestation.dart';
import 'package:all_in_one/pages/produit.dart';
import 'package:all_in_one/pages/splash.dart';
import 'package:all_in_one/pages/vendeur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'global.dart';


class NavigationDrawers extends StatefulWidget {
  const NavigationDrawers({super.key});

  @override
  State<NavigationDrawers> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawers> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
      
  
    return Theme(
                 data : ThemeData.dark(),
                child: Drawer(
                  child: Material(
                   
                   color: const Color.fromARGB(255, 197, 100, 71),
                 //  color: Colors.deepOrange,
                 
                      child: ListView(
                        children: [
                               
                             DrawerHeader(
                                    // ignore: sort_child_properties_last
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10,),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          child: Image.asset("assets/playstore.png", width: 110,),
                                        ),
                                        const SizedBox(height: 10,),
                                        const Text("Une marque qui falicite l'achat ou la prestation d'un service", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,), 
                                        
                                      ],
                                      
                                    ) ,
                                    decoration: const BoxDecoration(color: Colors.white),
                                    ),
                                
                        
                          builMenuItem(
                            text: 'Nos Prestations',
                            icon :  Icons.person_add_alt_1,
                            onClicked: () => selectedItem(context,0),
                          ),
               
                           builMenuItem(
                            text: 'Market Place',
                            icon :  Icons.card_giftcard_outlined,
                            onClicked: () => selectedItem(context,1),
                          ),
          
                           builMenuItem(
                            text: 'S\'inscrire comme prestataire',
                            icon :   Icons.assignment_ind_rounded,
                            onClicked: () => selectedItem(context,2),
                          ),

                  
                          //  builMenuItem(
                          //   text: 'Paiement',
                          //   icon :  Icons.assignment_ind_rounded,
                          //   onClicked: () => selectedItem(context,3),
                          // ),
                              builMenuItem(
                            text: 'Contactez Nous',
                            icon :  Icons.call,
                            onClicked: () => selectedItem(context,4),
                          ),
                        
                  
                          const Divider(color: Colors.white70),
         
                          
                          builMenuItem(
                            text: 'Spash Page',
                            icon :  Icons.add_card_outlined,
                            onClicked: () => selectedItem(context,5),
                          ),

                          builMenuItem(
                            text: 'Deconnexion',
                            icon :  Icons.logout,
                            onClicked: () => selectedItem(context,6),
                          ),
                        // ignore: avoid_print
                       // print(appuser.uid);
                        ]
                      )
                  )
                  ),
      
    );
  }
  }
  Widget builMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,

    );

  }

  Future<void> selectedItem(BuildContext context, int index)async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    Navigator.of(context).pop();
    switch(index)
    {
      case 0 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) =>  const Prestation(),
        ));
        break;
      case 1 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const Produit(),
        ));
        break;

      case 2 :
       
           Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const Prestataire(),
           ));
          
          break;
        
        
        // case 3 :
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder : (context) =>  const Paiement(),
        // ));
        //break;
        case 4 : Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const Contact(),
        ));
        break;

         case 5 : Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const SplashScreen(),
        ));
        break;

         case 6 :  await auth.signOut(); 
         Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const SplashScreen(),
        ));
        break;



    }
  

  Widget builMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,

    );

  }


  }


 