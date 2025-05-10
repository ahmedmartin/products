const BaseURL = "https://dummyjson.com/products";

const CategoriesURL = '$BaseURL/category-list';

const ProductsURL = '$BaseURL/category';


String AllProductsByCategoryURL(String category)=> '$ProductsURL/$category';

String ProductByIdURL(int id)=> '$BaseURL/$id';
