import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/library_provider%20(4).dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final libProvider = Provider.of<LibraryProvider>(context, listen: false);
    libProvider.init();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                TextField(
                  onChanged: (value) => libProvider.runSearch(value),
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
                ChoiceChip(
                  label: Text("filter"),
                  selected: false,
                  onSelected: (value) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Барлығы'),
                                ),
                                onTap: () {
                                  libProvider.runFilter('');
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Көркем Әдебиет'),
                                ),
                                onTap: () {
                                  libProvider.runFilter('Көркем Әдебиет');

                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Балалар Әдебиеті'),
                                ),
                                onTap: () {
                                  // _runFilter('Балалар Әдебиеті');

                                  libProvider.runFilter('Көркем Әдебиет');
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Отбасы'),
                                ),
                                onTap: () {
                                  libProvider.runFilter('Отбасы');
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.copy),
                                  title: Text('Оқу'),
                                ),
                                onTap: () {
                                  libProvider.runFilter('Оқу');
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.paste),
                                  title: Text('Әртүрлі'),
                                ),
                                onTap: () {
                                  libProvider.runFilter('Әртүрлі');
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
                ChoiceChip(
                  label: Text("getData"),
                  selected: false,
                  onSelected: (value) {
                    // getData();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<LibraryProvider>(builder: (context, data, child) {
              return Expanded(
                child: data.books.isNotEmpty
                    ? BookList(bookList: data.books)
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  final List<Book> bookList;
  const BookList({super.key, required this.bookList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: bookList.length,
        itemBuilder: (context, index) => Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    bookList[index].title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(
                    Icons.book,
                    size: 50,
                  ),
                  trailing: const Text("Read"),
                ),
              ),
            ));
  }
}
