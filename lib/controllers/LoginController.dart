import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, userNameController,passwordController;
    var email = '';
  var password = '';
    
  @override
  void onInit() {
  // radio = int.parse(radioController.toString());
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
  }
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
  }
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    // final isValid = loginFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    loginFormKey.currentState!.save();
    print(email+" "+password);
    // popup(email: email, pass: password);
  }
  set emailSet(value){
    email = value;
  }
  set passwordSet(value){
    password = value;
  }

  void setValue(v1){
    // this.emailSet(v1);
    email =v1;
  }
  void setpass(v){
    password =v;
  }
  
}
class popup   {
  String email,pass;
   popup({ Key? key,required this.email,required this.pass });

  @override
  SnackbarController build(BuildContext context) {
    return Get.snackbar(
   'title',
   'message',
   snackPosition: SnackPosition.BOTTOM,
colorText: Colors.white,
backgroundColor: Colors.black,
borderColor: Colors.white);
  }
}