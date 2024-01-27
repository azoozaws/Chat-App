import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled1/constans.dart';
import 'package:untitled1/helper/show_snack_bar.dart';
import 'package:untitled1/pages/SignUp_page.dart';
import 'package:untitled1/pages/chat_page.dart';
import 'package:untitled1/widgets/custom_button.dart';
import 'package:untitled1/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String id = 'SignInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? mail;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.asset(
                      kLogo,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Scholar Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 40, bottom: 16),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    labelText: "Email",
                    hintText: "Enter your Email",
                    onChanged: (value) {
                      mail = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    labelText: "Password",
                    hintText: "Enter your Password",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 28, bottom: 16),
                  child: CustomButton(
                    nameOfButton: "Sign In",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          await signIn();
                          isLoading = false;
                          setState(() {});

                          Navigator.pushNamed(
                            context,
                            ChatPage.id,
                            arguments: mail,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-credential') {
                            showSnackBar(context,
                                'Wrong password or no user found for that email.');
                          } else {
                            showSnackBar(context, e.code);
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don't have an account",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        (context),
                        SignUpPage.id,
                      ),
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: mail!,
      password: password!,
    );
  }
}
