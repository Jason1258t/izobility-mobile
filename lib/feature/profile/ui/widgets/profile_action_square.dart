import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/utils.dart';


class ProfileActionContainer extends StatefulWidget {
  const ProfileActionContainer({
    super.key,
  });

  @override
  State<ProfileActionContainer> createState() => _ProfileActionContainerState();
}


class _ProfileActionContainerState extends State<ProfileActionContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {},
        child: Container(
          constraints: const BoxConstraints(minHeight: 140),
          alignment: Alignment.topLeft,
          width: MediaQuery.sizeOf(context).width * 0.44444,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'fuck my ass bih',
                style: AppFonts.font16w700.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 12,
              ),
              Text('additionaol text',
                  style: AppFonts.font11w400.copyWith(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
