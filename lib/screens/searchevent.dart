import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: searchbox,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black54,
                  hintText: "Search event",
                  prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    ));
  }
}
