import 'package:connectivity_plus/connectivity_plus.dart';

class WifiService {
  static Future<bool> checkWifiConnection() async {
    final Connectivity _connectivity = Connectivity();

    // Check current connectivity status, expecting a list
    var connectivityResults =
        await _connectivity.checkConnectivity() as List<ConnectivityResult>;

    // List of valid connection types
    List<ConnectivityResult> validConnections = [
      ConnectivityResult.wifi,
    ];

    // Check if any of the connectivity results are valid
    bool isConnected =
        connectivityResults.any((result) => validConnections.contains(result));

    if (isConnected) {
      print('Connectivity True Result: $connectivityResults');
      return true;
    } else {
      print('Connectivity False Result: $connectivityResults');
      return false;
    }
  }
}
