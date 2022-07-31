import 'dart:convert';
import 'package:joelslist/locator.dart';
import 'package:joelslist/postings/domain/posting_model.dart';
import 'package:joelslist/services/http_service/http_client.dart';


class PostingsRepository {

  HttpClient httpService = locator<HttpClient>();

  Future<List<Posting>> getPostings(String? searchQuery) async {

    var response = await httpService.get(
      path : 'http://127.0.0.1:8000/cl/get_posting',

      //TODO : make this query parmas code cleaner
      queryParams: searchQuery != null ? {
        'query' : searchQuery
      } : null
      
    );

    List<dynamic> decodedResponse = jsonDecode(response.data);
    List<Posting> postings = Posting.getListFromJson(decodedResponse);
    return postings;
  }
}
