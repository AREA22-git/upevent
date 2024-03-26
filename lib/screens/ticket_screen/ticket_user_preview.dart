import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ticket_material/ticket_material.dart';

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
  ScreenshotController screenshotController = ScreenshotController();
  final user = FirebaseAuth.instance.currentUser;
  String nName = "";
  Future getuserData() async {
    String uid = widget.uid;
    DatabaseReference userData = FirebaseDatabase.instance
        .ref("TicketData/$uid/User Ticket List/${user!.uid}/User Name");
    DatabaseEvent event = await userData.once();
    nName = event.snapshot.value.toString();
    print(nName);
    setState(() {});
  }

  Future<String> takeTicketSave(Uint8List bytes) async {
    try {
      await [Permission.storage].request();
      final time = DateTime.now()
          .toIso8601String()
          .replaceAll(":", "-")
          .replaceAll(".", "-");

      final result = await ImageGallerySaver.saveImage(bytes,
          name: "${widget.eventName}_${user!.displayName}_$time");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Your ticket is save in the gallery.")));
      return result["filePath"];
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  @override
  initState() {
    super.initState();
    getuserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Screenshot(
        controller: screenshotController,
        child: RotatedBox(
          quarterTurns: 1,
          child: GestureDetector(
            onDoubleTap: () async {
              try {
                final image = await screenshotController.capture();
                if (image == null) return;

                await takeTicketSave(image);
              } catch (e) {
                print(e.toString());
              }
            },
            child: TicketMaterial(
              radiusBorder: 16,
              useAnimationScaleOnTap: true,
              height: 150,
              leftChild: _buildLeft(),
              rightChild: _buildRight(),
              radiusCircle: 4,
              marginBetweenCircles: 8,
              colorBackground:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
          ),
        ),
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
                nName,
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
          QrImageView(
            size: 90,
            data: user!.uid,
          ),
          const Text(
            "Please double tap\non ticket to save in your gallery.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9.5, color: Colors.black87),
          )
        ],
      )),
    );
  }
}
