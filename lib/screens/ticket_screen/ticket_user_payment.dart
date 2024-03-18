import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class TicketUserPayment extends StatefulWidget {
  final PageController pageController;
  final String eventPrice;
  const TicketUserPayment(
      {super.key, required this.pageController, required this.eventPrice});

  @override
  State<TicketUserPayment> createState() => _TicketUserPaymentState();
}

class _TicketUserPaymentState extends State<TicketUserPayment> {
  paymentFun() {
    showDialog(
        context: context,
        builder: (context) => const Dialog(
              backgroundColor: Colors.transparent,
              child: SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator())),
            ));
    Timer(const Duration(seconds: 9), () {
      Navigator.pop(context);
      widget.pageController
          .nextPage(duration: Durations.medium1, curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            "Ticket Price :",
            style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 24,
                fontWeight: FontWeight.w900),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Icon(
                  HeroIcons.currency_rupee,
                  size: 42,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.eventPrice,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 52,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Pay and Processed ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 108, 108, 108),
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    paymentFun();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          ThemeData.dark().primaryColorDark),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 80))),
                  child: const Text(
                    "PAY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
