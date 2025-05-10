import 'package:clean_architecture_posts_app/product/data/models/review_model.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required id,
    required title,
    required description,
    required category,
    required price,
    required discountPercentage,
    required rating,
    required stock,
    required tags,
    required brand,
    required sku,
    required weight,
    // required dimensions,
    required warrantyInformation,
    required shippingInformation,
    required availabilityStatus,
    required reviews,
    required returnPolicy,
    required minimumOrderQuantity,
    // required meta,
    required images,
    required thumbnail,
  }) : super(
          id: id,
          title: title,
          description: description,
          category: category,
          price: price,
          discountPercentage: discountPercentage,
          rating: rating,
          stock: stock,
          tags: tags,
          brand: brand,
          sku: sku,
          weight: weight,
          warrantyInformation: warrantyInformation,
          shippingInformation: shippingInformation,
          availabilityStatus: availabilityStatus,
          returnPolicy: returnPolicy,
          minimumOrderQuantity: minimumOrderQuantity,
          images: images,
          thumbnail: thumbnail,
          reviews: reviews,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      price: json["price"],
      discountPercentage: json["discountPercentage"],
      rating: json["rating"],
      stock: json["stock"],
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]!.map((x) => x)),
      brand: json["brand"],
      sku: json["sku"],
      weight: json["weight"],
      // dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
      warrantyInformation: json["warrantyInformation"],
      shippingInformation: json["shippingInformation"],
      availabilityStatus: json["availabilityStatus"],
      reviews: json["reviews"] == null
          ? []
          : List<ReviewModel>.from(
              json["reviews"]!.map((x) => ReviewModel.fromJson(x))),
      returnPolicy: json["returnPolicy"],
      minimumOrderQuantity: json["minimumOrderQuantity"],
      // meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      thumbnail: json["thumbnail"],
    );
  }
}




// class Dimensions {
//     Dimensions({
//         required width,
//         required height,
//         required depth,
//     });

//     final double? width;
//     final double? height;
//     final double? depth;

//     factory Dimensions.fromJson(Map<String, dynamic> json){ 
//         return Dimensions(
//             width: json["width"],
//             height: json["height"],
//             depth: json["depth"],
//         );
//     }

// }

// class Meta {
//     Meta({
//         required createdAt,
//         required updatedAt,
//         required barcode,
//         required qrCode,
//     });

//     final DateTime? createdAt;
//     final DateTime? updatedAt;
//     final String? barcode;
//     final String? qrCode;

//     factory Meta.fromJson(Map<String, dynamic> json){ 
//         return Meta(
//             createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
//             updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//             barcode: json["barcode"],
//             qrCode: json["qrCode"],
//         );
//     }

// }

