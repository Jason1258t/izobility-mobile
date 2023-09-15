import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key,
      required this.height,
      this.color = AppColors.purple100,
      required this.isBack,
      required this.title});

  final double height;
  final Color color;
  final bool isBack;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: SliverAppBarDelegate(
        minHeight: height,
        maxHeight: height,
        child: Container(
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isBack) ...[
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    )),
              ]else...[
                const SizedBox(
                  height: 24,
                  width: 24,
                )
              ],
              Text('Кошелёк',
                  style: AppFonts.font18w700
                      .copyWith(color: AppColors.textPrimary)),
              const SizedBox(
                height: 24,
                width: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
