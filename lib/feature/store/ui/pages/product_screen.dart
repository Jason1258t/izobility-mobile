import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: widget.title,
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Промокод на бесплатный бургер в ресторанах Burger King",
                style: AppTypography.font20w700.copyWith(color: Colors.black),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.disableButton,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      "Ваш промокод",
                      style: AppTypography.font14w700
                          .copyWith(color: AppColors.grey500),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 100,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.grey500,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      "Для получение необходимо",
                      style: AppTypography.font18w700
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductCoinPriceContainer(
                          width: (MediaQuery.sizeOf(context).width - 72) * 0.5,
                          imagePath: 'assets/icons/coin.svg',
                          quantity: 1235.92,
                        ),
                        ProductCoinPriceContainer(
                          width: (MediaQuery.sizeOf(context).width - 72) * 0.5,
                          imagePath: 'assets/icons/coin.svg',
                          quantity: 1235.92,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ProductCoinPriceContainer(
                      width: double.infinity,
                      imagePath: 'assets/icons/coin.svg',
                      quantity: 1235.92,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Осталось ${900} из ${1000}",
                style:
                    AppTypography.font12w400.copyWith(color: AppColors.grey500),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "У вас есть",
                style: AppTypography.font18w700.copyWith(color: Colors.black),
              ),
              ProductMyCoinQuantity(
                imagePath: 'assets/icons/coin.svg',
                quantity: 900,
              ),
              ProductMyCoinQuantity(
                imagePath: 'assets/icons/coin.svg',
                quantity: 900,
              ),
              ProductMyCoinQuantity(
                imagePath: 'assets/icons/coin.svg',
                quantity: 900,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(
                  isActive: false,
                  text: "Получить",
                  onTap: () {},
                  width: double.infinity),
              const SizedBox(height: 8,),
              CustomButton(
                  isActive: true,
                  text: "Купить монет",
                  onTap: () {},
                  width: double.infinity),

              const SizedBox(height: 16,),

              Text('Описание', style: AppTypography.font18w700.copyWith(color: Colors.black),),

              const SizedBox(height: 10,),

              Text("Есть над чем задуматься: предприниматели в сети интернет лишь добавляют фракционных разногласий и ассоциативно распределены по отраслям. В целом, конечно, постоянное информационно-пропагандистское обеспечение нашей деятельности способствует повышению качества анализа существующих паттернов поведения.",
              style: AppTypography.font12w400.copyWith(color: AppColors.grey500),)
            ],
          ),
        ),
      ),
    );
  }
}

class ProductMyCoinQuantity extends StatelessWidget {
  final String imagePath;
  final double quantity;

  const ProductMyCoinQuantity({
    super.key,
    required this.imagePath,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 2, color: Colors.green[100]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductCoinCard(
            imagePath: imagePath,
            quantity: quantity,
          ),
          Icon(
            Icons.check,
            color: AppColors.primary,
            size: 24,
          )
        ],
      ),
    );
  }
}

class ProductCoinPriceContainer extends StatelessWidget {
  final String imagePath;
  final double width;
  final double quantity;

  const ProductCoinPriceContainer({
    super.key,
    required this.imagePath,
    required this.quantity,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 9),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: ProductCoinCard(imagePath: imagePath, quantity: quantity),
    );
  }
}

class ProductCoinCard extends StatelessWidget {
  const ProductCoinCard({
    super.key,
    required this.imagePath,
    required this.quantity,
  });

  final String imagePath;
  final double quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(imagePath),
        const SizedBox(
          width: 6,
        ),
        Text(
          quantity.toString(),
          style: AppTypography.font14w700.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
