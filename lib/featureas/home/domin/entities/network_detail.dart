// Correct import statement for NetworkDetail
import 'package:nekomimi/featureas/home/bloc/chat/love_me_state.dart';
import 'package:nekomimi/featureas/home/modules/network_detail.dart'; // Ensure this path is correct

// Ensure that all uses of NetworkDetail are consistent
class NoState extends LoveMeState {
  final List<NetworkDetail> networkDetails;

  NoState({required this.networkDetails});
}
