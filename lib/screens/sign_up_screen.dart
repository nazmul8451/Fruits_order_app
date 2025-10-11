import 'package:e_commerce_ui/screens/log_in_screen.dart';
import 'package:e_commerce_ui/service_center/network_caller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  static const String name = '/SignUp-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fristNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isSignUpProgress = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fristNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Create Account Text
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                //Create a new account to get started with fruit salad combo
                Text(
                  textAlign: TextAlign.center,
                  'Create a new account to get started with fruit salad combo',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      //user name textField
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: fristNameController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'First name',
                          labelStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? value) {
                          if (value
                              ?.trim()
                              .isEmpty ?? true) {
                            return 'Enter your frist name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: lastNameController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Last name',
                          labelStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? value) {
                          if (value
                              ?.trim()
                              .isEmpty ?? true) {
                            return 'Enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? value) {
                          final email = value ?? '';
                          if (EmailValidator.validate(email) == false) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Mobile',
                          labelStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? value) {
                          if (value
                              ?.trim()
                              .isEmpty ?? true) {
                            return 'Enter your mobile number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: passswordController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? value) {
                          if ((value?.length ?? 0) <= 6) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //ElevatedButton to create account
                GestureDetector(
                  onTap: () {
                  _createAccount();
                  },
                  child: Visibility(
                    visible: _isSignUpProgress == false,
                    replacement: Center(child: CircularProgressIndicator(color: Colors.orange,),),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //already have an account?
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Already have an  account? ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(color: Colors.orange, fontSize: 15),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              LogInScreen.name,
                            );
                          },
                      ),
                    ],
                  ),
                ),
                //divider
              ],
            ),
          ),
        ),
      );

  }

  void LoginIn() {}

  Future<void> _signUp() async {
    _isSignUpProgress = true;
    setState(() {});

    Map<String, String> requestBody = {
      "email": emailController.text.trim(),
      "firstName": fristNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "mobile": mobileController.text.trim(),
      "password": passswordController.text,
    };
    print('Request Body: $requestBody');

    NetworkResponse response = await NetworkCaller.postRequest(
      body: requestBody,
      url: Urls.registrationUrl,
    );

    if (response.isSuccess) {
      clearTextFormField();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Account Created.plz log in')
          ));
          }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('${response.errormessege}')
              ));
          }
    _isSignUpProgress = false;
    setState(() {});
      }

      void _createAccount(){
        if(_formKey.currentState!.validate()){
          _signUp();
        }
      }


  void clearTextFormField() {
    fristNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileController.clear();
    passswordController.clear();
  }

}

class Urls {
  static const String baseUrl = "http://35.73.30.144:2005/api/v1";
  static const String registrationUrl = "$baseUrl/Registration";
  static const String logInUrl = "$baseUrl/Login";
}
