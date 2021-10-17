import 'package:anert/models/evform_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:anert/models/firstform_modl.dart';
import 'package:anert/models/site_model.dart';

class FormProvider with ChangeNotifier {
  var baseForm = BaseFormData();
  var siteInspection = SiteInspectionForm();
  var evInspection = EvFrom();
  String? wantSolarPanel;
  int formType = 0; // 0 : site inspection , 1 : EV site

  void setOne(String userID, String housename, String deployment) {
    baseForm.userID = userID;
    baseForm.houseName = housename;
    baseForm.deployment = deployment;
  }

  void setTwo(
      String userID,
      String buildingName,
      String category,
      String contactPerson,
      String designatoin,
      String phoneNum,
      String email,
      String rented,
      String mounting,
      String height,
      String load,
      String avgConsumption,
      String eConnectionName,
      String billingPeriod,
      String customerType,
      String connectionType,
      String sfreeArea,
      String roofShape,
      String roofCover,
      String roofAccess,
      String remark) {
    siteInspection.userID = userID;
    siteInspection.avgConsumption = avgConsumption;
    siteInspection.billingPeriod = billingPeriod;
    siteInspection.buildingName = buildingName;
    siteInspection.category = category;
    siteInspection.connectionType = connectionType;
    siteInspection.contactPerson = contactPerson;
    siteInspection.customerType = customerType;
    siteInspection.designatoin = designatoin;
    siteInspection.eConnectionName = eConnectionName;
    siteInspection.email = email;
    siteInspection.load = load;
    siteInspection.mounting = mounting;
    siteInspection.phoneNum = phoneNum;
    siteInspection.remark = remark;
    siteInspection.roofAccess = roofAccess;
    siteInspection.roofCover = roofCover;
    siteInspection.roofShape = roofShape;
    siteInspection.sfreeArea = sfreeArea;
    siteInspection.height = height;
    siteInspection.rented = rented;
  }

  void setTwoRented(
      String userID,
      String buildingName,
      String category,
      String contactPerson,
      String designatoin,
      String phoneNum,
      String email,
      String rented,
      String ownerName,
      String ownerphn,
      String ownerEmail,
      String mounting,
      String height,
      String load,
      String avgConsumption,
      String eConnectionName,
      String billingPeriod,
      String customerType,
      String connectionType,
      String sfreeArea,
      String roofShape,
      String roofCover,
      String roofAccess,
      String remark) {
    siteInspection.userID = userID;
    siteInspection.avgConsumption = avgConsumption;
    siteInspection.billingPeriod = billingPeriod;
    siteInspection.buildingName = buildingName;
    siteInspection.category = category;
    siteInspection.connectionType = connectionType;
    siteInspection.contactPerson = contactPerson;
    siteInspection.customerType = customerType;
    siteInspection.designatoin = designatoin;
    siteInspection.eConnectionName = eConnectionName;
    siteInspection.email = email;
    siteInspection.load = load;
    siteInspection.mounting = mounting;
    siteInspection.phoneNum = phoneNum;
    siteInspection.remark = remark;
    siteInspection.roofAccess = roofAccess;
    siteInspection.roofCover = roofCover;
    siteInspection.roofShape = roofShape;
    siteInspection.sfreeArea = sfreeArea;
    siteInspection.height = height;
    siteInspection.rented = rented;
    siteInspection.ownerName = ownerName;
    siteInspection.ownerphn = ownerphn;
    siteInspection.ownerEmail = ownerEmail;
  }

  void setThree(
    String userID,
    String buildingName,
    String category,
    String contactPerson,
    String designatoin,
    String phoneNum,
    String email,
    String rented,
    String contactPerson2,
    String phoneNum2,
    String email2,
    String address,
    String twoCharging,
    String remakrs,
  ) {
    evInspection.userID = userID;
    evInspection.buildingName = buildingName;
    evInspection.category = category;
    evInspection.contactPerson = contactPerson;
    evInspection.designatoin = designatoin;
    evInspection.phoneNum = phoneNum;
    evInspection.email = email;
    evInspection.rented = rented;
    evInspection.contactPerson2 = contactPerson2;
    evInspection.phoneNum2 = phoneNum2;
    evInspection.email2 = email2;
    evInspection.address = address;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
    formType = 1;
  }

  void setThreeRented(
    String userID,
    String buildingName,
    String category,
    String contactPerson,
    String designatoin,
    String phoneNum,
    String email,
    String rented,
    String ownerName,
    String ownerPhn,
    String ownerEmail,
    String contactPerson2,
    String phoneNum2,
    String email2,
    String address,
    String twoCharging,
    String remakrs,
  ) {
    evInspection.userID = userID;
    evInspection.buildingName = buildingName;
    evInspection.category = category;
    evInspection.contactPerson = contactPerson;
    evInspection.designatoin = designatoin;
    evInspection.phoneNum = phoneNum;
    evInspection.email = email;
    evInspection.rented = rented;
    evInspection.ownerName = ownerName;
    evInspection.ownerPhn = ownerPhn;
    evInspection.ownerEmail = ownerEmail;
    evInspection.contactPerson2 = contactPerson2;
    evInspection.phoneNum2 = phoneNum2;
    evInspection.email2 = email2;
    evInspection.address = address;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
    formType = 1;
  }

  void setSolarPV(String solarPV) {
    if (formType == 0) {
      siteInspection.solarPV = solarPV;
    } else {
      evInspection.solarPV = solarPV;
    }
  }
}
