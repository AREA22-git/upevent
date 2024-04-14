import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:upevent/customWidgets/greeting.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4.322,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xFF060657), Color(0xFF00AED1)],
      )),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const GreetingWidget(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/profile");
                    },
                    icon: Hero(
                      tag: "profile-image",
                      child: SizedBox(
                        height: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(user.photoURL.toString())),
                      ),
                    ))
              ],
            ),
            const Text(
              "Welcome to\nMUJ UP EVENT",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      )),
    );
  }
}
