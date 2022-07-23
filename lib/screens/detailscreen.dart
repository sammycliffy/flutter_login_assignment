import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/spacer.dart';
import 'package:flutter_application_1/models/usermodel.dart';
import 'package:flutter_application_1/screens/profilescreen.dart';
import 'package:flutter_application_1/services/authservice.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  AuthService service = AuthService();
  Future<UserModel>? userModel;

  getData() {
    userModel = service.getUserDetails();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace(80),
            const Text(
              "Details Page",
              style: TextStyle(fontSize: 28),
            ),
            heightSpace(50),
            Expanded(
              child: FutureBuilder<UserModel>(
                  future: service.getUserDetails(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.perPage,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ProfileScreen(
                                            imageUrl: snapshot.data!
                                                .photos?[index].src!.original,
                                            fullName: snapshot.data!
                                                .photos?[index].photographer,
                                            website: snapshot.data!
                                                .photos?[index].photographerUrl,
                                          )))),
                              child: myCard(
                                  snapshot.data!.photos?[index].src!.original,
                                  snapshot.data!.photos?[index].photographer,
                                  snapshot
                                      .data!.photos?[index].photographerUrl),
                            );
                          }));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myCard(String? photo, String? fullName, String? website) => Card(
        child: ListTile(
      leading: SizedBox(height: 100, width: 100, child: Image.network(photo!)),
      title: Text(fullName!),
      subtitle: Text(website!),
    ));
