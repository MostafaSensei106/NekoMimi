// تعريف GetNetworkDetails
class GetNetworkDetails {
  final NetworkService _networkService;

  // المنشئ يتطلب وسيطاً
  GetNetworkDetails(this._networkService);

  Future<List<NetworkDetail>> call() async {
    // استخدم NetworkService للحصول على تفاصيل الشبكة
    return await _networkService.getNetworkDetails();
  }
}

// تعريف NetworkService كمثال
class NetworkService {
  Future<List<NetworkDetail>> getNetworkDetails() async {
    // تنفيذ لجلب تفاصيل الشبكة
    return [];
  }
}

// تعريف NetworkDetail كمثال
class NetworkDetail {
  final String detail;

  NetworkDetail(this.detail);
}
