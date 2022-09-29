import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/common/app_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> _latestImage = FirebaseFirestore.instance
        .collection("users")
        .doc('alovelace')
        .snapshots();
    return Consumer<AppColor>(
      builder: (context, darkMode, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
                color: darkMode.appBackgrounds,
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder(
                          stream: _latestImage,
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              if (kDebugMode) {
                                print('snapshot.error');
                              }
                              return Center(
                                  child: Container(child: Text('Error')));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            // if (snapshot.connectionState == ConnectionState.done) {

                            // }

                            if (snapshot.hasData &&
                                (snapshot.data!.get('filepath') != '')) {
                              return ListView(
                                shrinkWrap: true,
                                children: [
                                  //Text(snapshot.data!['last_edit']),
                                  MaterialButton(
                                      onPressed: () {
                                        AddPersonAlert(context,
                                            snapshot.data!['filepath']);
                                      },
                                      child: Image.network(
                                        snapshot.data!['filepath'].toString() +
                                            '?alt=media&token=2959c4f9-68c5-4d98-ac7f-cf901d72a604',
                                      ))
                                ],
                              );
                            } else {
                              return Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'No image captured yet',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              );
                            }

                            // return Container(
                            //   child: Text('outside'),
                            // );
                          })
                    ])),
          ),
        );
      },
    );
  }
}

AddPersonAlert(context, file_path) {
  TextEditingController _name = TextEditingController();
  TextEditingController _relationship = TextEditingController();

  Widget addButton = ElevatedButton(
      child: Text('Add'),
      onPressed: () async {
        if (_name.text.isEmpty && _relationship.text.isEmpty) {
          Fluttertoast.showToast(msg: 'Please provide details of person');
        } else {
          await FirebaseFirestore.instance
              .collection('addToPie')
              .doc('newperson')
              .set({
            "name": _name.text,
            "relationship": _relationship.text,
            "file_path": file_path
          });
          Navigator.of(context).pop();
        }
      });

  Widget backButton = ElevatedButton(
      child: Text('Back'),
      onPressed: () {
        Navigator.of(context).pop();
      });

  AlertDialog alert = AlertDialog(
    title: Text('Add this Person to database'),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(children: [
        TextField(
          controller: _name,
          decoration: InputDecoration(
              labelText: 'Enter Name',
              hintText: 'What\'s the name of this person'),
        ),
        TextField(
          controller: _relationship,
          decoration: InputDecoration(
              labelText: 'Relationship',
              hintText: 'What\'s your relationship with this person'),
        )
      ]),
    ),
    actions: [backButton, addButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
