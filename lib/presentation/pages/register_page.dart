import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teach_edge/domain/components/button.dart';
import 'package:teach_edge/domain/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black), // Set the title color to black
        ),
        backgroundColor: Color(0xffb3e5f7), // Set the app bar background color
        elevation: 0, // Remove the shadow from the app bar
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: ClipOval(
                      child: Image.asset(
                        'images/profilepic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Let's create an account for you",
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: emailTextEditingController,
                    hintText: 'Email',
                    obscureText: false,
                    textStyle: TextStyle(color: Colors.blueGrey), // Set text color for the email field
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: passwordTextEditingController,
                    hintText: 'Password',
                    obscureText: true,
                    textStyle: TextStyle(color: Colors.blueGrey), // Set text color for the password field
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: confirmPasswordTextEditingController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    textStyle: TextStyle(color: Colors.blueGrey), // Set text color for the confirm password field
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  MyButton(
                    text: 'Sign Up',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account?',
                        style: GoogleFonts.lato(color: Colors.black),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
