part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}


class GetAllCategoriesEvent extends CategoriesEvent {

  const GetAllCategoriesEvent();
}

class RefreshCategoriesEvent extends CategoriesEvent {

  const RefreshCategoriesEvent();
}
