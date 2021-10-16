import 'package:anert/models/evform_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:anert/models/firstform_modl.dart';
import 'package:anert/models/site_model.dart';

class FormProvider with ChangeNotifier {
  var baseForm = BaseFormData();
  var siteInspection = SiteInspectionForm();
  var evInspection = EvFrom();
  String? wantSolarPanel;

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
    evInspection.address = address;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
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
    evInspection.address = address;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
  }
}
