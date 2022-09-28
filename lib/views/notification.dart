import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state/common/app_color.dart';
import 'package:state/common/app_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                                  Text(snapshot.data!['last_edit']),
                                  Image.network(
                                    snapshot.data!['filepath'].toString(),
                                  )
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
