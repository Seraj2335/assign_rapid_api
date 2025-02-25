class News {
  List<StoryList>? storyList;
  String? lastUpdatedTime;
  AppIndex? appIndex;

  News({this.storyList, this.lastUpdatedTime, this.appIndex});

  News.fromJson(Map<String, dynamic> json) {
    if (json['storyList'] != null) {
      storyList = <StoryList>[];
      json['storyList'].forEach((v) {
        storyList!.add(new StoryList.fromJson(v));
      });
    }
    lastUpdatedTime = json['lastUpdatedTime'];
    appIndex = json['appIndex'] != null
        ? new AppIndex.fromJson(json['appIndex'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storyList != null) {
      data['storyList'] = this.storyList!.map((v) => v.toJson()).toList();
    }
    data['lastUpdatedTime'] = this.lastUpdatedTime;
    if (this.appIndex != null) {
      data['appIndex'] = this.appIndex!.toJson();
    }
    return data;
  }
}

class StoryList {
  Story? story;
  Ad? ad;

  StoryList({this.story, this.ad});

  StoryList.fromJson(Map<String, dynamic> json) {
    story = json['story'] != null ? new Story.fromJson(json['story']) : null;
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.story != null) {
      data['story'] = this.story!.toJson();
    }
    if (this.ad != null) {
      data['ad'] = this.ad!.toJson();
    }
    return data;
  }
}

class Story {
  int? id;
  String? hline;
  String? intro;
  String? pubTime;
  String? source;
  String? storyType;
  int? imageId;
  String? seoHeadline;
  String? context;
  CoverImage? coverImage;
  Entitlements? entitlements;
  Entitlements? adsType;

  Story(
      {this.id,
      this.hline,
      this.intro,
      this.pubTime,
      this.source,
      this.storyType,
      this.imageId,
      this.seoHeadline,
      this.context,
      this.coverImage,
      this.entitlements,
      this.adsType});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hline = json['hline'];
    intro = json['intro'];
    pubTime = json['pubTime'];
    source = json['source'];
    storyType = json['storyType'];
    imageId = json['imageId'];
    seoHeadline = json['seoHeadline'];
    context = json['context'];
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    entitlements = json['entitlements'] != null
        ? new Entitlements.fromJson(json['entitlements'])
        : null;
    adsType = json['adsType'] != null
        ? new Entitlements.fromJson(json['adsType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hline'] = this.hline;
    data['intro'] = this.intro;
    data['pubTime'] = this.pubTime;
    data['source'] = this.source;
    data['storyType'] = this.storyType;
    data['imageId'] = this.imageId;
    data['seoHeadline'] = this.seoHeadline;
    data['context'] = this.context;
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage!.toJson();
    }
    if (this.entitlements != null) {
      data['entitlements'] = this.entitlements!.toJson();
    }
    if (this.adsType != null) {
      data['adsType'] = this.adsType!.toJson();
    }
    return data;
  }
}

class CoverImage {
  String? id;
  String? caption;
  String? source;

  CoverImage({this.id, this.caption, this.source});

  CoverImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['source'] = this.source;
    return data;
  }
}

class Entitlements {
  // Entitlements({this.nu});

  Entitlements.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Ad {
  String? name;
  String? layout;
  int? position;

  Ad({this.name, this.layout, this.position});

  Ad.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    layout = json['layout'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['layout'] = this.layout;
    data['position'] = this.position;
    return data;
  }
}

class AppIndex {
  String? seoTitle;
  String? webURL;

  AppIndex({this.seoTitle, this.webURL});

  AppIndex.fromJson(Map<String, dynamic> json) {
    seoTitle = json['seoTitle'];
    webURL = json['webURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seoTitle'] = this.seoTitle;
    data['webURL'] = this.webURL;
    return data;
  }
}
