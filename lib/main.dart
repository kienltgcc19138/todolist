import 'package:dart/model/items.dart';
import 'package:flutter/material.dart';
import 'widget/card_body_widget.dart';
import 'widget/card_modal_bottom.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ToDoList', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: items
                  .map((item) =>
                      CardBody(
                        index : items.indexOf(item),
                        item: item, 
                        handleDelete: _handleDeleteTask
                      ))
                  .toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return ModalBottom(addTask: _handleAddTask);
                  });
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, size: 40)));
  }
}
