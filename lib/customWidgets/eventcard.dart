import 'package:flutter/material.dart';
import 'package:upevent/screens/eventview.dart';

class EventCard extends StatelessWidget {
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
  const EventCard({
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventViewScreen(
                    uid: uid,
                    eventPrice: eventPrice,
                    eventName: eventName,
                    eventDate: eventDate,
                    eventSTime: eventSTime,
                    eventETime: eventETime,
                    eventAddress: eventAddress,
                    eventBannerURL: eventBannerURL,
                    eventDays: eventDays,
                    eventDes: eventDes)));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Hero(
          tag: "hero-card-tag$eventName",
          child: Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(eventBannerURL)),
                borderRadius: BorderRadius.circular(18)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            eventName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.av_timer,
                                size: 12,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Start Time",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            eventSTime,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.time_to_leave,
                                size: 12,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "End Time",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            eventETime,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    eventAddress,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    eventDate,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
