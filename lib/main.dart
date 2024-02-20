import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upevent/auth_provider/google_sign_in.dart';
import 'package:upevent/constent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upevent/firebase_options.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const UpEventApp());
}

class UpEventApp extends StatefulWidget {
  const UpEventApp({super.key});

  @override
  State<UpEventApp> createState() => _UpEventAppState();
}

class _UpEventAppState extends State<UpEventApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
            textTheme: GoogleFonts.montserratTextTheme(),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.black, foregroundColor: Colors.white)),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapShot) {
              if (userSnapShot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (userSnapShot.hasData) {
                return const HomeScreen();
              } else if (userSnapShot.hasError) {
                return const Scaffold(
                  body: Center(
                    child: Text("Something went wrong!"),
                  ),
                );
              } else {
                return const LoginScreen();
              }
            }),
        routes: {
          "/login": (context) => const LoginScreen(),
          "/home": (context) => const HomeScreen(),
          "/profile": (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
