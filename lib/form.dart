import 'package:counter_7/main.dart';
import 'package:counter_7/list.dart';
import 'package:counter_7/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPage();
}

class _AddBudgetPage extends State<AddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  int? _nominal;
  String? _jenisBudget;
  final list = ["Pemasukan", "Pengeluaran"];
  List<DropdownMenuItem<String>> _createList() {
    return list.map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
                ),
            )
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      drawer: Drawer(
        child: Column(children: [
          ListTile(
            title: const Text('counter_7'),
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
        ]),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: moonstruxs",
                          labelText: "Judul"
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Kosong!';
                          }
                          return null;
                        }, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: 20000",
                          labelText: "Nominal",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _nominal = int.parse(value!);
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _nominal = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Kosong!';
                          }
                          return null;
                        }, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        hint: Text("Pilih Jenis"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        value: _jenisBudget,
                        items: _createList(),
                        onChanged: (String? Value) {
                          setState(() {
                            _jenisBudget = Value!;
                          });
                        },
                        validator: (value) => value == null ? 'Input Kosong!' : null,
                      ),
                    ),  
                  ],
                ),
              ),
            ),
          ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left : 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    var data = Budget(_judul!, _nominal!, _jenisBudget!);
                    Budgets.budgets.add(data);
                  }
                },
                child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
            )
          ],
          )
        ),
    );
  }
}