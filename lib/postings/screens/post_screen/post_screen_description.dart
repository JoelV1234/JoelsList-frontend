import 'package:flutter/material.dart';
import 'package:joelslist/postings/domain/models/post_model.dart';
import 'package:joelslist/widgets/custom_text.dart';

class PostScreenDescription extends StatelessWidget {

  final Post post;
  const PostScreenDescription({ Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const CustomText(
            text: 'Description',
            fontSize: 23,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 21),
          CustomText(
            text: post.description.toString().trim(),
            fontSize: 17.5,
          ),
          const SizedBox(height: 50)  
        ],
    );
  }
}