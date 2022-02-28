import 'package:get/get.dart';
import 'package:mywork/main.dart';
import 'package:mywork/pages/signup.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => RegisterPage(),
      binding: SignUpBinding(),
    ),
  ];
}