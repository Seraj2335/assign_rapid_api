class ApiEndPoint {
  int? value;

  ApiEndPoint({this.value});

  String newsList() => '/news/v1/index';

  String matchesList() => '/matches/v1/recent';

  String newsDetails() => "/news/v1/detail/$value";

  String imageUrl() => '/img/v1/i1/c$value/i.jpg';
}
