import 'dart:convert';
import 'package:counter_7/watchlist/mywatchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/list.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
Future<List<WatchList>> readWatchlistModel() async{
  final String response = await rootBundle.loadString('lib/fixtures/initial_mywatchlist_data.json');
  final list = jsonDecode(response) as List<dynamic>;

  return list.map((e) => WatchList.fromJson(e)).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: Drawer(
                child: Column(
                    children: [
                    ListTile(
                        title: const Text('Counter'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Tambah Budget'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const AddBudgetPage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Data Budget'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ListBudgetPage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('MyWatchlist'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                        );
                        },
                    ),
                    ],
                ),
            ),
      body: FutureBuilder(
        future: readWatchlistModel(),
        builder: (context,data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}")
            );
          } else if(data.hasData) {
            var items = data.data as List<WatchList>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                  shadowColor: Colors.black,
                  elevation: null,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              items[index].fields.title.toString(),
                            ),
                          ],
                        ),
                      ],
                    )),
                );
              }),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
              );
          }
        }
        ),
      );
  }
}