import 'package:equatable/equatable.dart';

class Review extends Equatable{
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;
  
  @override
  List<Object?> get props => [rating,comment,date,reviewerName,reviewerEmail];
}
