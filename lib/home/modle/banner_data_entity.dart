class BannerDataEntity {
	List<BannerDataList> xList;

	BannerDataEntity({this.xList});

	BannerDataEntity.fromJson(Map<String, dynamic> json) {
		if (json['list'] != null) {
			xList = new List<BannerDataList>();(json['list'] as List).forEach((v) { xList.add(new BannerDataList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class BannerDataList {
	String publishTime;
	String previewUrl;
	int isElite;
	int previewUrlSize;
	String title;
	int readCount;
	dynamic content;
	List<String> previewUrlArr;
	int commentCount;
	int eliteCount;
	dynamic createUser;
	dynamic shareUrl;
	int id;
	String targetUrl;
	String contentType;
	dynamic createUserImg;

	BannerDataList({this.publishTime, this.previewUrl, this.isElite, this.previewUrlSize, this.title, this.readCount, this.content, this.previewUrlArr, this.commentCount, this.eliteCount, this.createUser, this.shareUrl, this.id, this.targetUrl, this.contentType, this.createUserImg});

	BannerDataList.fromJson(Map<String, dynamic> json) {
		publishTime = json['publishTime'];
		previewUrl = json['previewUrl'];
		isElite = json['isElite'];
		previewUrlSize = json['previewUrlSize'];
		title = json['title'];
		readCount = json['readCount'];
		content = json['content'];
		previewUrlArr = json['previewUrlArr']?.cast<String>();
		commentCount = json['commentCount'];
		eliteCount = json['eliteCount'];
		createUser = json['createUser'];
		shareUrl = json['shareUrl'];
		id = json['id'];
		targetUrl = json['targetUrl'];
		contentType = json['contentType'];
		createUserImg = json['createUserImg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['publishTime'] = this.publishTime;
		data['previewUrl'] = this.previewUrl;
		data['isElite'] = this.isElite;
		data['previewUrlSize'] = this.previewUrlSize;
		data['title'] = this.title;
		data['readCount'] = this.readCount;
		data['content'] = this.content;
		data['previewUrlArr'] = this.previewUrlArr;
		data['commentCount'] = this.commentCount;
		data['eliteCount'] = this.eliteCount;
		data['createUser'] = this.createUser;
		data['shareUrl'] = this.shareUrl;
		data['id'] = this.id;
		data['targetUrl'] = this.targetUrl;
		data['contentType'] = this.contentType;
		data['createUserImg'] = this.createUserImg;
		return data;
	}
}
