class FindInformationDataEntityEntity {
	int startRow;
	List<int> navigatepageNums;
	int lastPage;
	int prePage;
	bool hasNextPage;
	int nextPage;
	int pageSize;
	int endRow;
	List<FindInformationDataEntityList> xList;
	int pageNum;
	int navigatePages;
	int total;
	int navigateFirstPage;
	int pages;
	int size;
	int firstPage;
	bool isLastPage;
	bool hasPreviousPage;
	int navigateLastPage;
	bool isFirstPage;

	FindInformationDataEntityEntity({this.startRow, this.navigatepageNums, this.lastPage, this.prePage, this.hasNextPage, this.nextPage, this.pageSize, this.endRow, this.xList, this.pageNum, this.navigatePages, this.total, this.navigateFirstPage, this.pages, this.size, this.firstPage, this.isLastPage, this.hasPreviousPage, this.navigateLastPage, this.isFirstPage});

	FindInformationDataEntityEntity.fromJson(Map<String, dynamic> json) {
		startRow = json['startRow'];
		navigatepageNums = json['navigatepageNums']?.cast<int>();
		lastPage = json['lastPage'];
		prePage = json['prePage'];
		hasNextPage = json['hasNextPage'];
		nextPage = json['nextPage'];
		pageSize = json['pageSize'];
		endRow = json['endRow'];
		if (json['list'] != null) {
			xList = new List<FindInformationDataEntityList>();(json['list'] as List).forEach((v) { xList.add(new FindInformationDataEntityList.fromJson(v)); });
		}
		pageNum = json['pageNum'];
		navigatePages = json['navigatePages'];
		total = json['total'];
		navigateFirstPage = json['navigateFirstPage'];
		pages = json['pages'];
		size = json['size'];
		firstPage = json['firstPage'];
		isLastPage = json['isLastPage'];
		hasPreviousPage = json['hasPreviousPage'];
		navigateLastPage = json['navigateLastPage'];
		isFirstPage = json['isFirstPage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['startRow'] = this.startRow;
		data['navigatepageNums'] = this.navigatepageNums;
		data['lastPage'] = this.lastPage;
		data['prePage'] = this.prePage;
		data['hasNextPage'] = this.hasNextPage;
		data['nextPage'] = this.nextPage;
		data['pageSize'] = this.pageSize;
		data['endRow'] = this.endRow;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['pageNum'] = this.pageNum;
		data['navigatePages'] = this.navigatePages;
		data['total'] = this.total;
		data['navigateFirstPage'] = this.navigateFirstPage;
		data['pages'] = this.pages;
		data['size'] = this.size;
		data['firstPage'] = this.firstPage;
		data['isLastPage'] = this.isLastPage;
		data['hasPreviousPage'] = this.hasPreviousPage;
		data['navigateLastPage'] = this.navigateLastPage;
		data['isFirstPage'] = this.isFirstPage;
		return data;
	}
}

class FindInformationDataEntityList {
	String publishTime;
	String previewUrl;
	int isElite;
	int previewUrlSize;
	String title;
	int readCount;
	String content;
	List<String> previewUrlArr;
	int commentCount;
	int eliteCount;
	dynamic createUser;
	dynamic shareUrl;
	int id;
	String targetUrl;
	String contentType;
	dynamic createUserImg;

	FindInformationDataEntityList({this.publishTime, this.previewUrl, this.isElite, this.previewUrlSize, this.title, this.readCount, this.content, this.previewUrlArr, this.commentCount, this.eliteCount, this.createUser, this.shareUrl, this.id, this.targetUrl, this.contentType, this.createUserImg});

	FindInformationDataEntityList.fromJson(Map<String, dynamic> json) {
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
