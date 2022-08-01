import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_model.dart';
import 'package:joelslist/postings/widgets/psting_card/posting_card_bottom_content.dart';


class PostingCard extends StatelessWidget {
  final Posting posting;
  final int crossAxisFactor;
  const PostingCard({Key? key, 
    required this.posting,
    required this.crossAxisFactor
  }) : super(key: key);


  //TODO figure out a better way to get height instead of using cross asix
  double getCardHeight(EdgeInsets padding, BoxConstraints constraints) {
    return constraints.maxHeight - (padding.vertical * 2);
  }

  @override
  Widget build(BuildContext context) {

    EdgeInsets cardPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return LayoutBuilder(
      builder: (context, contraints) {
        return Padding(
          padding: cardPadding,
          child: InkWell(
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (posting.images.isNotEmpty)
                        SizedBox(
                            height: getCardHeight(cardPadding, contraints) * 0.6,
                            child:  Ink.image(
                              image: NetworkImage(posting.images[0])
                            ) 
                        ),
                        PostingCardBottomContent(posting: posting)
                    ],
                )
              )
            )
          )
        );
      }
    );
  }
}
