import 'package:joelslist/locator.dart';
import 'package:joelslist/postings/domain/posting_repository.dart';

void postingsLocatorInstances() {
  locator.registerSingleton(PostingsRepository());
}
