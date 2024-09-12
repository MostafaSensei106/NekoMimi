import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekomimi/featureas/home/domin/usecases/get_network_details.dart';
import 'package:nekomimi/featureas/home/modules/message.dart';
import 'love_me_event.dart';
import 'love_me_state.dart';

class LoveMeBloc extends Bloc<LoveMeEvent, LoveMeState> {
  final GetNetworkDetails _getNetworkDetails;

  LoveMeBloc(this._getNetworkDetails) : super(InitialState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  Future<void> _onSendMessageEvent(SendMessageEvent event, Emitter<LoveMeState> emit) async {
    final currentState = state as LoveMeState;
    final newMessage = Message(content: event.message, isUser: true);

    if (event.message.toLowerCase() == 'نعم') {
      emit(YesState());
    } else if (event.message.toLowerCase() == 'لا') {
      emit(LoadingState());
      try {
        final networkDetails = await _getNetworkDetails();
        emit(NoState(networkDetails: networkDetails));
      } catch (_) {
        emit(ErrorState());
      }
    } else {
      emit(ErrorState());
    }
  }
}
