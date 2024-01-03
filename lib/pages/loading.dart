import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
       child: SpinKitChasingDots(
          color: Colors.deepOrange ,
          size: 40,)
       )
    );
  }
}


class Chargement extends StatelessWidget {
  const Chargement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
       child: SpinKitFadingCircle(
          color: Colors.deepOrange ,
          size: 40,)
       )
    );
  }
}