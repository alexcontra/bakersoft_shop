import 'package:baker_soft_shop/core/common_widgets/app_bar/app_bar_view.dart';
import 'package:baker_soft_shop/core/common_widgets/buttons/buttons.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/widgets/text_widget_view.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/bloc/shopping_bag_cubit.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/controller/bag_controller.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/widgets/bottom_action.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/widgets/shopping_bag_entry.dart';
import 'package:baker_soft_shop/specs/colors.dart';
import 'package:baker_soft_shop/specs/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingPageBody extends StatelessWidget {
  const ShoppingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: CustomAppBar(
        title: 'Shopping bag',
        isBackButton: true,
        isShoppingCart: false,
        isProfile: false,
      ),
      body: BlocBuilder<ShoppingBagCubit, ShoppingBagState>(
        builder: (context, state) {
          if (state is ShoppingBagInitialState) {
            context.read<ShoppingBagCubit>().getProductsShoppingCart();
          }
          if (state is ShoppingBagSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.response.length,
                    itemBuilder: (context, index) {
                      return ShoppingBagEntry(
                        title: state.response[index].title!,
                        price: state.response[index].price!,
                        onPressed: () {
                          context
                              .read<ShoppingBagCubit>()
                              .removeDataFromCart(state.response[index]);
                        },
                      );
                    },
                  ),
                ),
                BottomAction(
                  price: BagController().getBagPrice(state.response),
                ),
              ],
            );
          } else if (state is ShoppingBagSuccessEmptyListState) {
            return const Center(child: Text('Your shopping bag is empty'));
          } else {
            return const Center(child: Text('Failed to get Data'));
          }
        },
      ),
    );
  }
}
