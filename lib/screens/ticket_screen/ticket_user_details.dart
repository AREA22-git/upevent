import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upevent/screens/get_ticket.dart';
import 'package:uuid/uuid.dart';

class TicketUserDetails extends StatefulWidget {
  final PageController pageController;
  final TextEditingController userName;
  final TextEditingController userEmail;
  final TextEditingController userMobile;
  final TextEditingController userStudentEmail;
  final TextEditingController userRegNumber;
  final TextEditingController userCourseName;
  final TextEditingController userYear;
  final String uid;
  const TicketUserDetails(
      {super.key,
      required this.pageController,
      required this.userName,
      required this.userEmail,
      required this.userMobile,
      required this.userStudentEmail,
      required this.userRegNumber,
      required this.userCourseName,
      required this.userYear,
      required this.uid});

  @override
  State<TicketUserDetails> createState() => _TicketUserDetailsState();
}

class _TicketUserDetailsState extends State<TicketUserDetails> {
  final user = FirebaseAuth.instance.currentUser;
  String generateUniqueCode() {
    var ucode = const Uuid();
    return ucode.v4();
  }

  void sumitDatatoDatabase(String ticketCode) {
    ticketDatabaseReference
        .child(widget.uid)
        .child("User Ticket List")
        .child(user!.uid)
        .set({
      "User UID": user!.uid,
      "User Name": widget.userName.text.toString(),
      "Email": user!.email,
      "Mobile Number": widget.userMobile.text.toString(),
      "Student Email": widget.userStudentEmail.text.toString(),
      "Registration Number": widget.userRegNumber.text.toString(),
      "Course": widget.userCourseName.text.toString(),
      "Collage Year": widget.userYear.text.toString(),
      "Ticket UCODE": ticketCode
    });
    widget.pageController
        .nextPage(duration: Durations.medium1, curve: Curves.linear);

    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();
    widget.userName.text = user!.displayName.toString();
    widget.userEmail.text = user!.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text(
                "Your basic details :",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ),
            TextField(
              controller: widget.userName,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  labelText: "Full Name (As on your ID Card)"),
            ),
            TextField(
              controller: widget.userEmail,
              readOnly: true,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Your Email",
              ),
            ),
            TextField(
              controller: widget.userMobile,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: "Mobile number", hintText: "99X XXXX XXX"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                "Your university details :",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ),
            TextField(
              controller: widget.userStudentEmail,
              style: const TextStyle(color: Colors.white),
              decoration:
                  const InputDecoration(labelText: "Your student email"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: widget.userRegNumber,
              onChanged: (value) => setState(() {}),
              style: const TextStyle(color: Colors.white),
              decoration:
                  const InputDecoration(labelText: "Your registration number"),
            ),
            TextField(
              controller: widget.userCourseName,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: "Your course"),
            ),
            TextField(
              controller: widget.userYear,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Your current year"),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: ElevatedButton.icon(
                  onPressed: () {
                    sumitDatatoDatabase(generateUniqueCode());
                  },
                  label: const Text("Next"),
                  icon: const Icon(Icons.arrow_forward)),
            )
          ],
        ),
      ),
    );
  }
}
