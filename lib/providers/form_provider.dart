import 'package:anert/models/evform_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:anert/models/site_model.dart';

class FormProvider with ChangeNotifier {
  //database variables

  var siteInspection = SiteInspectionForm();
  var evInspection = EvFrom();
  String? wantSolarPanel;
  int formType = 0; // 0 : site inspection , 1 : EV site

  void setInspection(
      String category,
      String contactPerson,
      String designatoin,
      String phoneNum,
      String email,
      String rented,
      String mounting,
      String assemblyConst,
      String parlimentConst,
      String district,
      String localBody,
      String wardName,
      String load,
      String avgConsumption,
      String eConnectionName,
      String billingPeriod,
      String customerType,
      String connectionType,
      String length,
      String breadth,
      String area,
      String roofShape,
      String roofCover,
      String roofAccess,
      String subsidy,
      String disintrest,
      String remark) {
    siteInspection.avgConsumption = avgConsumption;
    siteInspection.billingPeriod = billingPeriod;

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

    siteInspection.rented = rented;
  }

  void setInspectionRented(
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

    siteInspection.rented = rented;
    siteInspection.ownerName = ownerName;
    siteInspection.ownerphn = ownerphn;
    siteInspection.ownerEmail = ownerEmail;
  }

  void setEv(
    String category,
    String wardNo,
    String wardName,
    String contactPerson,
    String designatoin,
    String phoneNum,
    String email,
    String rented,
    String address,
    String twoCharging,
    String remakrs,
  ) {
    evInspection.category = category;
    evInspection.wardName = wardName;
    evInspection.wardNo = wardNo;
    evInspection.contactPerson = contactPerson;
    evInspection.designatoin = designatoin;
    evInspection.phoneNum = phoneNum;
    evInspection.email = email;
    evInspection.rented = rented;
    evInspection.address = address;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
  }

  void setEvRented(
    String category,
    String wardNo,
    String wardName,
    String contactPerson,
    String designatoin,
    String phoneNum,
    String email,
    String rented,
    String ownerName,
    String ownerPhn,
    String ownerEmail,
    String ownerAddress,
    String address,
    String twoCharging,
    String remakrs,
  ) {
    evInspection.category = category;
    evInspection.wardName = wardName;
    evInspection.wardNo = wardNo;
    evInspection.contactPerson = contactPerson;
    evInspection.designatoin = designatoin;
    evInspection.phoneNum = phoneNum;
    evInspection.email = email;
    evInspection.rented = rented;
    evInspection.ownerName = ownerName;
    evInspection.ownerPhn = ownerPhn;
    evInspection.ownerEmail = ownerEmail;
    evInspection.ownerAddress = ownerAddress;
    evInspection.address = address;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
  }

  void setName(String user, String name, String deployment) {
    if (formType == 0) {
      siteInspection.userID = user;
      siteInspection.buildingName = name;
      siteInspection.deployment = deployment;
    } else {
      evInspection.userID = user;
      evInspection.buildingName = name;
      evInspection.deployment = deployment;
    }
  }
}
