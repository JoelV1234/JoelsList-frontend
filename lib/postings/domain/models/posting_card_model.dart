
class PostingCard {
  String title;
  String? price;
  String? location;
  List<String> images;
  String? dataPid;
  String? postUrl;

  PostingCard({
    this.title = '',
    this.price,
    this.location,
    this.dataPid,
    this.images = const [],
    this.postUrl
  });

  factory PostingCard.fromJson(dynamic postingCardJson) {
    return PostingCard(
      title: postingCardJson['title'] ?? '',
      price: postingCardJson['price'],
      location: postingCardJson['location'],
      images:List<String>.from(postingCardJson['images'] as List),
      dataPid: postingCardJson['data_pid'],
      postUrl: postingCardJson['post_url']
    );
  }

  static List<PostingCard> getListFromJson(dynamic postingCardsJson) {
    List<PostingCard> postings =
        postingCardsJson.map<PostingCard>(
          (posting) => PostingCard.fromJson(posting)
        ).toList();

    return postings;  
  }
}
