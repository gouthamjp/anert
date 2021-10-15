import 'package:flutter/cupertino.dart';

class FormData {
  String? houseName;
  String? deployment;

  FormData({
    this.houseName,
    this.deployment,
  });
}

class FormProvider with ChangeNotifier {
  var push = FormData(deployment: null, houseName: null);

  void setOne(String housename, String deployment) {
    push.houseName = housename;
    push.deployment = deployment;
  }

  void check() {
    print(push.houseName);
  }
}
