
import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model{

    List<Product> _products = [];

    List<Product> get products {
      return List.from(_products);
    }

  void addProduct(Product productData) {
      _products.add(productData);
  }

  void updateProduct(int index, Product productData) {
          _products[index] = productData;
  }

  void deleteProduct(int index){
          _products.removeAt(index);
  }
}