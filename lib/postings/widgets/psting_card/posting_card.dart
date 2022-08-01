import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_model.dart';
import 'package:joelslist/postings/widgets/psting_card/posting_card_bottom_content.dart';


class PostingCard extends StatelessWidget {
  final Posting posting;
  const PostingCard({Key? key, 
    required this.posting,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(
      builder: (context, contraints) {
        return InkWell(
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (posting.images.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child:  Ink.image(
                          image: NetworkImage(posting.images[0])
                        ) 
                      ),
                    PostingCardBottomContent(posting: posting)
                  ],
                )
            )
          )
        );
      }
    );
  }
}
