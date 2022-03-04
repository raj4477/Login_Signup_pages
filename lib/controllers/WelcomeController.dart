import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mywork/controllers/SignupController.dart';

class WelcomeController extends GetxController{
   final homeController = Get.find<SignUpController>();
  late User user;
  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logout() async {
    await homeController.googleSign.disconnect();
    await homeController.firebaseAuth.signOut();
  }
}