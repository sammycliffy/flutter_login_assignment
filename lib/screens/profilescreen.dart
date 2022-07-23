import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/spacer.dart';

class ProfileScreen extends StatefulWidget {
  final String? imageUrl;
  final String? fullName;
  final String? website;
  const ProfileScreen({Key? key, this.fullName, this.imageUrl, this.website})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            heightSpace(100),
            const Text(
              "Profile Page",
              style: TextStyle(fontSize: 28),
            ),
            heightSpace(50),
            SizedBox(
                width: 200,
                height: 200,
                child: Image.network(widget.imageUrl!)),
            Text(
              widget.fullName!,
              style: const TextStyle(fontSize: 20),
            ),
            heightSpace(20),
            Text(
              widget.website!,
              style: const TextStyle(fontSize: 20),
            ),
          ]),
        ),
      ),
    );
  }
}
