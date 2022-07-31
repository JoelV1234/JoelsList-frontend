import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/posting_model.dart';
import 'package:joelslist/widgets/custom_text.dart';

class PostingCard extends StatelessWidget {
  final Posting posting;
  final int crossAxisFactor;
  const PostingCard({Key? key, 
    required this.posting,
    required this.crossAxisFactor
  }) : super(key: key);


  //TODO figure out a better way to get height instead of using cross asix
  double getCardHeight(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    int cards = (screenSize / crossAxisFactor).floor();
    double width = (screenSize / cards) - 10;
    return width / 0.75;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: InkWell(
            child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (posting.images.isNotEmpty)
                      SizedBox(
                          height: getCardHeight(context) * 0.5,
                          child:  Ink.image(
                            image: NetworkImage(posting.images[0])
                          ) 
                      ),
                      const SizedBox(height: 10),
                      CustomText(text: posting.title, fontSize: 20),
                      const SizedBox(height: 15),
                      CustomText(text: posting.price ?? '', fontSize: 20)
                  ],
                )
            )
        )
    );
  }
}
