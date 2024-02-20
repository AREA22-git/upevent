import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upevent/auth_provider/google_sign_in.dart';
import 'package:upevent/constent.dart';
import 'package:cached_video_player/cached_video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late CachedVideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //Video start medthod.
  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.network(
        "https://www.pexels.com/download/video/3722010/")
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.setPlaybackSpeed(0.9);
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: CachedVideoPlayer(_controller)
                ),
          ),
        ),
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              height: _controller.value.size.height,
              width: _controller.value.size.width,
              child: Container(color: Colors.black54),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 180,
              width: 180,
              child: Image.asset("assets/images/trLogowhite.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bringing Events to\nYour Fingertips :".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Experience",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Connect",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Explore.!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              )),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        icon: SizedBox(
                            height: 24,
                            child: Image.asset("assets/images/google.png")),
                        label: const Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      appDeveloper,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Version: $appVersion",
                      textAlign: TextAlign.center,
                    )
                  ]),
            ))
      ],
    ));
  }
}
