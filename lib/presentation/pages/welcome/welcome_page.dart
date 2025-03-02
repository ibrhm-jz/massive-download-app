import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/pages/welcome/screens/welcome_screen.dart';
import 'package:flutter_exam/presentation/utils/responsive_layout.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isAcepted = false;
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: WelcomeScreen(),
    );
  }
}
