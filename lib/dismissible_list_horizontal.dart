import 'package:flutter/material.dart';

class DismissibleListHorizontal extends StatelessWidget {
  DismissibleListHorizontal({super.key});

  final List<String> jokes = List.generate(
    20,
    (index) => 'Funny joke ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: jokes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.vertical,
            background: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Icon(
                Icons.archive,
                color: Colors.white,
              ),
            ),
            child: Card(
              color: Colors.blue.shade50,
              child: Container(
                width: 100,
                alignment: Alignment.center,
                child: Text(jokes[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
