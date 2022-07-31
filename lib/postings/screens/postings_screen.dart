import 'package:flutter/material.dart';
import 'package:joelslist/layout/widgets/app_page/app_page.dart';
import 'package:joelslist/layout/widgets/app_page/search_daelegate.dart';
import 'package:joelslist/postings/domain/posting_model.dart';
import 'package:joelslist/postings/domain/posting_repository.dart';
import 'package:joelslist/postings/widgets/postings_widget.dart';



class PostingsScreen extends StatefulWidget {
  final String? searchQuery;
  const PostingsScreen({Key? key,
    this.searchQuery
  }) : super(key: key);

  @override
  State<PostingsScreen> createState() => _PostingsScreenState();
}

class _PostingsScreenState extends State<PostingsScreen> {

  late Future<List<Posting>> postings;
  PostingsRepository repository = PostingsRepository();

  List<String> searchItems = [
    'watermelon',
    'apple',
    'oragne',
    'printer'
  ];

  @override
  void initState() {
    super.initState();
    postings = repository.getPostings(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
        title: widget.searchQuery ?? '',
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context, 
                delegate: AppPageSearchDelegate(
                  searchItems: searchItems,
                  onQuerySelected: (String result) {
                    Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => PostingsScreen(searchQuery: result)
                      )
                    );
                  } 
                )
              );
            },
          )
        ],
        child: PostingsWidget(postings: postings)
      
    );
  }
}


