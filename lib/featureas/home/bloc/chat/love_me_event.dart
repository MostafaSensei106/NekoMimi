abstract class LoveMeEvent {}

class SendMessageEvent extends LoveMeEvent {
  final String message;

  SendMessageEvent({required this.message});
}
