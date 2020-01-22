class Category {
  List<Data> data;
  bool success;
  String message;
  int statusCode;

  Category({this.data, this.success, this.message, this.statusCode});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  int id;
  int totalItem;
  String categoryName;

  Data({this.id, this.totalItem, this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalItem = json['total_item'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_item'] = this.totalItem;
    data['category_name'] = this.categoryName;
    return data;
  }
}
