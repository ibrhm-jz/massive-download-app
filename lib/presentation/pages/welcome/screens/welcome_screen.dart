import 'package:flutter/material.dart';
import 'package:flutter_exam/domain/enums/locale_language.dart';
import 'package:flutter_exam/presentation/utils/locale_format.dart';
import 'package:flutter_exam/presentation/widgets/default_padding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    return Scaffold(
      body: DefaultPadding(
          child: Column(
        children: [
          Text(
              LocalFormat.instance.formattDateNumber(now, locale: Language.en)),
        ],
      )),
    );
  }
}
