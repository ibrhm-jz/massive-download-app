import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/application/book/book_cubit.dart';
import 'package:flutter_exam/config/injection.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';
import 'package:flutter_exam/presentation/pages/download/screens/download_screen.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/presentation/utils/responsive_layout.dart';

@RoutePage()
class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BlocProvider(
        create: (context) => BookCubit(
          bookRepository: getIt<IBookRepository>(),
          bookProvider: context.read<BookProvider>(),
        ),
        child: const DownloadScreen(),
      ),
    );
  }
}
