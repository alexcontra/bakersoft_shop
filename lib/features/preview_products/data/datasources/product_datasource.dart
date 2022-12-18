import 'package:baker_soft_shop/app/dependency_injection/injection_container.dart';
import 'package:baker_soft_shop/core/shared_preferences/shared_preferences.dart';
import 'package:baker_soft_shop/core/shared_preferences/shared_preferences_keys.dart';
import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';

abstract class ProductDataSource {
  Future<bool> saveProductInLocalStorage(ProductModel productModel);
}

class ProductDataSourceImpl implements ProductDataSource {
  @override
  Future<bool> saveProductInLocalStorage(ProductModel productModel) async {
    ///Get the list already store [currentList]
    String currentList = injector<SharedPreferencesAbstract>()
            .getString(SharedPreferencesKeys.shoppingBag) ??
        '';
    late String newList = '';

    ///setup new list
    if (currentList.isNotEmpty) {
      List<ProductModel> decodedList = ProductModel.decode(currentList);
      decodedList.add(productModel);
      newList = ProductModel.encode(decodedList);
    } else {
      String newProduct = ProductModel.encode([productModel]);
      newList += newProduct;
    }

    ///Save the new list in [SharedPreferencesKeys.shoppingBag]
    return await injector<SharedPreferencesAbstract>()
        .setString(SharedPreferencesKeys.shoppingBag, newList);
  }
}
