abstract class ProductsViewStates{}

class ProductsViewInitialize extends ProductsViewStates{}

class ProductsViewLoading extends ProductsViewStates {}
class ProductsViewSuccess extends ProductsViewStates {}
class ProductsViewFailure extends ProductsViewStates {
  final String errMessage;

  ProductsViewFailure(this.errMessage);
}