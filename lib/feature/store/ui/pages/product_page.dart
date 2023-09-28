import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/store/bloc/store_cubit.dart';
import 'package:izobility_mobile/feature/store/bloc/store_item/store_item_cubit.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/product_link.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/profuct_my_coin_quantity.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/store_item_quantity_container.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/store_price_container.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProductScreen extends StatefulWidget {
  final String id;

  const ProductScreen({super.key, required this.id});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<StoreItemCubit>().loadMarketItemInfo(int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Промокод",
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<StoreItemCubit, StoreItemState>(
          builder: (context, state) {
            if (state is StoreItemLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is StoreItemSuccessState) {
              return buildMarketItemData();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Container buildMarketItemData() {
    final marketItem = context.read<StoreRepository>().lastOpenedMarketItem;
    final emeraldCoin = context.read<WalletRepository>().emeraldCoin;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            height: 150,
          ),

          Text(
            marketItem.name!,
            style: AppTypography.font20w700.copyWith(color: Colors.black),
          ),

          StorePriceContainer(
            price: marketItem.price!,
          ),
          const SizedBox(
            height: 4,
          ),
          StoreItemQuantityContainer(
              itemsLost: marketItem.quantity!, itemsAll: 1000),
          const SizedBox(
            height: 16,
          ),
          const Text("У вас есть"),
          ProductMyCoinQuantity(
            imagePath: "assets/icons/coin.svg",
            quantity: emeraldCoin.toDouble(),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
              isActive: false,
              text: "Получить",
              onTap: () {},
              width: double.infinity),
          const SizedBox(
            height: 8,
          ),
          CustomButton(
              isActive: true,
              text: "Купить монет",
              onTap: () {},
              width: double.infinity),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Описание',
            style: AppTypography.font18w700.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            marketItem.description!,
            style: AppTypography.font12w400.copyWith(color: AppColors.grey500),
          ),
          const SizedBox(
            height: 15,
          ),
          const ProductLink(
            linkText: "О компании",
          ),
          const SizedBox(
            height: 5,
          ),
          const ProductLink(
            linkText: "Об акции",
          ),
          const SizedBox(
            height: 5,
          ),
          const ProductLink(
            linkText: "Публичная офёрта",
          ),
          const SizedBox(
            height: 5,
          ),
          const ProductLink(
            linkText: "О возврате",
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
