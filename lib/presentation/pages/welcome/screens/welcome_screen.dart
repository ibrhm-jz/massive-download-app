import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/presentation/widgets/default_button.dart';
import 'package:flutter_exam/presentation/widgets/default_input.dart';
import 'package:flutter_exam/presentation/widgets/default_padding.dart';
import 'package:flutter_exam/router/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _body(context),
            _actions(context),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Text(
          L10n.of(context).welcome,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<BookProvider>(builder: (context, bookProvider, child) {
          return DefaultInput(
            controller: bookProvider.maxDownloadCountCtrl,
            labelText: L10n.of(context).numberOfBooks,
            textInputType: TextInputType.number,
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _actions(BuildContext context) {
    return DefaultButton(
        text: L10n.of(context).continueBtn,
        onPressed: () async {
          final bookProvider = context.read<BookProvider>();
          await bookProvider.clearBooks();
          if (context.mounted) {
            AutoRouter.of(context).push(const HomeBookRoute());
          }
        });
  }
}
