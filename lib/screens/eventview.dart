import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:upevent/customWidgets/clipwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:upevent/screens/get_ticket.dart';

class EventViewScreen extends StatelessWidget {
  final String uid;
  final String eventName;
  final String eventDate;
  final String eventSTime;
  final String eventETime;
  final String eventAddress;
  final String eventBannerURL;
  final String eventDays;
  final String eventDes;
  final String eventPrice;
  const EventViewScreen({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventSTime,
    required this.eventETime,
    required this.eventAddress,
    required this.eventBannerURL,
    required this.eventDays,
    required this.eventDes,
    required this.eventPrice,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GetTicket(
                          uid: uid,
                          eventPrice: eventPrice,
                          eventName: eventName,
                          eventDate: eventDate,
                          eventSTime: eventSTime,
                          eventETime: eventETime,
                          eventAddress: eventAddress,
                          eventDays: eventDays)));
            },
            icon: const Icon(HeroIcons.ticket),
            label: const Text("Get a ticket!")),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: 400,
                        child: Hero(
                            tag: "hero-card-tag$eventName",
                            child: Image.network(
                              eventBannerURL,
                              fit: BoxFit.cover,
                            ))),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: 400,
                        child: Container(
                          color: Colors.black38,
                        )),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton.filled(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.black),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.white60)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 5,
                    child: Text(
                      eventName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipWidget(
                          text: eventDate, icon: Icons.calendar_month),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipWidget(text: eventSTime, icon: Icons.av_timer),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipWidget(
                          text: eventETime, icon: Icons.time_to_leave),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipWidget(
                          text: "$eventDays Days Event",
                          icon: Icons.timelapse_rounded),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MarkdownBody(
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
                    data: eventDes,
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Event Address : $eventAddress",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 160,
              ),
            ],
          ),
        ));
  }
}
