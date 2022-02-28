import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, userNameController,passwordController;
  static List<String> radioName =["Freelancer","Employer"];
  var email = '';
  var password = '';
  var username = "";
    var radioController = radioName[0].obs ;
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
  void changeRadioController(var value){
    radioController.value =value;
  // update();
  }
}