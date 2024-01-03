import 'dart:io';

import 'package:all_in_one/loginVendeur.dart';
import 'package:all_in_one/pages/ajout_produit.dart';
import 'package:all_in_one/pages/ajout_produit1.dart';
import 'package:all_in_one/pages/dashbord.dart';
import 'package:all_in_one/pages/forgetPasse.dart';
import 'package:all_in_one/pages/inscrit_prest.dart';
import 'package:all_in_one/pages/inscrit_prest1.dart';
import 'package:all_in_one/pages/inscrit_prest2.dart';
import 'package:all_in_one/pages/inscrit_vend1.dart';
import 'package:all_in_one/pages/inscrit_vend2.dart';
import 'package:all_in_one/pages/market.dart';
import 'package:all_in_one/pages/paiement.dart';
import 'package:all_in_one/pages/prestataire.dart';
import 'package:all_in_one/pages/prestation.dart';
import 'package:all_in_one/pages/produit.dart';
import 'package:all_in_one/pages/splash.dart';
import 'package:all_in_one/pages/validation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      initialRoute: '/splash',
      routes: {
        '/splash' :(context) => const SplashScreen(),
        '/prest' : (context) => const  InscritPrestataire(),
        '/prest1' : (context) => const InscritPrestataire1(),
        '/prest2' : (context) => const InscritPrestataire2(),
        '/prestation' :(context) => const Prestation(),
        '/produit' :(context) => const Produit(),
        '/vend' :(context) => const InscritPrestataire(),
        '/vend1' :(context) => const InscritVendeur1(),
        '/vend2' :(context) => const InscritVendeur2(),
        '/prestataire' :(context) => const Prestataire(),
        '/forget' :(context) => const ForgetPasse(),
        '/dashbord' :(context) => const Dashbord(),
        '/market' :(context) => const Market(),
        '/ajout' :(context) => const AjoutProduit(),
        '/ajout1' :(context) => const AjoutProduit1(),
        '/login' :(context) => const LoginVendeur(),
        '/paiement' :(context) => const Paiement(),
        '/validation' :(context) => const Validation(),
      },
    );
  }
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
