// To parse this JSON data, do
//
//     final reelModel = reelModelFromJson(jsonString);

import 'dart:convert';

ReelModel reelModelFromJson(String str) => ReelModel.fromJson(json.decode(str));

String reelModelToJson(ReelModel data) => json.encode(data.toJson());

class ReelModel {
  int? statusCode;
  String? message;
  Data? data;

  ReelModel({this.statusCode, this.message, this.data});

  factory ReelModel.fromJson(Map<String, dynamic> json) => ReelModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Datum>? data;
  MetaData? metaData;

  Data({this.data, this.metaData});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    metaData: json["meta_data"] == null
        ? null
        : MetaData.fromJson(json["meta_data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta_data": metaData?.toJson(),
  };
}

class Datum {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  DateTime? byteAddedOn;
  DateTime? byteUpdatedOn;
  String? bunnyStreamVideoId;
  dynamic bytePlusVideoId;
  String? language;
  String? orientation;
  int? bunnyEncodingStatus;
  dynamic deletedAt;
  int? videoHeight;
  int? videoWidth;
  dynamic location;
  int? isPrivate;
  int? isHideComment;
  dynamic description;
  dynamic archivedAt;
  dynamic latitude;
  dynamic longitude;
  User? user;
  Category? category;
  List<dynamic>? resolutions;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;
  String? metaDescription;
  String? metaKeywords;
  String? videoAspectRatio;

  Datum({
    this.id,
    this.title,
    this.url,
    this.cdnUrl,
    this.thumbCdnUrl,
    this.userId,
    this.status,
    this.slug,
    this.encodeStatus,
    this.priority,
    this.categoryId,
    this.totalViews,
    this.totalLikes,
    this.totalComments,
    this.totalShare,
    this.totalWishlist,
    this.duration,
    this.byteAddedOn,
    this.byteUpdatedOn,
    this.bunnyStreamVideoId,
    this.bytePlusVideoId,
    this.language,
    this.orientation,
    this.bunnyEncodingStatus,
    this.deletedAt,
    this.videoHeight,
    this.videoWidth,
    this.location,
    this.isPrivate,
    this.isHideComment,
    this.description,
    this.archivedAt,
    this.latitude,
    this.longitude,
    this.user,
    this.category,
    this.resolutions,
    this.isLiked,
    this.isWished,
    this.isFollow,
    this.metaDescription,
    this.metaKeywords,
    this.videoAspectRatio,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    cdnUrl: json["cdn_url"],
    thumbCdnUrl: json["thumb_cdn_url"],
    userId: json["user_id"],
    status: json["status"],
    slug: json["slug"],
    encodeStatus: json["encode_status"],
    priority: json["priority"],
    categoryId: json["category_id"],
    totalViews: json["total_views"],
    totalLikes: json["total_likes"],
    totalComments: json["total_comments"],
    totalShare: json["total_share"],
    totalWishlist: json["total_wishlist"],
    duration: json["duration"],
    byteAddedOn: json["byte_added_on"] == null
        ? null
        : DateTime.parse(json["byte_added_on"]),
    byteUpdatedOn: json["byte_updated_on"] == null
        ? null
        : DateTime.parse(json["byte_updated_on"]),
    bunnyStreamVideoId: json["bunny_stream_video_id"],
    bytePlusVideoId: json["byte_plus_video_id"],
    language: json["language"],
    orientation: json["orientation"],
    bunnyEncodingStatus: json["bunny_encoding_status"],
    deletedAt: json["deleted_at"],
    videoHeight: json["video_height"],
    videoWidth: json["video_width"],
    location: json["location"],
    isPrivate: json["is_private"],
    isHideComment: json["is_hide_comment"],
    description: json["description"],
    archivedAt: json["archived_at"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    category: json["category"] == null
        ? null
        : Category.fromJson(json["category"]),
    resolutions: json["resolutions"] == null
        ? []
        : List<dynamic>.from(json["resolutions"]!.map((x) => x)),
    isLiked: json["is_liked"],
    isWished: json["is_wished"],
    isFollow: json["is_follow"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    videoAspectRatio: json["video_aspect_ratio"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "cdn_url": cdnUrl,
    "thumb_cdn_url": thumbCdnUrl,
    "user_id": userId,
    "status": status,
    "slug": slug,
    "encode_status": encodeStatus,
    "priority": priority,
    "category_id": categoryId,
    "total_views": totalViews,
    "total_likes": totalLikes,
    "total_comments": totalComments,
    "total_share": totalShare,
    "total_wishlist": totalWishlist,
    "duration": duration,
    "byte_added_on": byteAddedOn?.toIso8601String(),
    "byte_updated_on": byteUpdatedOn?.toIso8601String(),
    "bunny_stream_video_id": bunnyStreamVideoId,
    "byte_plus_video_id": bytePlusVideoId,
    "language": language,
    "orientation": orientation,
    "bunny_encoding_status": bunnyEncodingStatus,
    "deleted_at": deletedAt,
    "video_height": videoHeight,
    "video_width": videoWidth,
    "location": location,
    "is_private": isPrivate,
    "is_hide_comment": isHideComment,
    "description": description,
    "archived_at": archivedAt,
    "latitude": latitude,
    "longitude": longitude,
    "user": user?.toJson(),
    "category": category?.toJson(),
    "resolutions": resolutions == null
        ? []
        : List<dynamic>.from(resolutions!.map((x) => x)),
    "is_liked": isLiked,
    "is_wished": isWished,
    "is_follow": isFollow,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "video_aspect_ratio": videoAspectRatio,
  };
}

class Category {
  String? title;

  Category({this.title});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(title: json["title"]);

  Map<String, dynamic> toJson() => {"title": title};
}

class User {
  int? userId;
  String? fullname;
  String? username;
  dynamic profilePicture;
  dynamic profilePictureCdn;
  dynamic designation;
  bool? isSubscriptionActive;
  bool? isFollow;

  User({
    this.userId,
    this.fullname,
    this.username,
    this.profilePicture,
    this.profilePictureCdn,
    this.designation,
    this.isSubscriptionActive,
    this.isFollow,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    fullname: json["fullname"],
    username: json["username"],
    profilePicture: json["profile_picture"],
    profilePictureCdn: json["profile_picture_cdn"],
    designation: json["designation"],
    isSubscriptionActive: json["is_subscription_active"],
    isFollow: json["is_follow"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fullname": fullname,
    "username": username,
    "profile_picture": profilePicture,
    "profile_picture_cdn": profilePictureCdn,
    "designation": designation,
    "is_subscription_active": isSubscriptionActive,
    "is_follow": isFollow,
  };
}

class MetaData {
  int? total;
  int? page;
  int? limit;

  MetaData({this.total, this.page, this.limit});

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      MetaData(total: json["total"], page: json["page"], limit: json["limit"]);

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "limit": limit,
  };
}
