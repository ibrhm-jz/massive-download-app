import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/application/book/book_cubit.dart';
import 'package:flutter_exam/application/book/book_state.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/presentation/widgets/default_button.dart';
import 'package:flutter_exam/presentation/widgets/default_confirm_modal.dart';
import 'package:flutter_exam/presentation/widgets/default_padding.dart';
import 'package:flutter_exam/router/router.gr.dart';
import 'package:flutter_exam/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBookScreen extends StatefulWidget {
  const HomeBookScreen({super.key});

  @override
  State<HomeBookScreen> createState() => _HomeBookScreenState();
}

class _HomeBookScreenState extends State<HomeBookScreen>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    final productsProvider = Provider.of<BookProvider>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productsProvider.setPage();
        productsProvider.getAllPaginateBooks().then((_) {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).infoLibrary),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'clear') {
                final bookProvider = context.read<BookProvider>();
                await showDialog(
                  context: context,
                  builder: (context) => DefaultConfirmModal(
                    type: DefaultConfirmModalType.deleted,
                    onPressed: () async {
                      await bookProvider.clearBooks();
                      if (context.mounted) {
                        AutoRouter.of(context)
                            .replaceAll([const WelcomeRoute()]);
                      }
                    },
                    titleText: L10n.of(context).doYouWantDelete,
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'clear',
                child: Text(L10n.of(context).deleteRecords),
              ),
            ],
          ),
        ],
      ),
      body: DefaultPadding(
        child: Column(
          children: [
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.download),
                        LinearProgressIndicator(value: (state.progress) / 100),
                        const SizedBox(height: 10),
                        Text(
                          '${L10n.of(context).downloadProgress}${(state.progress).toStringAsFixed(1)}%',
                        ),
                      ],
                    ),
                  );
                } else if (state is BookSuccess) {
                  return Center(child: Text(L10n.of(context).downloadComplete));
                } else if (state is BookError) {
                  return Center(
                      child: Text('${L10n.of(context).error}${state.message}'));
                }
                return const SizedBox.shrink();
              },
            ),
            Consumer<BookProvider>(
              builder: (context, bookProvider, child) {
                if (!bookProvider.isInitialized) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<BookLocalModel> books = bookProvider.books;
                if (books.isEmpty) {
                  return Center(child: Text(L10n.of(context).noBooks));
                }
                return Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1),
                    ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 200,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: book.getCoverBook(),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Text(
                                book.title ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              DefaultButton(
                                  text: L10n.of(context).seeMore,
                                  onPressed: () {
                                    AutoRouter.of(context).push(
                                      DetailsRoute(identificator: book.id!),
                                    );
                                  })
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 8,
                            child: IconButton(
                              onPressed: () async {
                                await bookProvider.deleteBook(book);
                              },
                              icon: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.neutral100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
