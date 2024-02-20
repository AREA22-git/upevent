import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:upevent/screens/myticket.dart';

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
            child: ClipOval(
                child: Image.network(
              user.photoURL!.toString(),
              fit: BoxFit.cover,
            )),
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
          ListTile(
            leading: const Icon(HeroIcons.ticket),
            title: const Text("My tickets"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyTickets()));
            },
          ),
          const ListTile(
            leading: Icon(Icons.add_alert),
            title: Text("Request for add Event"),
          ),
          const ListTile(
            leading: Icon(Icons.report),
            title: Text("Report a Event!"),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text("About this App"),
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
            },
          ),
        ]),
      ),
    );
  }
}
