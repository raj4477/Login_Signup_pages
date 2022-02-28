import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mywork/controllers/LoginController.dart';

class InputField extends StatelessWidget {
  String hintText;
  InputField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SizedBox(
      height: _size.height * 0.055,
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: hintText,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
            enabledBorder: OutlineInputBorder()
            ),
            onSaved: (value){
              final controller = Get.find<LoginController>();
              controller.setValue(value);
            },
      ),
    );
  }
}
class InputPasswordField extends StatefulWidget {
  String hintText;
   InputPasswordField({ Key? key,required this.hintText }) : super(key: key);

  @override
  _InputPasswordFieldState createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
   bool isObscure = false;  
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SizedBox(
       height: _size.height * 0.055,
      child: TextFormField(
        onSaved: (value){
          final controller = Get.find<LoginController>();
          controller.setpass(value);
        },
        obscureText: !isObscure,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: widget.hintText,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
            enabledBorder: OutlineInputBorder(),
             suffixIcon: IconButton(
              color: isObscure? Colors.black54:Colors.black45,
              icon: isObscure
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),onPressed: (){
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },),
            ),
      ),
    );
  }
}