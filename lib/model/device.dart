import 'package:latlng/latlng.dart';

class DeviceModel {
  final String deviceId;
  final String deviceName;
  final LatLng location;

  DeviceModel({
    required this.deviceId,
    required this.deviceName,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'device_id': deviceId,
      'device_name': deviceName,
      'lat': location.latitude,
      'lng': location.longitude,
    };
  }

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceId: json['device_id'],
      deviceName: json['device_name'],
      location: LatLng(json['lat'], json['lng']),
    );
  }
}
