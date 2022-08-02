import 'package:flutter/material.dart';
import 'package:joelslist/layout/widgets/app_page/app_page.dart';

class PostScreen extends StatefulWidget {
  final String? postId;
  const PostScreen({Key? key, this.postId}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'post',
      child: Container()
    );
  }
}
