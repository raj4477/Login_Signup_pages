import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mywork/routes/app_page.dart';

import '../custom.dart';

class SignUpController extends GetxController{
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
  void onReady() async {
    googleSign = GoogleSignIn();
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
   ever(isSignIn, (_)=>handleAuthStateChanged(isSignIn.value));

    super.onReady();
  }
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
  }
  void changeRadioController(var value){
    radioController.value =value;
   }
   
  void login() async {
    CustomFullScreenDialog.showDialog();
    try{GoogleSignInAccount? googleSignInAccount =
        await googleSign.signIn();
    if (googleSignInAccount == null) {
      print("object");
      CustomFullScreenDialog.cancelDialog();
    } else {
    firebaseAuth.signOut();
      print("123");
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
    
    }}
    catch(e){}
  }
   void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
     Get.offAllNamed(Routes.WELCOME, 
     arguments: firebaseAuth.currentUser
     );
    print("true");
    } else {
      Get.offAllNamed(Routes.HOME);
      print("false");
    }
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:mywork/routes/app_page.dart';

// import '../custom.dart';

// class SignUpController extends GetxController{
//   final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>(); 
  

//   late TextEditingController emailController, userNameController,passwordController;
//   static List<String> radioName =["Freelancer","Employer"];
//   var email = '';
//   var password = '';
//   var username = "";
//     var radioController = radioName[0].obs ;
//   @override
//   void onInit() {
//   // radio = int.parse(radioController.toString());
//     super.onInit();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     userNameController = TextEditingController();
//   }
//   @override
//   void onReady() async {
    

//     // TODO: implement onReady
//     super.onReady();
//   }
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     userNameController.dispose();
//   }
//   void changeRadioController(var value){
//     radioController.value =value;
  
//   }
  
  
// }