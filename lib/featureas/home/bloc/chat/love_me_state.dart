import 'package:equatable/equatable.dart';
import 'package:nekomimi/featureas/home/modules/message.dart';
import 'package:nekomimi/featureas/home/modules/network_detail.dart';

abstract class LoveMeState extends Equatable {
  final String answer;
  final bool isLoading;
  final List<NetworkDetail> networkDetails;
  final List<Message> messages;

  LoveMeState({
    this.answer = '',
    this.isLoading = false,
    this.networkDetails = const [],
    this.messages = const [],
  });

  @override
  List<Object> get props => [answer, isLoading, networkDetails, messages];
}

class InitialState extends LoveMeState {}

class YesState extends LoveMeState {
  YesState() : super(answer: 'أنا أيضًا أحبك');
}

class NoState extends LoveMeState {
  NoState({required super.networkDetails})
      : super(answer: 'لا، إليك معلومات الشبكة:');
}

class ErrorState extends LoveMeState {
  ErrorState() : super(answer: 'حدث خطأ');
}

class LoadingState extends LoveMeState {
  LoadingState() : super(isLoading: true);
}
