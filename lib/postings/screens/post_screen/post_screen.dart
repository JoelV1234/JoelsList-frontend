import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:joelslist/layout/widgets/app_page/app_page.dart';
import 'package:joelslist/locator.dart';
import 'package:joelslist/postings/domain/models/post_model.dart';
import 'package:joelslist/postings/domain/posting_repository.dart';
import 'package:joelslist/postings/screens/post_screen/post_screen_description.dart';
import 'package:joelslist/widgets/future_widget.dart';

class PostScreen extends StatefulWidget {
  final String? postId;
  const PostScreen({Key? key, this.postId}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<Post> getPost;

  @override
  void initState() {
    super.initState();
    getPost = locator<PostingsRepository>().getPost(widget.postId);
  }

  double carouselImageMaxWidth = 500;

  double carouselImageWidth(width) {
    if (width * 0.8 > carouselImageMaxWidth) {
      return carouselImageMaxWidth / width;
    }
    return 0.8;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureWidget<Post>(
          future: getPost,
          onData: (post) => AppPage(
              title: post?.title ?? '',
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  CarouselSlider.builder(
                      itemCount: post?.images.length,
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: carouselImageWidth(width),
                          height: carouselImageWidth(width) * width),
                      itemBuilder: (context, index, pageViewIndex) {
                        return Ink.image(
                            fit: BoxFit.cover,
                            image: NetworkImage(post!.images[index]));
                      }),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: (width * 0.2) / 2),
                      child: PostScreenDescription(post: post!))
                ],
              ))),
    );
  }
}
