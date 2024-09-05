import 'package:connectivity_plus/connectivity_plus.dart';

class WifiService {
  static Future<bool> checkWifiConnection() async {
    final Connectivity _connectivity = Connectivity();

    // Check current connectivity status
    var connectivityResult = await _connectivity.checkConnectivity();

    // List of valid connection types
    List<ConnectivityResult> validConnections = [
      ConnectivityResult.wifi,
      ConnectivityResult.mobile
    ];

    // Return true if connected to either WiFi or Mobile, else false
    if (connectivityResult ==
            [
              ConnectivityResult.wifi,
            ] ||
        connectivityResult == [ConnectivityResult.mobile]) {
      print('Connectivity Result ${connectivityResult}');
      return true;
    } else {
      print('Connectivity Result ${connectivityResult}');
      return false;
    }
  }
}
