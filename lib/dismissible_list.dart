import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  final List<String> jokes = List.generate(
    20,
    (index) => 'Funny joke ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.red,
          alignment: Alignment.centerLeft,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 28,
          ),
        ),
        secondaryBackground: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.amber,
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.archive,
            color: Colors.white,
            size: 28,
          ),
        ),
        // direction: DismissDirection.startToEnd,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Remove the joke?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          setState(() {
            jokes.removeAt(index);
          });
          // You can optionally add a SnackBar to show user what happened!
        },
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.7,
        },
        movementDuration: const Duration(seconds: 2),
        resizeDuration: const Duration(seconds: 2),
        crossAxisEndOffset: -4,
        child: Card(
          color: Colors.blue.shade50,
          child: ListTile(
            title: Text(jokes[index]),
            subtitle: const Text('A random joke'),
          ),
        ),
      ),
    );
  }
}
