
class Posting {
  String title;
  String? price;
  String? location;
  List<String> images;

  Posting({
    this.title = '',
    this.price,
    this.location,
    this.images = const []
  });

  factory Posting.fromJson(dynamic postingJson) {
    return Posting(
      title: postingJson['title'] ?? '',
      price: postingJson['price'],
      location: postingJson['location'],
      images:List<String>.from(postingJson['images'] as List)
    );
  }

  static List<Posting> getListFromJson(dynamic postingsJson) {
    List<Posting> postings =
        postingsJson.map<Posting>((posting) => Posting.fromJson(posting)).toList();

    return postings;  
  }
}
