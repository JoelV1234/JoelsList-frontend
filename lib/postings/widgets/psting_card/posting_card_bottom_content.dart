import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/posting_model.dart';
import 'package:joelslist/widgets/custom_text.dart';

class PostingCardBottomContent extends StatelessWidget {
  final Posting posting;
  const PostingCardBottomContent({Key? key, 
    required this.posting
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13),
        CustomText(text: posting.title, fontSize: 16),
        const SizedBox(height: 16),
        CustomText(
          text: posting.price ?? '', 
          fontSize: 26, 
          weight: FontWeight.w500
        ),
        const SizedBox(height: 20)
      ]
    );
  }
}
