import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/application/book/book_cubit.dart';
import 'package:flutter_exam/application/book/book_state.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/presentation/widgets/default_button.dart';
import 'package:flutter_exam/presentation/widgets/default_padding.dart';
import 'package:provider/provider.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Descarga de libros')),
      body: DefaultPadding(
        child: Column(
          children: [
            BlocBuilder<BookCubit, BookState>(builder: (context, state) {
              if (state is BookInitial) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BookCubit>().getBooksFromAPIAsync();
                    },
                    child: const Text('Iniciar descarga'),
                  ),
                );
              } else if (state is BookLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.download),
                      LinearProgressIndicator(value: (state.progress) / 100),
                      const SizedBox(height: 10),
                      Text(
                        state.progress == 100
                            ? '¡Descarga completa!'
                            : 'Descargando... ${(state.progress).toStringAsFixed(1)}%',
                      ),
                    ],
                  ),
                );
              } else if (state is BookLoaded) {
                return const Center(child: Text('Descarga completa'));
              } else if (state is BookError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox.shrink();
            }),
            Consumer<BookProvider>(builder: (context, bookProvider, child) {
              if (!bookProvider.isInitialized) {
                return const Center(child: CircularProgressIndicator());
              }

              List<BookLocalModel> books = bookProvider.books;
              print("Libros en el provider: ${books.length}");

              if (books.isEmpty) {
                return const Center(child: Text('No hay libros guardados.'));
              }
              return Expanded(
                child: GridView.builder(
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
                              child: Image.network(
                                book.getAuthorProfile(),
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
                            DefaultButton(text: 'Ver mas', onPressed: () {})
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
                                color: Colors.black.withOpacity(
                                    0.6), // Fondo opaco para visibilidad
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(Icons.close,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
