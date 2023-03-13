// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pro_api/prof.dart';
import 'package:pro_api/providers/list_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ListProvider())
        ],
        child: const MaterialApp(
          home: List(),
        ));
  }
}

class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  // late PurpleList k;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListProvider>().fetchList();
  }

  @override
  Widget build(BuildContext context) {
    var m = Provider.of<ListProvider>(context);
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'List',
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: ListView.separated(
            physics: const ScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            itemBuilder: (buildContext, index1) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (index) => prof(
                            index1: index1,
                          )));
                },
                child: ListTile(
                  title: Text(
                      ' name : ${m.k!.data![index1].firstName.toString()}'),
                  leading: Image.network('${m.k!.data![index1].avatar}'),
                  subtitle: Text(
                      ' Last name : ${m.k!.data![index1].lastName.toString()}'),
                  trailing: Text(' id : ${m.k!.data![index1].id.toString()}'),
                ),
              );
            },
            itemCount: m.k!.perPage!.toInt(),
          ),
        )
      ]),
    );
  }
}
