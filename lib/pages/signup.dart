import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mywork/controllers/SignupController.dart';
import 'package:mywork/widgets/input.dart';
import '../widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
class SignUp extends GetView<SignUpController> {
  const SignUp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Get.put(SignUpController());
     Size _size =MediaQuery.of(context).size;
    // print(_size.width);
    // String r= controller.radio.value;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: _size.width*0.11,right: _size.width*0.11),
        child: Form(
          key: controller.signinFormKey,
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("Username"),
              SizedBox(
                height: 10,
              ),
              InputField(hintText: "username"),
              SizedBox(
                height: 12,
              ),
              Text("Email / Phone Number"),
              SizedBox(
                height: 10,
              ),
              InputField(hintText: "example@gmail.com"),
              SizedBox(
                height: 12,
              ),
              Text("Password"),
              SizedBox(
                height: 10,
              ),
             InputPasswordField(hintText: "******",),
               SizedBox(
                height: 7,
              ),
              Text("Register As "),
              // SizedBox(
              //   height: 0.0,
              // ),
              
                 Row(
                  children: [
                    Row(
                      children: [
                        Obx(
                          ()=> Radio(
                            activeColor: Colors.black,
                              value: SignUpController.radioName[0],
                              // groupValue: int.parse(controller.radioController.toString()),
                              groupValue: controller.radioController.value,
                              // groupValue: r,
                              onChanged: (v) {
                                
                                controller.changeRadioController(v);
                               
                                print(controller.radioController.value);
                              }),
                        ),
                        const Text("Freelance")
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          ()=>Radio(
                            activeColor: Colors.black,
                              value: SignUpController.radioName[1],
                              // groupValue: int.parse(controller.radioController.toString()),
                              groupValue: controller.radioController.value,
                              // groupValue: r,
                              onChanged: (v) {
                                // setState(() {
                                //   _radioController = int.parse(v.toString());
                                // });
                                controller.changeRadioController(v);
                                // r =controller.radio.value;
                                print(controller.radioController.value);
                              }),
                        ),
                        const Text("Employer")
                      ],
                    ),
                    
                  ],
                ),
             
              SizedBox(height: 7,),
              Button(text: "REGISTER", onTaped: (){},prePaddingPercentageNo: 0.11,),
              SizedBox(height: 10,),
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
                       TextSpan(text: "Have an account? ",
                       style: TextStyle(color: Colors.black)
                        ),
                       TextSpan(text: "Login",
                       style: TextStyle(color: Colors.lightBlue)
                       )
                     ]
                   )),
                 )
        
            ],
          )),
        ),
      ),
    );
  }
}

