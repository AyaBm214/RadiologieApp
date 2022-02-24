
import 'package:radiologiev2/models/CenterModel.dart';
import 'package:radiologiev2/models/Services/ServiceCenter.dart';

class CenterProvider {
  void getCentersList({
    required Function() beforeSend,
    required Function(List<Centerv> Centers) onSuccess,
    required Function(dynamic error) onError,
  }) {
    ApiRequest(url: 'http://192.168.1.242:9015/radiologie/api/centres', data: {},).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess((data as List).map((CentervJson) => Centerv.fromJson(CentervJson)).toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}