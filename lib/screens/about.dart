import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:upevent/constent.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(HeroIcons.information_circle),
            title: Text(appName),
            subtitle: Text("App Name"),
          ),
          ListTile(
            leading: Icon(HeroIcons.identification),
            title: Text(appDeveloper),
            subtitle: Text("Developer's"),
          ),
          ListTile(
            leading: Icon(HeroIcons.wrench_screwdriver),
            title: Text(appVersion),
            subtitle: Text("App Version"),
          ),
          ListTile(
            leading: Icon(HeroIcons.eye),
            title: Text("Dr. Vaibhav Bhatnagar Sir"),
            subtitle: Text("Supervisor and Subject Teacher"),
          ),
          ListTile(
            leading: Icon(HeroIcons.rocket_launch),
            title: Text("Manipal Universtiy Jaipur"),
            subtitle: Text("Final Year Project (BCA-2021 Batch)"),
          ),
          ListTile(
            leading: Icon(HeroIcons.cloud),
            title: Text("Firebase"),
            subtitle: Text("Back-end service"),
          ),
        ],
      ),
    );
  }
}
