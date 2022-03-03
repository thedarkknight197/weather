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

  String image(int hour) {
    const base_asset = "assets/images/icons/";
    switch (id) {
      case 500:
        return base_asset + "cloud/7.png";
        break;
      case 800:
        return base_asset + "sun/26.png";
        break;
      case 801:
        return base_asset + "sun/27.png";
        break;
      case 802:
        return base_asset + "sun/27.png";
        break;
      case 803:
        return base_asset + "cloud/35.png";
      case 804:
        return base_asset + "cloud/35.png";
        break;
      default:
    }
    return "$main $id $description";
  }
}
