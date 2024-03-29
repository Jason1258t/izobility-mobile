import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/store/bloc/store_user_items/store_user_items_cubit.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/store/user_product.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/utils/ui/gradients.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button_sheet/bottom_sheets.dart';

class StoreUserProductsScreen extends StatefulWidget {
  const StoreUserProductsScreen({super.key});

  @override
  State<StoreUserProductsScreen> createState() =>
      _StoreUserProductsScreenState();
}

class _StoreUserProductsScreenState extends State<StoreUserProductsScreen> {

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    final storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        isBack: true,
        text: localize.my,
        onTap: () => context.pop(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<StoreRepository>().getUserProductList();
        },
        child: Container(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: BlocBuilder<StoreUserItemsCubit, StoreUserItemsState>(
              builder: (context, state) {
                if (state is StoreUserItemsLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is StoreUserItemsSuccess) {
                  if (storeRepository.userProductList.isEmpty) {
                    return Text(localize.you_have_no_puchases_yet);
                  }else{
                    return Column(
                    children: storeRepository
                        .userProductList
                        .map((e) => UserProductItemWidget(userProduct: e))
                        .toList(),
                  );
                  }

                  
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class UserProductItemWidget extends StatelessWidget {
  final UserProductModel userProduct;

  const UserProductItemWidget({super.key, required this.userProduct});

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 96,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Image.network(
                userProduct.product.images[0],
                fit: BoxFit.cover,
                height: double.infinity,
                width: 96,
              )),
          Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.sizeOf(context).width - 138,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  userProduct.product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTypography.font14w400.copyWith(color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    AppBottomSheets.showProductInfo(context, userProduct);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: AppGradients.accentGreen),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          localize.activate,
                          style: AppTypography.font14w700
                              .copyWith(color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
