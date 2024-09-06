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

    if (connectivityResult == [validConnections[0]] ||
        connectivityResult == [validConnections[1]]) {
      print('Connectivity True Result: $connectivityResult');

      return true;
    } else {
      print('Connectivity False Result: $connectivityResult');
      return false;
    }
  }
}
