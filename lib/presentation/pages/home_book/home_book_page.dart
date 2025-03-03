import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/application/book/book_cubit.dart';
import 'package:flutter_exam/config/injection.dart';
import 'package:flutter_exam/domain/interfaces/i_book_repository.dart';
import 'package:flutter_exam/presentation/pages/home_book/screens/home_book_screen.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/presentation/utils/responsive_layout.dart';

@RoutePage()
class HomeBookPage extends StatefulWidget {
  const HomeBookPage({super.key});

  @override
  State<HomeBookPage> createState() => _HomeBookPageState();
}

class _HomeBookPageState extends State<HomeBookPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BlocProvider(
        create: (context) => BookCubit(
          bookRepository: getIt<IBookRepository>(),
          bookProvider: context.read<BookProvider>(),
        )..getBooksFromAPIAsync(),
        child: const HomeBookScreen(),
      ),
    );
  }
}
