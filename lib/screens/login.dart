import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/spacer.dart';
import 'package:flutter_application_1/screens/detailscreen.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            heightSpace(80),
            const Text(
              'Welcome, Login',
              style: TextStyle(fontSize: 28),
            ),
            heightSpace(50),
            TextFormField(
              decoration: const InputDecoration(hintText: "Username"),
            ),
            heightSpace(100),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DetailsPage())),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
