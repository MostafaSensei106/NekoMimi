// lib/domain/repositories/network_repository.dart
import 'package:nekomimi/featureas/home/modules/network_detail.dart';

import '../entities/network_detail.dart';

abstract class NetworkRepository {
  Future<List<NetworkDetail>> getNetworkDetails();
}
