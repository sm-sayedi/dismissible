import 'package:flutter/material.dart';

import 'dismissible_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const DismissibleList(),
    );
  }
}
