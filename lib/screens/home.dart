import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:upevent/customWidgets/eventcard.dart';
import 'package:upevent/customWidgets/greeting.dart';
import 'package:upevent/customWidgets/simmer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final databaseReference = FirebaseDatabase.instance.ref("EventsData");

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
              icon: ClipOval(child: Image.network(user.photoURL!.toString())))
        ],
        title: const GreetingWidget(),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 10),
          child: Text(
            "Your upcomming events!",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: FirebaseAnimatedList(
              defaultChild: const ShimmerLoading(),
              query: databaseReference,
              itemBuilder: (context, snapshot, index, animation) {
                return EventCard(
                  eventName: snapshot.child("Event Name").value.toString(),
                  eventDate: snapshot.child("Event Date").value.toString(),
                  eventAddress:
                      snapshot.child("Event Address").value.toString(),
                  eventBannerURL:
                      snapshot.child("Event ImageURL").value.toString(),
                  eventDays: snapshot.child("Event Days").value.toString(),
                  eventDes:
                      snapshot.child("Event Description").value.toString(),
                  eventETime: snapshot.child("Event End Time").value.toString(),
                  eventSTime:
                      snapshot.child("Event Start Time").value.toString(),
                );
              }),
        )
      ]),
    );
  }
}
