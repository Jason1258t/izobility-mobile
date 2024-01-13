import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/store/bloc/store_user_items/store_user_items_cubit.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/widgets/button_sheet/bottom_sheets.dart';

import '../../../../../utils/utils.dart';

class UserProductsWidget extends StatefulWidget {
  const UserProductsWidget({super.key});

  @override
  State<UserProductsWidget> createState() => _UserProductsWidgetState();
}

class _UserProductsWidgetState extends State<UserProductsWidget> {
  Widget buildLoadedUserProducts() {
    final storeRepository = RepositoryProvider.of<StoreRepository>(context);

    return SizedBox(
      height: 190,
      child: ListView.builder(
        itemCount: storeRepository.userProductList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            constraints: const BoxConstraints(maxWidth: 250),
            width: MediaQuery.sizeOf(context).width * 0.38,
            margin: const EdgeInsets.only(left: 16),
            height: 190,
            child: Material(
              child: Ink.image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  storeRepository.userProductList[index].product.images[0],
                ),
                child: InkWell(
                  onTap: () {
                    AppBottomSheets.showProductInfo(
                        context, storeRepository.userProductList[index]);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoadingUserProducts() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemBuilder: (context, index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            constraints: const BoxConstraints(maxWidth: 250),
            width: MediaQuery.sizeOf(context).width * 0.38,
            height: 190,
            child: Container(
              decoration: BoxDecoration(
                  gradient: AppGradients.gradientGreenWhite,
                  borderRadius: BorderRadius.circular(16)),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeRepository = RepositoryProvider.of<StoreRepository>(context);

    return BlocBuilder<StoreUserItemsCubit, StoreUserItemsState>(
      builder: (context, state) {
        if (state is StoreUserItemsLoading) return buildLoadingUserProducts();
        if (state is StoreUserItemsSuccess &&
            storeRepository.userProductList.isNotEmpty) {
          return buildLoadedUserProducts();
        }

        return Container();
      },
    );
  }
}
