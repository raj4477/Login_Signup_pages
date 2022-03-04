import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mywork/routes/app_page.dart';
import './pages/pages.dart';

Future  main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // HomeBinding().dependencies();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyWork',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
      initialRoute: AppPages.INITIAL,
       getPages: AppPages.routes,
        // home: RegisterPage()
        );
  }
}
      // debugShowCheckedModeBanner: false,

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
    _tabcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
        
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(241, 243, 248, 1),

        // backgroundColor: Colors.red,
        body: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.3222,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.04, bottom: size.height * 0.0333
                        ),
                    child: SizedBox(
                        height: size.height * 0.18,
                        width: size.width,
                        child: SvgPicture.asset(
                          "assets/images/img-svg.svg",
                          fit: BoxFit.cover,
                        )),
                  ),
                  TabBar(
                      controller: _tabcontroller,
                      indicatorSize: TabBarIndicatorSize.label,
                      //  indicatorPadding: EdgeInsets.only(left: size.width*0.2),
                      indicatorColor: Color.fromRGBO(46, 145, 247, 1),
                      tabs: [
                        Tab(
                            child: SizedBox(
                                width: size.width * 0.32,
                                child: Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: _tabcontroller.index == 0
                                          ? Colors.black
                                          : Colors.black26,
                                      fontWeight: FontWeight.bold),
                                )))),
                        Tab(
                            child: SizedBox(
                                width: size.width * 0.32,
                                child: Center(
                                    child: Text(
                                  "Sign-up",
                                  style: TextStyle(
                                      color: _tabcontroller.index == 1
                                          ? Colors.black
                                          : Colors.black26,
                                      fontWeight: FontWeight.bold),
                                )))),
                      ])
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.033,
            ),
            Expanded(
              // child: Padding(
              //   padding: EdgeInsets.only(
              //       left: size.width * 0.11, 
              //       // right: size.width * 0.08
              //       ),
              //   child: TabBarView(controller: _tabcontroller, children: const [
              //     Login(
              //         // height: size.height,width: 50,
              //         ),
              //     SignUp()
              //   ]),
              // ),
              child: TabBarView(controller: _tabcontroller, children:  [
                  Login(
                      // height: size.height,width: 50,
                      ),
                  SignUp()
                ]),
            )
          ],
        ),
      ),
    );
  }
}



