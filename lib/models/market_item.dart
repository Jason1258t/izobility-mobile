class MarketItemModel {
  int? id;
  String? name;
  String? description;
  int? quantity;
  double? price;
  String? createdAt;
  String? updatedAt;
  int? partnerId;
  int? cityId;
  int? countryId;
  double? price1;
  double? price2;
  double? price3;
  double? price4;
  bool? isMarketplace;
  bool? isContest;
  String? dateEnd;
  bool? isEnabled;
  int? siteId;
  int? monetaId;
  String? categ;
  bool? like;
  List<MarketItemModelImage>? images;

  MarketItemModel({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.partnerId,
    this.cityId,
    this.countryId,
    this.isMarketplace,
    this.isContest,
    this.dateEnd,
    this.isEnabled,
    this.siteId,
    this.monetaId,
    this.categ,
    this.like,
    this.images,
  });

  factory MarketItemModel.fromJson(Map<String, dynamic> json) {
    return MarketItemModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      quantity: int.parse(json['quantity']),
      price: double.parse(json['price']),
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      // cityId: int.tryParse(json['city_id']),
      // countryId: json['country_id'],
      // isMarketplace: json['is_marketplace'],
      // isContest: json['is_contest'],
      // dateEnd: json['date_end'],
      // isEnabled: json['is_enabled'],
      // siteId: int.tryParse(json['site_id']),
      // monetaId: int.tryParse(json['moneta_id']),
      // categ: json['categ'],
      // like: json['like'],
      images: (json['images'] as List<dynamic>)
          .map((e) => MarketItemModelImage.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
      'price': price,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'partner_id': partnerId,
      'city_id': cityId,
      'country_id': countryId,
      'price1': price1,
      'price2': price2,
      'price3': price3,
      'price4': price4,
      'is_marketplace': isMarketplace,
      'is_contest': isContest,
      'date_end': dateEnd,
      'is_enabled': isEnabled,
      'site_id': siteId,
      'moneta_id': monetaId,
      'categ': categ,
      'like': like,
      'images': images?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'MarketItemModel{id: $id, name: $name, description: $description, quantity: $quantity, price: $price, createdAt: $createdAt, updatedAt: $updatedAt, partnerId: $partnerId, cityId: $cityId, countryId: $countryId, price1: $price1, price2: $price2, price3: $price3, price4: $price4, isMarketplace: $isMarketplace, isContest: $isContest, dateEnd: $dateEnd, isEnabled: $isEnabled, siteId: $siteId, monetaId: $monetaId, categ: $categ, like: $like, images: $images, }';
  }
}


class MarketItemModelImage {
  int id;
  String path;
  int position;
  int productId;

  MarketItemModelImage({
    required this.id,
    required this.path,
    required this.position,
    required this.productId,
  });

  factory MarketItemModelImage.fromJson(Map<String, dynamic> json) {
    return MarketItemModelImage(
      id: json['id'],
      path: "https://api.z-boom.ru/media/" + json['path'],
      position: json['position'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'position': position,
      'product_id': productId,
    };
  }
}

// class MarketItemModelMoneta {
//   int id;
//   int partnerId;
//   int type;
//   String name;
//   String codename;
//   int emission;
//   String logo;
//   String link3dmodel;
//   String createdAt;
//   double kursRub;
//   String description;
//   int amountAr;
//   int amountSoctsetPost;
//   int amountSoctsetLike;
//   int amountSoctsetShare;
//   int amountDraft;
//   String url;
//   String urlZeroscan;
//   String deletedAt;

//   MarketItemModelMoneta({
//     required this.id,
//     required this.partnerId,
//     required this.type,
//     required this.name,
//     required this.codename,
//     required this.emission,
//     required this.logo,
//     required this.link3dmodel,
//     required this.createdAt,
//     required this.kursRub,
//     required this.description,
//     required this.amountAr,
//     required this.amountSoctsetPost,
//     required this.amountSoctsetLike,
//     required this.amountSoctsetShare,
//     required this.amountDraft,
//     required this.url,
//     required this.urlZeroscan,
//     required this.deletedAt,
//   });

//   factory MarketItemModelMoneta.fromJson(Map<String, dynamic> json) {
//     return MarketItemModelMoneta(
//       id: int.parse(json['id']),
//       partnerId: json['partner_id'],
//       type: json['type'],
//       name: json['name'],
//       codename: json['codename'],
//       emission: json['emission'],
//       logo: json['logo'],
//       link3dmodel: json['link3dmodel'],
//       createdAt: json['created_at'],
//       kursRub: json['kurs_rub'].toDouble(),
//       description: json['description'],
//       amountAr: json['amount_ar'],
//       amountSoctsetPost: json['amount_soctset_post'],
//       amountSoctsetLike: json['amount_soctset_like'],
//       amountSoctsetShare: json['amount_soctset_share'],
//       amountDraft: json['amount_draft'],
//       url: json['url'],
//       urlZeroscan: json['url_zeroscan'],
//       deletedAt: json['deleted_at'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'partner_id': partnerId,
//       'type': type,
//       'name': name,
//       'codename': codename,
//       'emission': emission,
//       'logo': logo,
//       'link3dmodel': link3dmodel,
//       'created_at': createdAt,
//       'kurs_rub': kursRub,
//       'description': description,
//       'amount_ar': amountAr,
//       'amount_soctset_post': amountSoctsetPost,
//       'amount_soctset_like': amountSoctsetLike,
//       'amount_soctset_share': amountSoctsetShare,
//       'amount_draft': amountDraft,
//       'url': url,
//       'url_zeroscan': urlZeroscan,
//       'deleted_at': deletedAt,
//     };
//   }
// }
