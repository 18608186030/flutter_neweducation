class WelfaredataEntity {
	List<WelfaredataList> xList;

	WelfaredataEntity({this.xList});

	WelfaredataEntity.fromJson(Map<String, dynamic> json) {
		if (json['list'] != null) {
			xList = new List<WelfaredataList>();(json['list'] as List).forEach((v) { xList.add(new WelfaredataList.fromJson(v)); });
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

class WelfaredataList {
	String code;
	dynamic dataType;
	dynamic description;
	bool leaf;
	int parentId;
	dynamic parentName;
	dynamic parentCode;
	int createTime;
	dynamic children;
	String name;
	int id;
	dynamic parentValue;
	String value;
	int status;

	WelfaredataList({this.code, this.dataType, this.description, this.leaf, this.parentId, this.parentName, this.parentCode, this.createTime, this.children, this.name, this.id, this.parentValue, this.value, this.status});

	WelfaredataList.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		dataType = json['dataType'];
		description = json['description'];
		leaf = json['leaf'];
		parentId = json['parentId'];
		parentName = json['parentName'];
		parentCode = json['parentCode'];
		createTime = json['createTime'];
		children = json['children'];
		name = json['name'];
		id = json['id'];
		parentValue = json['parentValue'];
		value = json['value'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['dataType'] = this.dataType;
		data['description'] = this.description;
		data['leaf'] = this.leaf;
		data['parentId'] = this.parentId;
		data['parentName'] = this.parentName;
		data['parentCode'] = this.parentCode;
		data['createTime'] = this.createTime;
		data['children'] = this.children;
		data['name'] = this.name;
		data['id'] = this.id;
		data['parentValue'] = this.parentValue;
		data['value'] = this.value;
		data['status'] = this.status;
		return data;
	}
}
