// To parse this JSON data, do
//
//     final newsDetailsModel = newsDetailsModelFromJson(jsonString);

import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) => NewsDetailsModel.fromJson(json.decode(str));

String newsDetailsModelToJson(NewsDetailsModel data) => json.encode(data.toJson());

class NewsDetailsModel {
  int id;
  String context;
  String headline;
  String publishTime;
  CoverImage coverImage;
  List<ContentElement> content;
  List<Format> format;
  List<Author> authors;
  List<Tag> tags;
  AppIndex appIndex;
  String storyType;
  String lastUpdatedTime;
  String intro;
  String source;
  Entitlements entitlements;

  NewsDetailsModel({
    required this.id,
    required this.context,
    required this.headline,
    required this.publishTime,
    required this.coverImage,
    required this.content,
    required this.format,
    required this.authors,
    required this.tags,
    required this.appIndex,
    required this.storyType,
    required this.lastUpdatedTime,
    required this.intro,
    required this.source,
    required this.entitlements,
  });

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) => NewsDetailsModel(
    id: json["id"],
    context: json["context"],
    headline: json["headline"],
    publishTime: json["publishTime"],
    coverImage: CoverImage.fromJson(json["coverImage"]),
    content: List<ContentElement>.from(json["content"].map((x) => ContentElement.fromJson(x))),
    format: List<Format>.from(json["format"].map((x) => Format.fromJson(x))),
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    appIndex: AppIndex.fromJson(json["appIndex"]),
    storyType: json["storyType"],
    lastUpdatedTime: json["lastUpdatedTime"],
    intro: json["intro"],
    source: json["source"],
    entitlements: Entitlements.fromJson(json["entitlements"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "context": context,
    "headline": headline,
    "publishTime": publishTime,
    "coverImage": coverImage.toJson(),
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "format": List<dynamic>.from(format.map((x) => x.toJson())),
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "appIndex": appIndex.toJson(),
    "storyType": storyType,
    "lastUpdatedTime": lastUpdatedTime,
    "intro": intro,
    "source": source,
    "entitlements": entitlements.toJson(),
  };
}

class AppIndex {
  String seoTitle;
  String webUrl;

  AppIndex({
    required this.seoTitle,
    required this.webUrl,
  });

  factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
    seoTitle: json["seoTitle"],
    webUrl: json["webURL"],
  );

  Map<String, dynamic> toJson() => {
    "seoTitle": seoTitle,
    "webURL": webUrl,
  };
}

class Author {
  int id;
  String name;
  int imageId;
  String twitterHandle;

  Author({
    required this.id,
    required this.name,
    required this.imageId,
    required this.twitterHandle,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    name: json["name"],
    imageId: json["imageId"],
    twitterHandle: json["twitterHandle"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageId": imageId,
    "twitterHandle": twitterHandle,
  };
}

class ContentElement {
  ContentContent? content;
  Ad? ad;

  ContentElement({
    this.content,
    this.ad,
  });

  factory ContentElement.fromJson(Map<String, dynamic> json) => ContentElement(
    content: json["content"] == null ? null : ContentContent.fromJson(json["content"]),
    ad: json["ad"] == null ? null : Ad.fromJson(json["ad"]),
  );

  Map<String, dynamic> toJson() => {
    "content": content?.toJson(),
    "ad": ad?.toJson(),
  };
}

class Ad {
  String name;
  String layout;
  int position;

  Ad({
    required this.name,
    required this.layout,
    required this.position,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    name: json["name"],
    layout: json["layout"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "layout": layout,
    "position": position,
  };
}

class ContentContent {
  String contentType;
  String contentValue;
  bool? hasFormat;

  ContentContent({
    required this.contentType,
    required this.contentValue,
    this.hasFormat,
  });

  factory ContentContent.fromJson(Map<String, dynamic> json) => ContentContent(
    contentType: json["contentType"],
    contentValue: json["contentValue"],
    hasFormat: json["hasFormat"],
  );

  Map<String, dynamic> toJson() => {
    "contentType": contentType,
    "contentValue": contentValue,
    "hasFormat": hasFormat,
  };
}

class CoverImage {
  String id;
  String caption;
  String source;

  CoverImage({
    required this.id,
    required this.caption,
    required this.source,
  });

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
    id: json["id"],
    caption: json["caption"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption,
    "source": source,
  };
}

class Entitlements {
  Entitlements();

  factory Entitlements.fromJson(Map<String, dynamic> json) => Entitlements(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Format {
  String type;
  List<Value> value;

  Format({
    required this.type,
    required this.value,
  });

  factory Format.fromJson(Map<String, dynamic> json) => Format(
    type: json["type"],
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
  };
}

class Value {
  String id;
  String value;

  Value({
    required this.id,
    required this.value,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}

class Tag {
  String itemName;
  String itemType;
  String itemId;

  Tag({
    required this.itemName,
    required this.itemType,
    required this.itemId,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    itemName: json["itemName"],
    itemType: json["itemType"],
    itemId: json["itemId"],
  );

  Map<String, dynamic> toJson() => {
    "itemName": itemName,
    "itemType": itemType,
    "itemId": itemId,
  };
}
