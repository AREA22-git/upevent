import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetTicket extends StatefulWidget {
  final String eventName;
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
      required this.eventDays});

  @override
  State<GetTicket> createState() => _GetTicketState();
}

class _GetTicketState extends State<GetTicket> {
  final user = FirebaseAuth.instance.currentUser;
  final PageController _pageController = PageController();
  late TextEditingController userName = TextEditingController();
  late TextEditingController userEmail = TextEditingController();
  TextEditingController userMobile = TextEditingController();
  TextEditingController userStudentEmail = TextEditingController();
  TextEditingController userRegNumber = TextEditingController();
  TextEditingController userCourseName = TextEditingController();
  TextEditingController userYear = TextEditingController();

  @override
  void initState() {
    super.initState();
    userName.text = user!.displayName.toString();
    userEmail.text = user!.email.toString();
  }

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
              controller: _pageController,
              children: [
                //page 1:
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text(
                            "Your basic details :",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        TextField(
                          controller: userName,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              labelText: "Full Name (As on your ID Card)"),
                        ),
                        TextField(
                          controller: userEmail,
                          readOnly: true,
                          style: const TextStyle(color: Colors.grey),
                          decoration: const InputDecoration(
                            labelText: "Your Email",
                          ),
                        ),
                        TextField(
                          controller: userMobile,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              labelText: "Mobile number",
                              hintText: "+91 99X XXXX XXX"),
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
                          controller: userStudentEmail,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              labelText: "Your student email"),
                        ),
                        TextField(
                          controller: userRegNumber,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              labelText: "Your registration number"),
                        ),
                        TextField(
                          controller: userCourseName,
                          style: const TextStyle(color: Colors.white),
                          decoration:
                              const InputDecoration(labelText: "Your course"),
                        ),
                        TextField(
                          controller: userYear,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: "Your current year"),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Durations.medium1,
                                    curve: Curves.linear);
                              },
                              child: const Icon(Icons.arrow_forward)),
                        )
                      ],
                    ),
                  ),
                ),
                //page 2:
                SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Your university details :",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _pageController.previousPage(
                                    duration: Durations.medium1,
                                    curve: Curves.linear);
                              },
                              child: const Icon(Icons.arrow_back)),
                          const SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Durations.medium1,
                                    curve: Curves.linear);
                              },
                              child: const Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ],
                  ),
                )),
                //page 3:
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(user!.providerData.toString()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
