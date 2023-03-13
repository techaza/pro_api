import 'package:flutter/material.dart';
import 'package:pro_api/providers/list_provider.dart';
import 'package:provider/provider.dart';

class prof extends StatefulWidget {
  int index1;
  prof({super.key, required this.index1});

  @override
  State<prof> createState() => _profState();
}

class _profState extends State<prof> {
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
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.greenAccent,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 450),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 15),
                    child: Text(
                      'first name : ${m.k!.data![widget.index1].firstName}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, left: 15),
                    child: Text(
                      'last name : ${m.k!.data![widget.index1].lastName}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0, left: 15),
                    child: Text(
                      'email : ${m.k!.data![widget.index1].email}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0, left: 15),
                    child: Text(
                      'id : ${m.k!.data![widget.index1].id}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  )
                ]),
              ),
            ),
            Center(
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('${m.k!.data![widget.index1].avatar}'),
                radius: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
