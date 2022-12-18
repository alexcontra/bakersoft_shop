import '../../../preview_products/data/models/product_model/product_model.dart';

class BagController {
  double getBagPrice(List<ProductModel> products) {
    double currentPrice = 0.0;
    for (var product in products) {
      currentPrice += product.price!;
    }
    return currentPrice;
  }
}
