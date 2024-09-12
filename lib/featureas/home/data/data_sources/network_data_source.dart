import 'package:nekomimi/featureas/home/domin/usecases/get_network_details.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkDataSource {
  final NetworkInfo _networkInfo;
  final http.Client _httpClient;

  NetworkDataSource(this._networkInfo, this._httpClient);

  Future<List<NetworkDetail>> getNetworkDetails() async {
    try {
      final wifiName = await _networkInfo.getWifiName();
      final wifiIP = await _networkInfo.getWifiIP();
      final wifiGateway = await _networkInfo.getWifiGatewayIP();
      final publicIP = await _getPublicIP();

      return [
        NetworkDetail(type: 'اسم الشبكة', value: wifiName ?? 'غير متوفر'),
        NetworkDetail(type: 'IP المحلي', value: wifiIP ?? 'غير متوفر'),
        NetworkDetail(type: 'بوابة الاتصال', value: wifiGateway ?? 'غير متوفر'),
        NetworkDetail(type: 'IP العام', value: publicIP),
      ];
    } catch (e) {
      return [NetworkDetail(type: 'حالة الشبكة', value: 'غير متصل')];
    }
  }

  Future<String> _getPublicIP() async {
    try {
      final response = await _httpClient
          .get(Uri.parse('https://api.ipify.org?format=json'))
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data['ip'] as String;
      }
    } catch (e) {
      // Log the error
    }
    return 'غير متوفر';
  }
}
