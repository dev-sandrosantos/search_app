import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_app/Modules/Search/Presenter/Search/States/State.dart';
import 'package:search_app/Modules/Search/Presenter/SearchBloC.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloC>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Search..."),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;
                  if (state is SearchState) {
                    return Center(child: const Text('Digite Seu Texto'));
                  }
                  if (state is SearchError) {
                    return Center(child: const Text('Houve um Erro'));
                  }
                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final list = (state as SearchSuccess).list;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return ListTile(
                          leading: item.img == null
                              ? Container()
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(item.img),
                                ),
                          title: Text(item.title ?? ""),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
