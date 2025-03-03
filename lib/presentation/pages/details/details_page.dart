import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/pages/details/sreens/details_screen.dart';
import 'package:flutter_exam/presentation/utils/responsive_layout.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  final int identificator;
  const DetailsPage({super.key, required this.identificator});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: DetailsScreen(
        identificator: widget.identificator,
      ),
    );
  }
}
