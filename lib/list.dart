import 'package:counter_7/models.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/watchlist/mywatchlist.dart';



void main() {
  runApp(const MyApp());
}

class ListBudgetPage extends StatefulWidget {
    const ListBudgetPage({super.key});

    @override
    State<ListBudgetPage> createState() => _ListBudgetPage();
    
}

class _ListBudgetPage extends State<ListBudgetPage> {
    var dataList = Budgets.budgets;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
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
            body: Container(
                height: MediaQuery.of(context).size.height * 0.75, 
                child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (ctx, index){
                    return Card(child: ListTile(
                        title: 
                            Text(dataList[index].judul, style: const TextStyle(fontSize: 24)),
                        subtitle:
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(dataList[index].nominal.toString()),
                                    Text(dataList[index].tipeBudget)
                                ],
                            )
                        ),
                    );
                }, 
            )
            ),
        );
    }
}