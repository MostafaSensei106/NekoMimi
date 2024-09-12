
import 'package:nekomimi/featureas/home/domin/entities/network_detail.dart';

abstract class NetworkRepository {
  Future<List<NetworkDetail>> getNetworkDetails();
}
