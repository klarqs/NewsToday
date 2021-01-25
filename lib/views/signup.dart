import 'package:flutter/material.dart';
import 'package:mtt_news_today/views/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;
  String userFirstName = "First Name";
  String userLastName = "Last Name";
  String userEmail = "Email Address";
  String userPhoneNumber = "Phone Number";
  String userPassword = "Password";

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: firstnameController,
                                  cursorColor: Colors.black54,
                                  keyboardAppearance: Brightness.light,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  decoration:
                                      InputDecoration(hintText: userFirstName),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: lastnameController,
                                  cursorColor: Colors.black54,
                                  keyboardAppearance: Brightness.light,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  decoration:
                                      InputDecoration(hintText: userLastName),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            cursorColor: Colors.black54,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(hintText: userEmail),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: phoneController,
                            cursorColor: Colors.black54,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration:
                                InputDecoration(hintText: userPhoneNumber),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              TextFormField(
                                textCapitalization: TextCapitalization.words,
                                controller: passwordController,
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                obscureText: _obscureText,
                                decoration:
                                    InputDecoration(hintText: userPassword),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: new Container(
                                  width: 50,
                                  // color: Colors.black12,
                                  padding: EdgeInsets.only(bottom: 5
                                      // horizontal: 15.0,
                                      ),
                                  height: 48.0,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: _toggle,
                                      child: new FaIcon(
                                        _obscureText
                                            ? FontAwesomeIcons.eyeSlash
                                            : FontAwesomeIcons.eye,
                                        size: 16,
                                        color: Colors.black.withOpacity(.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: ButtonTheme(
                minWidth: 20.0,
                height: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (firstnameController.text != "" &&
                        lastnameController.text != "" &&
                        emailController.text != "" &&
                        phoneController.text != "" &&
                        passwordController.text != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(
                            firstnameHolder: "${firstnameController.text}",
                            lastnameHolder: "${lastnameController.text}",
                            emailHolder: "${emailController.text}",
                            phoneHolder: "${phoneController.text}",
                            password: "${passwordController.text}",
                          ),
                        ),
                      );
                    } else {
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 135.0,
                      vertical: 18.0,
                    ),
                    child: Text('Sign Up'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
