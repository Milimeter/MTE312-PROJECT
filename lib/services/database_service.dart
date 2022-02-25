import 'dart:developer';

import 'package:mteiot/const/firebase.dart';
import 'package:mteiot/shared/custom_toast.dart';

class DatabaseService {
  Future<bool> writeData({required int state}) async {
    try {
      await firebaseDatabase.ref().child("data").set(state);
      return true;
    } catch (e) {
      log(e.toString());
      var error = e.toString().split("]");
      var displayError = error[1];
      cToast(title: "Notice", message: displayError);
      return false;
    }
  }
}
