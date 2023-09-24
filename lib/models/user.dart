class UserModel {
  int? id;
  String? email;
  String? phone;
  String? phoneCountry;
  String? emailPartner;
  String? phonePartner;
  int? cityId;
  int? isActive;
  int? isAdmin;
  int? isPartner;
  String? createdAt;
  String? lastLogin;
  String? dateLimit;
  int? siteId;
  List<String>? permissions;

  UserModel(
      {this.id,
      this.email,
      this.phone,
      this.phoneCountry,
      this.emailPartner,
      this.phonePartner,
      this.cityId,
      this.isActive,
      this.isAdmin,
      this.isPartner,
      this.createdAt,
      this.lastLogin,
      this.dateLimit,
      this.siteId,
      this.permissions});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    phoneCountry = json['phone_country'];
    emailPartner = json['emailPartner'];
    phonePartner = json['phonePartner'];
    cityId = json['city_id'];
    isActive = json['is_active'];
    isAdmin = json['is_admin'];
    isPartner = json['is_partner'];
    createdAt = json['created_at'];
    lastLogin = json['last_login'];
    dateLimit = json['date_limit'];
    siteId = json['site_id'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phone_country'] = this.phoneCountry;
    data['emailPartner'] = this.emailPartner;
    data['phonePartner'] = this.phonePartner;
    data['city_id'] = this.cityId;
    data['is_active'] = this.isActive;
    data['is_admin'] = this.isAdmin;
    data['is_partner'] = this.isPartner;
    data['created_at'] = this.createdAt;
    data['last_login'] = this.lastLogin;
    data['date_limit'] = this.dateLimit;
    data['site_id'] = this.siteId;
    data['permissions'] = this.permissions;
    return data;
  }
}
