import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Events
sealed class LoveMeEvent {}

final class YesEvent extends LoveMeEvent {}

final class NoEvent extends LoveMeEvent {}

// States
sealed class LoveMeState {
  final String answer;
  final List<NetworkDetail> networkDetails;
  final bool isLoading;

  const LoveMeState({
    required this.answer,
    required this.networkDetails,
    this.isLoading = false,
  });
}

final class InitialState extends LoveMeState {
  InitialState() : super(answer: '', networkDetails: const [], isLoading: false);
}

final class YesState extends LoveMeState {
  YesState() : super(answer: 'نعم', networkDetails: const [], isLoading: false);
}

final class NoState extends LoveMeState {
  NoState({required List<NetworkDetail> networkDetails})
      : super(answer: 'لا', networkDetails: networkDetails, isLoading: false);
}

final class ErrorState extends LoveMeState {
  ErrorState() : super(answer: 'حدث خطأ', networkDetails: const [], isLoading: false);
}

final class LoadingState extends LoveMeState {
  LoadingState() : super(answer: '', networkDetails: const [], isLoading: true);
}

// Data class for network details
class NetworkDetail {
  final String type;
  final String value;

  const NetworkDetail({required this.type, required this.value});
}

// Repository for network operations
class NetworkRepository {
  final NetworkInfo _networkInfo;
  final http.Client _httpClient;

  NetworkRepository({NetworkInfo? networkInfo, http.Client? httpClient})
      : _networkInfo = networkInfo ?? NetworkInfo(),
        _httpClient = httpClient ?? http.Client();

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

// Bloc class
class LoveMeBloc extends Bloc<LoveMeEvent, LoveMeState> {
  final NetworkRepository _networkRepository;

  LoveMeBloc({NetworkRepository? networkRepository})
      : _networkRepository = networkRepository ?? NetworkRepository(),
        super(InitialState()) {
    on<YesEvent>(_onYesEvent);
    on<NoEvent>(_onNoEvent);
  }

  Future<void> _onYesEvent(YesEvent event, Emitter<LoveMeState> emit) async {
    emit(YesState());
  }

  Future<void> _onNoEvent(NoEvent event, Emitter<LoveMeState> emit) async {
    emit(LoadingState());
    try {
      final networkDetails = await _networkRepository.getNetworkDetails();
      emit(NoState(networkDetails: networkDetails));
    } catch (_) {
      emit(ErrorState());
    }
  }
}