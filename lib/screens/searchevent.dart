import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SearchEvent extends StatefulWidget {
  const SearchEvent({super.key});

  @override
  State<SearchEvent> createState() => _SearchEventState();
}

final TextEditingController searchbox = TextEditingController();

class _SearchEventState extends State<SearchEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search Event"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchbox,
                decoration: InputDecoration(
                  prefixIcon: const Icon(HeroIcons.magnifying_glass),
                  labelText: "Search for event",
                  hintText: "Example: Oneiros",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ));
  }
}
