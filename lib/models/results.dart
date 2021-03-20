import 'package:findertask/models/resultemodel.dart';
class Results {
  String sId;
  String categoryId;
  String typeId;
  String location;
  String premium;
  int statusId;
  String refCode;
  String mainPhoto;
  String category;
  String type;
  String typeColor;
  String publishDate;
  String rewardCurr;
  String distance;
  String title;
  String reward;

  Results({this.sId,
    this.categoryId,
    this.typeId,
    this.location,
    this.premium,
    this.statusId,
    this.refCode,
    this.mainPhoto,
    this.category,
    this.type,
    this.typeColor,
    this.publishDate,
    this.rewardCurr,
    this.distance,
    this.title,
    this.reward});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryId = json['category_id'];
    typeId = json['type_id'];
    location = json['location'];
    premium = json['premium'];
    statusId = json['status_id'];
    refCode = json['ref_code'];
    mainPhoto = json['main_photo'];
    category = json['category'];
    type = json['type'];
    typeColor = json['type_color'];
    publishDate = json['publish_date'];
    rewardCurr = json['reward_curr'];
    distance = json['distance'];
    title = json['title'];
    reward = json['reward'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_id'] = this.categoryId;
    data['type_id'] = this.typeId;
    data['location'] = this.location;
    data['premium'] = this.premium;
    data['status_id'] = this.statusId;
    data['ref_code'] = this.refCode;
    data['main_photo'] = this.mainPhoto;
    data['category'] = this.category;
    data['type'] = this.type;
    data['type_color'] = this.typeColor;
    data['publish_date'] = this.publishDate;
    data['reward_curr'] = this.rewardCurr;
    data['distance'] = this.distance;
    data['title'] = this.title;
    data['reward'] = this.reward;
    return data;
  }

}