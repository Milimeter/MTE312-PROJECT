import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:get/get.dart';
import 'package:mteiot/services/database_service.dart';
import 'package:mteiot/shared/custom_toast.dart';

class AppController extends GetxController {
  RxBool isLockedState = false.obs;
  DatabaseService databaseService = DatabaseService();
  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    // optional, false if you cont want continous lookup
    lookUpDuration: const Duration(seconds: 5),
    // optional, to override default lookup duration
    lookUpUrl: 'example.com', // optional, to override default lookup url
  );

  RxBool isInternetAvailableOnCall = false.obs;

  RxBool isInternetAvailableStreamStatus = false.obs;

  StreamSubscription<bool>? _networkConnectionStream;

  lockDoor() async {
    await _checkInternetAvailability();
    if (isInternetAvailableOnCall.value == true) {
      await databaseService.writeData(state: 1);
      isLockedState(true);
      cToast(title: "Success", message: "Door locked successfully.");
    } else {
      cToast(title: "Notice", message: "No stable internet connection");
    }
  }

  unLockDoor() async {
    await _checkInternetAvailability();
    if (isInternetAvailableOnCall.value == true) {
      await databaseService.writeData(state: 0);
      isLockedState(false);
      cToast(title: "Success", message: "Door unlocked successfully.");
    } else {
      cToast(title: "Notice", message: "No stable internet connection");
    }
  }

  checkDoorInitState() async {
    await _checkInternetAvailability();
    if (isInternetAvailableOnCall.value == true) {
      bool state = await databaseService.readData();
      isLockedState(state);
    } else {
      cToast(title: "Notice", message: "No stable internet connection");
    }

  }

  void init() async {
    await _flutterNetworkConnectivity.registerAvailabilityListener();
    _checkInternetAvailability();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _checkInternetAvailability() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      isInternetAvailableOnCall.value =
          await _flutterNetworkConnectivity.isInternetConnectionAvailable();
    } on PlatformException {
      isInternetAvailableOnCall(false);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    // setState(() {});
  }

  @override
  void onReady() {
    super.onReady();
    _flutterNetworkConnectivity.getInternetAvailabilityStream().listen((event) {
      isInternetAvailableStreamStatus.value = event;
    });

    init();
    checkDoorInitState();
  }

  @override
  void onClose() {
    _networkConnectionStream?.cancel();
    _flutterNetworkConnectivity.unregisterAvailabilityListener();
    super.onClose();
  }
}
