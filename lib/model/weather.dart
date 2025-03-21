class WeatherModel {
  final String icon;
  final String image;
  final int time;
  final double temperature;
  final String description;
  final int humidity;
  final int moisture;
  final int light;

  WeatherModel({
    required this.icon,
    required this.image,
    required this.time,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.moisture,
    required this.light,
  });

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'image': image,
      'time': time,
      'temperature': temperature,
      'description': description,
      'humidity': humidity,
      'moisture': moisture,
      'light': light,
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      icon: json['icon'],
      image: json['image'],
      time: json['time'],
      temperature: json['temperature'],
      description: json['description'],
      humidity: json['humidity'],
      moisture: json['moisture'],
      light: json['light'],
    );
  }
}
