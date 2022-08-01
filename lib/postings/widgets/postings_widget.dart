import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_model.dart';
import 'package:joelslist/postings/widgets/psting_card/posting_card.dart';
import 'package:joelslist/widgets/future_widget.dart';

class PostingsWidget extends StatelessWidget {

  final Future<List<Posting>> postings;
  const PostingsWidget({ Key? key,
    required this.postings
  }) : super(key: key);


  @override
  Widget build(BuildContext context){

    int crassAxisFactor = 250;
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureWidget<List<Posting>>(
      future: postings,
      onData: (data) => GridView.count(
        crossAxisCount: (screenWidth / crassAxisFactor).floor(),
        childAspectRatio: 0.75,
        children: data?.map((posting) => PostingCard(
          posting: posting,
          crossAxisFactor: crassAxisFactor,
        )).toList() ?? []
      )
    );
  }
}