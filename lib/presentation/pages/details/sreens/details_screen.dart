import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/presentation/utils/responsive.dart';
import 'package:flutter_exam/presentation/widgets/default_padding.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.identificator});
  final int identificator;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    BookProvider bookProvider =
        Provider.of<BookProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: DefaultPadding(
        child: FutureBuilder(
          future: bookProvider.getBook(identificator),
          builder: (builderContext, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.data == null) {
              return Center(child: Text(L10n.of(context).noData));
            }
            final book = snapshot.data!;
            return Column(
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: book.getCoverBook(),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: responsive.hp(30),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "${L10n.of(context).title}: ${book.title}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "${L10n.of(context).firstYearPublication}: ${book.firstPublishYear}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "${L10n.of(context).editionNumber}: ${book.editionCount}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    L10n.of(context).author,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: ListView.builder(
                    itemCount: book.authorName.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: responsive.wp(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: book
                                  .getAuthorProfileBook(book.authorKey[index]),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              height: responsive.hp(10),
                            ),
                            Text(
                              book.authorName[index],
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
