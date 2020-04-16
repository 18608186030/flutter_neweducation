class FindShortVideoDataEntity {
	int startRow;
	List<int> navigatepageNums;
	int lastPage;
	int prePage;
	bool hasNextPage;
	int nextPage;
	int pageSize;
	int endRow;
	List<FindShortVideoDataList> xList;
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

	FindShortVideoDataEntity({this.startRow, this.navigatepageNums, this.lastPage, this.prePage, this.hasNextPage, this.nextPage, this.pageSize, this.endRow, this.xList, this.pageNum, this.navigatePages, this.total, this.navigateFirstPage, this.pages, this.size, this.firstPage, this.isLastPage, this.hasPreviousPage, this.navigateLastPage, this.isFirstPage});

	FindShortVideoDataEntity.fromJson(Map<String, dynamic> json) {
		startRow = json['startRow'];
		navigatepageNums = json['navigatepageNums']?.cast<int>();
		lastPage = json['lastPage'];
		prePage = json['prePage'];
		hasNextPage = json['hasNextPage'];
		nextPage = json['nextPage'];
		pageSize = json['pageSize'];
		endRow = json['endRow'];
		if (json['list'] != null) {
			xList = new List<FindShortVideoDataList>();(json['list'] as List).forEach((v) { xList.add(new FindShortVideoDataList.fromJson(v)); });
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

class FindShortVideoDataList {
	double duration;
	dynamic publishTime;
	String previewUrl;
	int isElite;
	int eliteCount;
	int id;
	String title;
	int readCount;
	String targetUrl;
	String introduction;
	int commentCount;

	FindShortVideoDataList({this.duration, this.publishTime, this.previewUrl, this.isElite, this.eliteCount, this.id, this.title, this.readCount, this.targetUrl, this.introduction, this.commentCount});

	FindShortVideoDataList.fromJson(Map<String, dynamic> json) {
		duration = json['duration'];
		publishTime = json['publishTime'];
		previewUrl = json['previewUrl'];
		isElite = json['isElite'];
		eliteCount = json['eliteCount'];
		id = json['id'];
		title = json['title'];
		readCount = json['readCount'];
		targetUrl = json['targetUrl'];
		introduction = json['introduction'];
		commentCount = json['commentCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['duration'] = this.duration;
		data['publishTime'] = this.publishTime;
		data['previewUrl'] = this.previewUrl;
		data['isElite'] = this.isElite;
		data['eliteCount'] = this.eliteCount;
		data['id'] = this.id;
		data['title'] = this.title;
		data['readCount'] = this.readCount;
		data['targetUrl'] = this.targetUrl;
		data['introduction'] = this.introduction;
		data['commentCount'] = this.commentCount;
		return data;
	}
}
