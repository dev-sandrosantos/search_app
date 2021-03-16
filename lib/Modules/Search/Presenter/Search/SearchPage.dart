import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Search..."),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (_, id) {
              return ListTile();
            }),
          ),
        ],
      ),
    );
  }
}
