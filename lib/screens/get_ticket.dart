import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upevent/screens/ticket_screen/ticket_user_details.dart';
import 'package:upevent/screens/ticket_screen/ticket_user_payment.dart';
import 'package:upevent/screens/ticket_screen/ticket_user_preview.dart';

class GetTicket extends StatefulWidget {
  final String uid;
  final String eventName;
  final String eventPrice;
  final String eventDate;
  final String eventSTime;
  final String eventETime;
  final String eventAddress;
  final String eventDays;

  const GetTicket(
      {super.key,
      required this.eventName,
      required this.eventDate,
      required this.eventSTime,
      required this.eventETime,
      required this.eventAddress,
      required this.eventDays,
      required this.eventPrice,
      required this.uid});

  @override
  State<GetTicket> createState() => _GetTicketState();
}

final ticketDatabaseReference = FirebaseDatabase.instance.ref("TicketData");

class _GetTicketState extends State<GetTicket> {
  final PageController _pageController = PageController();
  late TextEditingController userName = TextEditingController();
  late TextEditingController userEmail = TextEditingController();
  TextEditingController userMobile = TextEditingController();
  TextEditingController userStudentEmail = TextEditingController();
  TextEditingController userRegNumber = TextEditingController();
  TextEditingController userCourseName = TextEditingController();
  TextEditingController userYear = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket: ${widget.eventName}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade300,
                  dotColor: Colors.grey.shade800,
                  dotHeight: 3),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                //page 1:
                TicketUserDetails(
                  userCourseName: userCourseName,
                  userEmail: userEmail,
                  userMobile: userMobile,
                  userName: userName,
                  userRegNumber: userRegNumber,
                  userStudentEmail: userStudentEmail,
                  userYear: userYear,
                  pageController: _pageController,
                  uid: widget.uid,
                ),
                //page 2:
                TicketUserPayment(
                  pageController: _pageController,
                  eventPrice: widget.eventPrice,
                ),
                //page 3:
                TicketUserPreview(
                  uid: widget.uid,
                  userName: userName.value.text,
                  userRegNumber: userRegNumber.value.text,
                  eventName: widget.eventName,
                  eventDate: widget.eventDate,
                  eventSTime: widget.eventSTime,
                  eventETime: widget.eventETime,
                  eventAddress: widget.eventAddress,
                  eventDays: widget.eventDays,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
