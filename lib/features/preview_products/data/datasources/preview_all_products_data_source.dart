import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';

import '../../../../specs/assets.dart';
import '../models/news_feed_products/news_feed_products.dart';

abstract class PreviewAllProductsDatasource {
  Future<NewsFeedModel> getNewsFeedProducts();
}

class PreviewAllProductsDatasourceImpl implements PreviewAllProductsDatasource {
  @override
  Future<NewsFeedModel> getNewsFeedProducts() async {
    return NewsFeedModel(
        topProduct: ProductModel(
            title: 'iPhone 14 Pro Max',
            image: Assets.PRO_14_DEEP_PURPLE,
            price: 899,
            data: [
              'Color Deep Purple',
              '256 Gb Storage',
              '5G Technology',
              '6.7 inches'
            ]),
        productContent: [
          ProductModel(
            title: 'iPhone 14',
            image: Assets.N_14_BLUE,
            price: 799,
            data: [
              'Color Green',
              '128 Gb Storage',
              '5G Technology',
              '5.8 inches'
            ],
          ),
          ProductModel(
            title: 'iPhone 12 Mini',
            image: Assets.MINI_12_BLUE,
            price: 499,
            data: [
              'Color Blue',
              '64 Gb Storage',
              '4G Technology',
              '5.4 inches'
            ],
          ),
          ProductModel(
            title: 'iPhone 12',
            image: Assets.N_12_BLUE,
            price: 599,
            data: [
              'Color Black',
              '128 Gb Storage',
              '5G Technology',
              '5.8 inches'
            ],
          ),
        ]);
  }
}
