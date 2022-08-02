import 'package:flutter/material.dart';
import 'package:joelslist/locator.dart';
import 'package:joelslist/postings/domain/posting_repository.dart';
import 'package:joelslist/widgets/future_widget.dart';

class PostingsSearchDelegate extends SearchDelegate {

  

  void onResultSelected(BuildContext context, result) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      close(context, result);
        Navigator.pushNamed(
          context, 
          '/postings?query=$result'
        );   
      }
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) =>
      [IconButton(
      onPressed: () {
        query.isEmpty ? close(context, query) : query = '';
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
    
    return FutureWidget<List<String>>(
      future: locator<PostingsRepository>().searchSuggestions(query), 
      onData: (List<String>? data) { 
        List<String> searchItems = data ?? [];
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
    );
  }
}
