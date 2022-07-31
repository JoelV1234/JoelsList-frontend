import 'package:get_it/get_it.dart';
import 'package:joelslist/postings/domain/locator_register.dart';
import 'package:joelslist/services/http_service/http_client.dart';

final locator = GetIt.instance; // GetIt.I is also valid

void setUpLocator() {
  locator.registerSingleton(HttpClient());
  //Module(feature) specific service
  postingsLocatorInstances();
}
