import 'package:clean_architecture_posts_app/product/domain/entities/review.dart';

class ReviewModel extends Review {
  ReviewModel({
    required rating,
    required comment,
    required date,
    required reviewerName,
    required reviewerEmail,
  }) : super(
            rating: rating,
            comment: comment,
            date: date,
            reviewerName: reviewerName,
            reviewerEmail: reviewerEmail);

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json["rating"],
      comment: json["comment"],
      date: DateTime.tryParse(json["date"] ?? ""),
      reviewerName: json["reviewerName"],
      reviewerEmail: json["reviewerEmail"],
    );
  }
}
