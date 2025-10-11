import 'package:e_commerce_ui/screens/home_screen.dart';
import 'package:e_commerce_ui/screens/sign_up_screen.dart';
import 'package:e_commerce_ui/screens/splash_screen.dart';
import 'package:e_commerce_ui/screens/welcome_screen.dart';
import 'package:e_commerce_ui/service_center/network_caller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static const String name = '/login-screen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _logInProgress = false;

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
                  'Log in',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
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
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //ElevatedButton to create account
                GestureDetector(
                  onTap: () {
                 _logIn();
                  },
                  child: Visibility(
                    visible: _logInProgress == false,
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
                          'Login',
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
                    text: "Don't have an account? ",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: Colors.orange, fontSize: 15),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              SignUpScreen.name,
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

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      logIn();
    }
  }
  Future<void> logIn() async {
    _logInProgress = true;
    setState(() {});
    Map<String, String> requestBody = {
      "email": emailController.text.trim(),
      "password": passswordController.text,
    };
    print('Request Body: $requestBody');

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.logInUrl,
      body: requestBody,
    );

    if (response.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.name,
        (predicate) => false,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Log in successful')));
      print('Your Request is Success');
    } else {
      print('Error 404');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.errormessege ?? 'Something went wrong')));
    }
    _logInProgress = false;
    setState(() {});
  }
  @override
  void dispose() {
    emailController.dispose();
    passswordController.dispose();
    super.dispose();
  }
}
