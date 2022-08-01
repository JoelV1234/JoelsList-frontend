import 'dart:convert';
import 'package:joelslist/locator.dart';
import 'package:joelslist/postings/domain/models/posting_model.dart';
import 'package:joelslist/services/http_service/http_client.dart';


class PostingsRepository {

  HttpClient httpService = locator<HttpClient>();

  Future<List<Posting>> getPostings(String? searchQuery) async {

    var response = await httpService.get(
      path : '/get_posting',

      //TODO : make this query parmas code cleaner
      queryParams: searchQuery != null ? {
        'query' : searchQuery
      } : null
      
    );

    List<dynamic> decodedResponse = jsonDecode(response.data);
    List<Posting> postings = Posting.getListFromJson(decodedResponse);
    return postings;
  }

  Future<List<String>> searchSuggestions(String searchTerm) async {
    var response = await httpService.get(
      path : '/suggestions',
      queryParams:  {
        'search_term' : searchTerm
      }
    );
    List<String> searchResults = List<String>.from(jsonDecode(response.data));
    return searchResults;
  }
  
}
