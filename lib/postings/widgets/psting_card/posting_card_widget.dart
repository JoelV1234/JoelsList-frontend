import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_card.dart';
import 'package:joelslist/postings/widgets/psting_card/posting_card_bottom_content.dart';


class PostingCardWidget extends StatelessWidget {
  final PostingCard postingCards;
  const PostingCardWidget({Key? key, 
    required this.postingCards,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(
      builder: (context, contraints) {
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed('/post'),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (postingCards.images.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child:  Ink.image(
                          image: NetworkImage(postingCards.images[0])
                        ) 
                      ),
                    PostingCardBottomContent(postingCard: postingCards)
                  ],
                )
            )
          )
        );
      }
    );
  }
}
