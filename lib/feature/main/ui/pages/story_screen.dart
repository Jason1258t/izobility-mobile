import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/main/bloc/story/story_cubit.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/story_indicator.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.initialStoryIndex});

  final int initialStoryIndex;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  void exit() {
    try {
      BlocProvider.of<StoryCubit>(context).dispose();
      animationController.dispose();
    } catch (e) {}
    context.go(RouteNames.main);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StoryCubit>(context);
    if (bloc.controller == null) {
      animationController = AnimationController(
        vsync: this,
      );
      bloc.initController(animationController, initialStoryIndex: widget.initialStoryIndex);
      animationController.addListener(bloc.controllerListener);
    }

    final Size size = MediaQuery.sizeOf(context);
    final double itemSize =
        (MediaQuery.sizeOf(context).width - 24 - (bloc.storiesCount - 1) * 4) /
            bloc.storiesCount;

    Future<void> openUrl(String url) async {
      final Uri uri = Uri.parse(url);

      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    }

    return BlocListener<StoryCubit, StoryState>(
      listener: (context, state) {
        if (state is EndOfStories) exit();
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: bloc.changeStory,
            child: SafeArea(
              child: BlocBuilder<StoryCubit, StoryState>(
                builder: (context, state) {
                  return Container(
                    width: size.width,
                    height: size.height,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(bloc
                                .storiesList[bloc.currentStoryIndex].imageUrl),
                            fit: BoxFit.cover)),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: InkWell(
                              onTap: exit,
                              child: Ink(
                                child: SvgPicture.asset(
                                  'assets/icons/cross_rounded.svg',
                                  color: Colors.white,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 64),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Espresso is here!',
                                  style: AppFonts.font24w700,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Get ready spro bros - its time to brew the espresso you dream about.',
                                  style: AppFonts.font14w400,
                                ),
                                if (bloc.storiesList[bloc.currentStoryIndex]
                                        .buttonUrl !=
                                    null) ...[
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomButton(
                                      text: 'Читать',
                                      onTap: () {
                                        openUrl(bloc
                                            .storiesList[bloc.currentStoryIndex]
                                            .buttonUrl!);
                                      },
                                      width: double.infinity)
                                ]
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SafeArea(
            child: BlocBuilder<StoryCubit, StoryState>(builder: (context, state) {
              int i = 0;
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: bloc.storiesList.map((e) {
                      i++;
                      return StoryDurationIndicator(
                          width: itemSize, duration: e.duration, index: i - 1);
                    }).toList()),
              );
            }),
          ),
        ],
      ),
    );
  }
}
