import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:upevent/customWidgets/appbarCustom.dart';
import 'package:upevent/customWidgets/eventcard.dart';
import 'package:upevent/customWidgets/textSection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final databaseReference = FirebaseDatabase.instance.ref("EventsData");
final sclubdatabaseReference =
    FirebaseDatabase.instance.ref("StudentClubEvent");
final sactivitydatabaseReference =
    FirebaseDatabase.instance.ref("StudentActivityEvent");

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AppbarCustom(),
          const TextSection(textData: "Major events"),
          SizedBox(
            height: 210,
            child: FirebaseAnimatedList(
                defaultChild: Center(
                  child: SizedBox(
                    height: 5,
                    width: 100,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                query: databaseReference,
                scrollDirection: Axis.horizontal,
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
                    eventETime:
                        snapshot.child("Event End Time").value.toString(),
                    eventSTime:
                        snapshot.child("Event Start Time").value.toString(),
                    eventPrice:
                        snapshot.child("Event Ticket Price").value.toString(),
                    uid: snapshot.child("uid").value.toString(),
                  );
                }),
          ),
          const TextSection(textData: "Student club events"),
          SizedBox(
            height: 210,
            child: FirebaseAnimatedList(
                defaultChild: Center(
                  child: SizedBox(
                    height: 5,
                    width: 100,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                query: sclubdatabaseReference,
                scrollDirection: Axis.horizontal,
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
                    eventETime:
                        snapshot.child("Event End Time").value.toString(),
                    eventSTime:
                        snapshot.child("Event Start Time").value.toString(),
                    eventPrice:
                        snapshot.child("Event Ticket Price").value.toString(),
                    uid: snapshot.child("uid").value.toString(),
                  );
                }),
          ),
          const TextSection(textData: "Student Activity"),
          SizedBox(
            height: 210,
            child: FirebaseAnimatedList(
                defaultChild: Center(
                  child: SizedBox(
                    height: 5,
                    width: 100,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                query: sactivitydatabaseReference,
                scrollDirection: Axis.horizontal,
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
                    eventETime:
                        snapshot.child("Event End Time").value.toString(),
                    eventSTime:
                        snapshot.child("Event Start Time").value.toString(),
                    eventPrice:
                        snapshot.child("Event Ticket Price").value.toString(),
                    uid: snapshot.child("uid").value.toString(),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
