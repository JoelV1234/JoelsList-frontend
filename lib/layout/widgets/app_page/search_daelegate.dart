import 'package:flutter/material.dart';

class AppPageSearchDelegate extends SearchDelegate {

  List<String> searchItems;
  Function(String result) onQuerySelected;

  AppPageSearchDelegate({
    this.searchItems = const [],
    required this.onQuerySelected
  });

  void onResultSelected(BuildContext context, result) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      close(context, result);
      onQuerySelected(result);      
    });

  }

  @override
  List<Widget>? buildActions(BuildContext context) =>
      [IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(Icons.close))];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {

    onResultSelected(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (String fruit in searchItems) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () => onResultSelected(context, result)
        );
      }
    );
  }
}
