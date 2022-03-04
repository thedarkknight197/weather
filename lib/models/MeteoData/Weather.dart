class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  bool _isday(int hour, int sunset, int sunrise) {
    return hour >= sunrise && hour <= sunset;
  }

  String image(int hour, int sunset, int sunrise) {
    const base_asset = "assets/images/icons/";
    switch (id) {
      case 500:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "cloud/7.png" : "moon/1.png");
      case 600:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "cloud/23.png" : "moon/19.png");
      case 601:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "cloud/23.png" : "moon/19.png");
      case 800:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "sun/26.png" : "moon/10.png");
      case 801:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "sun/27.png" : "moon/15.png");
      case 802:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "sun/27.png" : "moon/15.png");
      case 803:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "cloud/35.png" : "moon/15.png");
      case 804:
        return base_asset +
            (_isday(hour, sunset, sunrise) ? "cloud/35.png" : "moon/15.png");
      default:
    }
    return "$main $id $description";
  }
}
