import 'package:baker_soft_shop/app/dependency_injection/injection_container.dart';
import 'package:baker_soft_shop/core/shared_preferences/shared_preferences.dart';
import 'package:baker_soft_shop/core/shared_preferences/shared_preferences_keys.dart';
import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';

abstract class ShoppingBagDataSource {
  Future<List<ProductModel>> getBagContnet();
  Future<List<ProductModel>> removeBagContent(ProductModel product);
}

class ShoppingBagDataSourceImpl implements ShoppingBagDataSource {
  @override
  Future<List<ProductModel>> getBagContnet() async {
    ///Get the  list in [SharedPreferencesKeys.shoppingBag]
    return await _getCurrentListOfProducts();
  }

  @override
  Future<List<ProductModel>> removeBagContent(ProductModel product) async {
    List<ProductModel>? currentList = await _getCurrentListOfProducts();
    if (currentList.isNotEmpty) {
      currentList.remove(product);
      String convertedList = ProductModel.encode(currentList);
      injector<SharedPreferencesAbstract>()
          .setString(SharedPreferencesKeys.shoppingBag, convertedList);
    }
    return currentList.isEmpty ? [] : currentList;
  }

  Future<List<ProductModel>> _getCurrentListOfProducts() async {
    ///Get the list already store [currentList]
    String currentList = injector<SharedPreferencesAbstract>()
            .getString(SharedPreferencesKeys.shoppingBag) ??
        '';

    return currentList.isEmpty ? [] : ProductModel.decode(currentList);
  }
}
