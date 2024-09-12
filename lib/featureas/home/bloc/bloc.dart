import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define events
abstract class LoveMeEvent {}

class YesEvent extends LoveMeEvent {}

class NoEvent extends LoveMeEvent {}

// Define states
abstract class LoveMeState {
  final String answer;
  final List<Map<String, String>> networkDetails;
  final bool isLoading;

  LoveMeState(this.answer, this.networkDetails, {this.isLoading = false});
}

class InitialState extends LoveMeState {
  InitialState() : super('', [], isLoading: false);
}

class YesState extends LoveMeState {
  YesState() : super('نعم', [], isLoading: false);
}

class NoState extends LoveMeState {
  NoState(List<Map<String, String>> networkDetails) : super('لا', networkDetails, isLoading: false);
}

class ErrorState extends LoveMeState {
  ErrorState() : super('حدث خطأ', [], isLoading: false);
}

class LoadingState extends LoveMeState {
  LoadingState() : super('', [], isLoading: true);
}

// Bloc class
class LoveMeBloc extends Bloc<LoveMeEvent, LoveMeState> {
  LoveMeBloc() : super(InitialState()) {
    on<YesEvent>((event, emit) {
      emit(YesState());
    });

    on<NoEvent>((event, emit) async {
      emit(LoadingState()); // Show loading indicator while processing
      try {
        final networkDetails = await _getNetworkDetails();
        emit(NoState(networkDetails));
      } catch (_) {
        emit(ErrorState());
      }
    });
  }

  Future<List<Map<String, String>>> _getNetworkDetails() async {
    final List<Map<String, String>> details = [];
    try {
      final info = NetworkInfo();
      String? wifiName = await info.getWifiName();
      String? wifiIP = await info.getWifiIP();
      String? wifiGateway = await info.getWifiGatewayIP();
      String publicIP = await _getPublicIP();

      details.add({'نوع': 'اسم الشبكة', 'قيمة': wifiName ?? 'غير متوفر'});
      details.add({'نوع': 'IP المحلي', 'قيمة': wifiIP ?? 'غير متوفر'});
      details.add({'نوع': 'بوابة الاتصال', 'قيمة': wifiGateway ?? 'غير متوفر'});
      details.add({'نوع': 'IP العام', 'قيمة': publicIP});
    } catch (_) {
      details.add({'نوع': 'حالة الشبكة', 'قيمة': 'غير متصل'});
    }
    return details;
  }

  Future<String> _getPublicIP() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org?format=json')).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['ip.dart'];
      } else {
        return 'غير متصل';
      }
    } catch (_) {
      return 'غير متصل';
    }
  }
}
