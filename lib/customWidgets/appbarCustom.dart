import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:upevent/customWidgets/greeting.dart';
import 'package:upevent/screens/searchevent.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 290,
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
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchEvent())),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Icon(
                      HeroIcons.magnifying_glass,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Search for events")
                  ]),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
