import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joelslist/postings/domain/models/posting_card.dart';
import 'package:joelslist/postings/widgets/psting_card/posting_card_widget.dart';
import 'package:joelslist/widgets/future_widget.dart';

class PostingsWidget extends StatelessWidget {

  final Future<List<PostingCard>> postingCards;
  const PostingsWidget({ Key? key,
    required this.postingCards
  }) : super(key: key);


  @override
  Widget build(BuildContext context){

    int crossAxisFactor = 250;
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureWidget<List<PostingCard>>(
      future: postingCards,
      onData: (data) => MasonryGridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: (screenWidth/crossAxisFactor).floor(),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: data != null ? data.length : 0,
        itemBuilder: (context, index) {
            return PostingCardWidget(
              postingCards: data![index]
            );
        },
      )
    );
  }
}

          