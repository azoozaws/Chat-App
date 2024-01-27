import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase_options.dart';
import 'package:untitled1/pages/SignIn_Page.dart';
import 'package:untitled1/pages/SignUp_page.dart';
import 'package:untitled1/pages/chat_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignUpPage.id: (context) => const SignUpPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      home: const SignInPage(),
    );
  }
}
