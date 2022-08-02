
class Posting {
  String title;
  String? price;
  String? location;
  List<String> images;
  String? dataPid;

  Posting({
    this.title = '',
    this.price,
    this.location,
    this.dataPid,
    this.images = const []
  });

  factory Posting.fromJson(dynamic postingJson) {
    return Posting(
      title: postingJson['title'] ?? '',
      price: postingJson['price'],
      location: postingJson['location'],
      images:List<String>.from(postingJson['images'] as List),
      dataPid: postingJson['data_pid']
    );
  }

  static List<Posting> getListFromJson(dynamic postingsJson) {
    List<Posting> postings =
        postingsJson.map<Posting>((posting) => Posting.fromJson(posting)).toList();

    return postings;  
  }
}
