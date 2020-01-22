class BrandAndVariable {
  Data data;
  bool success;
  String message;
  int statusCode;

  BrandAndVariable({this.data, this.success, this.message, this.statusCode});

  BrandAndVariable.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  List<Brands> brands;
  List<Vars> vars;

  Data({this.brands, this.vars});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = new List<Brands>();
      json['brands'].forEach((v) {
        brands.add(new Brands.fromJson(v));
      });
    }
    if (json['vars'] != null) {
      vars = new List<Vars>();
      json['vars'].forEach((v) {
        vars.add(new Vars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    if (this.vars != null) {
      data['vars'] = this.vars.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  String id;
  String brandName;
  String photo;

  Brands({this.id, this.brandName, this.photo});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['photo'] = this.photo;
    return data;
  }
}

class Vars {
  String id;
  String variableName;
  String unit;
  String isSelectValue;
  String categoryName;
  List<Values> values;

  Vars(
      {this.id,
      this.variableName,
      this.unit,
      this.isSelectValue,
      this.categoryName,
      this.values});

  Vars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variableName = json['variable_name'];
    unit = json['unit'];
    isSelectValue = json['is_select_value'];
    categoryName = json['category_name'];
    if (json['values'] != null) {
      values = new List<Values>();
      json['values'].forEach((v) {
        values.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variable_name'] = this.variableName;
    data['unit'] = this.unit;
    data['is_select_value'] = this.isSelectValue;
    data['category_name'] = this.categoryName;
    if (this.values != null) {
      data['values'] = this.values.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String id;
  String variableValue;

  Values({this.id, this.variableValue});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variableValue = json['variable_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variable_value'] = this.variableValue;
    return data;
  }
}
