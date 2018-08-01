import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorites = false;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayProducts {
    if(_showFavorites){
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void addProduct(Product productData) {

    _products.add(productData);
    _selectedProductIndex = null;
    notifyListeners();
    
  }

  void updateProduct(Product productData) {

    _products[_selectedProductIndex] = productData;
    _selectedProductIndex = null;
    notifyListeners();

  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();

  }

  void toggleProductFavoriteStatus() {

    final bool isCurrentlyFavorite = selectProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectProduct.title,
        description: selectProduct.description,
        price: selectProduct.price,
        image: selectProduct.image,
        isFavorite: newFavoriteStatus);

    _products[_selectedProductIndex] = updatedProduct;
    _selectedProductIndex = null;
    notifyListeners();
    //toggleProductFavoriteStatus();
  }

  void selectedProduct(int index) {

    _selectedProductIndex = index;
    notifyListeners();

  }

  void toggleDisplayMode(){
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
