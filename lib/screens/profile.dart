// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:upevent/screens/about.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth_provider/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ignore: non_constant_identifier_names
    final Uri _url_regevent = Uri.parse("https://forms.gle/QMUHt6Sf22wRgYNL7");
    final Uri _url_reportevent =
        Uri.parse("https://forms.gle/nS1fUM8KuzSvxcor7");
    // ignore: unused_element
    Future<void> _launchUrl(url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Hero(
              tag: "profile-image",
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    user.photoURL!.toString(),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(user.displayName!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.white)),
          Text(user.email!,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          // ListTile(
          //   leading: const Icon(HeroIcons.ticket),
          //   title: const Text("My tickets"),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const MyTickets()));
          //   },
          // ),
          ListTile(
            onTap: () {
              _launchUrl(_url_regevent);
            },
            leading: const Icon(Icons.add_alert),
            title: const Text("Request for add Event"),
          ),
          ListTile(
            onTap: () {
              _launchUrl(_url_reportevent);
            },
            leading: const Icon(Icons.report),
            title: const Text("Report a Event!"),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text("About this App"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: const Text("Sign out"),
            onTap: () {
              Navigator.pop(context);
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sign out successfully.")));
            },
          ),
        ]),
      ),
    );
  }
}
