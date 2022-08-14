import 'package:joelslist/postings/domain/models/posting_card_model.dart';

class Post extends PostingCard {

  String? description;
  DateTime? postedTime;
  DateTime? updatedTime; 

  Post({
    super.dataPid,
    super.images,
    super.location,
    super.postUrl,
    super.price,
    super.title,
    this.description,
    this.postedTime,
    this.updatedTime
  });

  factory Post.fromJson(dynamic postJson) {
    return Post(
      title: postJson['title'] ?? '',
      price: postJson['price'],
      location: postJson['location'],
      images:List<String>.from(postJson['images'] as List),
      dataPid: postJson['data_pid'],
      postUrl: postJson['post_url'],
      description: postJson['description'],
      postedTime: DateTime.tryParse(postJson['posted_time']),
      updatedTime: DateTime.tryParse(postJson['updated_time'])
    );
  }

}
