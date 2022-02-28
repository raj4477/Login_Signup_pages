import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  String text;
  Function onTaped= (){};
  double? prePaddingPercentageNo;
   Button({ Key? key,required this.text,required this.onTaped,this.prePaddingPercentageNo }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(
        left: size.width*((1-2*prePaddingPercentageNo!-0.6)/2)
      ),
      child: InkWell(
        onTap: onTaped(),
        child: Container(
          alignment: Alignment.center,
          height: size.height*0.0699,
          width:  size.width*0.6,
          decoration:const BoxDecoration(
            // background: linear-gradient(276.15deg, #2E91F7 0%, #62B2FC 100%);
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
             colors: [
            Color.fromRGBO(46, 145, 247, 1),
            Color.fromRGBO(98, 178, 252, 1),
      
          ]),
            borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
        ),
      ),
    );
  }
}