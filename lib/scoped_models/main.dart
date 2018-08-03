import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/products.dart';
import '../scoped_models/user.dart';

class MainModel extends Model with UserModel, ProductsModel{
    
}