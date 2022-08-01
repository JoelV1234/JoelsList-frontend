import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_model.dart';
import 'package:joelslist/widgets/custom_text.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (posting.images.isNotEmpty)
                        SizedBox(
                            height: getCardHeight(cardPadding, contraints) * 0.55,
                            child:  Ink.image(
                              image: NetworkImage(posting.images[0])
                            ) 
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                        
                          child : Column(
                            children: [
                              const SizedBox(height: 10),
                              CustomText(text: posting.title, fontSize: 20),
                              const SizedBox(height: 15),
                              CustomText(text: posting.price ?? '', fontSize: 20)
                            ]
                          )
                        )
                    ],
                  )
              )
          )
        );
      }
    );
  }
}
