import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mywork/controllers/LoginController.dart';
import 'package:mywork/widgets/input.dart';
import '../widgets/button.dart';


  class Login extends GetView<LoginController>{
  
  @override
  Widget build(BuildContext context) {
    
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(left: _size.width*0.11,right: _size.width*0.11),
        child: Container(
          // color: Colors.amber,
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
              Text("Email / Phone Number"),
              SizedBox(
                height: 10,
              ),
                       InputField(hintText: "example@gmail.com"),
              SizedBox(
                height: 15,
              ),
              Text("Password"),
              SizedBox(
                height: 10,
              ),
              InputPasswordField(hintText: "*****"),
              SizedBox(height: 10,),
              Text("Forgot Password?",style: TextStyle(color: Colors.black54)),
               SizedBox(height: 20,),
                       Button(text: "LOGIN", onTaped: (){
              final controller= Get.find<LoginController>();
              controller.checkLogin();
                       },prePaddingPercentageNo: 0.11,),
               SizedBox(height: 25,),
               Align(
                 alignment: Alignment.center,
                 child: Text("Or",style: TextStyle(fontSize: 18),)),
                 SizedBox(height: 25,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   CircleAvatar( 
                     backgroundColor: Colors.white,
                     child: SvgPicture.asset("assets/images/facebook.svg"),),
                   CircleAvatar( 
                     backgroundColor: Colors.white,
                     child: SvgPicture.asset("assets/images/phone.svg"),),
                   CircleAvatar( 
                     backgroundColor: Colors.white,
                     child: SvgPicture.asset("assets/images/google.svg"),),
                 ],),
                 SizedBox(height: 25,),
                 Align(
                   alignment: Alignment.center,
                   child: RichText(text: TextSpan(
                     children: [
                       TextSpan(text: "Don’t have account ? ",
                       style: TextStyle(color: Colors.black)
                        ),
                       TextSpan(text: "Register",
                       style: TextStyle(color: Colors.lightBlue)
                       )
                     ]
                   )),
                 )
            
                      ],
                    ),
            )),
      ),
    );
  }
}