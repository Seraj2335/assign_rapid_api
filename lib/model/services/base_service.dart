abstract class BaseService {
  final String cricketBaseUrl = "https://cricbuzz-cricket.p.rapidapi.com";

  Future<dynamic> getResponse(String url);
}
