import 'package:anert/models/evform_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:anert/models/site_model.dart';

class FormProvider with ChangeNotifier {
  //database variables

  var siteInspection = SiteInspectionForm();
  var evInspection = EvFrom();
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
      String wardNum,
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
      String propCap,
      String roofShape,
      String roofCover,
      String roofAccess,
      String subsidy,
      String disintrest,
      String remark) {
    siteInspection.category = category;
    siteInspection.contactPerson = contactPerson;
    siteInspection.designatoin = designatoin;
    siteInspection.phoneNum = phoneNum;
    siteInspection.email = email;
    siteInspection.rented = rented;
    siteInspection.mounting = mounting;
    siteInspection.assemblyConst = assemblyConst;
    siteInspection.parlimentConst = parlimentConst;
    siteInspection.district = district;
    siteInspection.localBody = localBody;
    siteInspection.wardNo = wardNum;
    siteInspection.wardName = wardName;
    siteInspection.load = load;
    siteInspection.avgConsumption = avgConsumption;
    siteInspection.eConnectionName = eConnectionName;
    siteInspection.billingPeriod = billingPeriod;
    siteInspection.customerType = customerType;
    siteInspection.connectionType = connectionType;
    siteInspection.length = length;
    siteInspection.breadth = breadth;
    siteInspection.area = area;
    siteInspection.propCap = propCap;
    siteInspection.roofShape = roofShape;
    siteInspection.roofCover = roofCover;
    siteInspection.roofAccess = roofAccess;
    siteInspection.subsidy = subsidy;
    siteInspection.disintrest = disintrest;
    siteInspection.remark = remark;
  }

  void setInspectionRented(
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
      String assemblyConst,
      String parlimentConst,
      String district,
      String localBody,
      String wardNum,
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
      String propCap,
      String roofShape,
      String roofCover,
      String roofAccess,
      String subsidy,
      String disintrest,
      String remark) {
    siteInspection.category = category;
    siteInspection.contactPerson = contactPerson;
    siteInspection.designatoin = designatoin;
    siteInspection.phoneNum = phoneNum;
    siteInspection.email = email;
    siteInspection.rented = rented;
    siteInspection.ownerName = ownerName;
    siteInspection.ownerphn = ownerphn;
    siteInspection.ownerEmail = ownerEmail;
    siteInspection.mounting = mounting;
    siteInspection.assemblyConst = assemblyConst;
    siteInspection.parlimentConst = parlimentConst;
    siteInspection.district = district;
    siteInspection.localBody = localBody;
    siteInspection.wardNo = wardNum;
    siteInspection.wardName = wardName;
    siteInspection.load = load;
    siteInspection.avgConsumption = avgConsumption;
    siteInspection.eConnectionName = eConnectionName;
    siteInspection.billingPeriod = billingPeriod;
    siteInspection.customerType = customerType;
    siteInspection.connectionType = connectionType;
    siteInspection.length = length;
    siteInspection.breadth = breadth;
    siteInspection.area = area;
    siteInspection.propCap = propCap;
    siteInspection.roofShape = roofShape;
    siteInspection.roofCover = roofCover;
    siteInspection.roofAccess = roofAccess;
    siteInspection.subsidy = subsidy;
    siteInspection.disintrest = disintrest;
    siteInspection.remark = remark;
  }

  void setEv(
    String category,
    String assemblyConst,
    String parlimentConst,
    String district,
    String localBody,
    String wardNo,
    String wardName,
    String contactPerson,
    String designatoin,
    String phoneNum,
    String email,
    String rented,
    String twoCharging,
    String remakrs,
  ) {
    evInspection.category = category;
    siteInspection.assemblyConst = assemblyConst;
    siteInspection.parlimentConst = parlimentConst;
    siteInspection.district = district;
    siteInspection.localBody = localBody;
    evInspection.wardName = wardName;
    evInspection.wardNo = wardNo;
    evInspection.contactPerson = contactPerson;
    evInspection.designatoin = designatoin;
    evInspection.phoneNum = phoneNum;
    evInspection.email = email;
    evInspection.rented = rented;
    evInspection.twoCharging = twoCharging;
    evInspection.remakrs = remakrs;
  }

  void setEvRented(
    String category,
    String assemblyConst,
    String parlimentConst,
    String district,
    String localBody,
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
    String twoCharging,
    String remakrs,
  ) {
    evInspection.category = category;
    siteInspection.assemblyConst = assemblyConst;
    siteInspection.parlimentConst = parlimentConst;
    siteInspection.district = district;
    siteInspection.localBody = localBody;
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

  void setIntrest(
    String intrest,
    String gps,
    String img1,
    String img2,
    String img3,
  ) {
    if (formType == 0) {
      siteInspection.solarPV = intrest;
      siteInspection.gps = gps;
      siteInspection.img1 = img1;
      siteInspection.img2 = img2;
      siteInspection.img3 = img3;
    } else {
      evInspection.solarPV = intrest;
      evInspection.gps = gps;
      evInspection.img1 = img1;
      evInspection.img2 = img2;
      evInspection.img3 = img3;
    }
  }
}
