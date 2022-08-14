import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_card_model.dart';
import 'package:joelslist/postings/widgets/psting_card/posting_card_bottom_content.dart';


class PostingCardWidget extends StatelessWidget {
  final PostingCard postingCard;
  const PostingCardWidget({Key? key, 
    required this.postingCard,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, contraints) {
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            '/post?postId=${postingCard.dataPid}'
          ),
          child: Card(
            elevation: 0,
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (postingCard.images.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child:  Ink.image(
                          fit: BoxFit.cover,
                          image: NetworkImage(postingCard.images[0])
                        ) 
                      ),
                    PostingCardBottomContent(postingCard: postingCard)
                  ],
                )
            )
        );
      }
    );
  }
}
