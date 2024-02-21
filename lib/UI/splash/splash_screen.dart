// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/home/home_screen.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          provider.currentTheme == 'dark'
              ? "assets/images/splashDark.png"
              : 'assets/images/Group 8.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
