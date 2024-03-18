import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:upevent/screens/get_ticket.dart';

class TicketUserPreview extends StatefulWidget {
  final String uid;
  final String userName;
  final String userRegNumber;
  final String eventName;
  final String eventDate;
  final String eventSTime;
  final String eventETime;
  final String eventAddress;
  final String eventDays;
  const TicketUserPreview(
      {super.key,
      required this.userName,
      required this.userRegNumber,
      required this.eventName,
      required this.eventDate,
      required this.eventSTime,
      required this.eventETime,
      required this.eventAddress,
      required this.eventDays,
      required this.uid});

  @override
  State<TicketUserPreview> createState() => _TicketUserPreviewState();
}

class _TicketUserPreviewState extends State<TicketUserPreview> {
  final user = FirebaseAuth.instance.currentUser;
  late String Nname = "Go";
  Future<String> getData() async {
    final snapshot = await ticketDatabaseReference
        .child('${widget.uid}/User Ticket List/${user!.uid}/User Name')
        .get();
    if (snapshot.exists) {
      debugPrint(snapshot.value.toString());
      return snapshot.value.toString();
    } else {
      debugPrint('No data available.');
      return 'No data available.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: RotatedBox(
        quarterTurns: 1,
        child: TicketMaterial(
            radiusBorder: 16,
            useAnimationScaleOnTap: true,
            height: 150,
            leftChild: _buildLeft(),
            rightChild: _buildRight(),
            radiusCircle: 4,
            marginBetweenCircles: 8,
            colorBackground: Colors.lime),
      ),
    );
  }

  Widget _buildLeft() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Event Name"),
              Text(
                widget.eventName,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Event Date"),
                  Text(
                    widget.eventDate,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w900),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Event Durition"),
                    Text(
                      "${widget.eventDays} Days",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Start Time"),
                  Text(
                    widget.eventSTime,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w900),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("End Time"),
                  Text(
                    widget.eventETime,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ticket Owner"),
              Text(
                Nname,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRight() {
    return RotatedBox(
      quarterTurns: -1,
      child: Center(
          child: Column(
        children: [
          // QrImageView(
          //   size: 100,
          //   data: "",
          // ),
          // Text("")
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.abc,
                size: 80,
              ))
        ],
      )),
    );
  }
}
