


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/widgets/social_links.dart';
import 'package:my_portfolio/src/animations/entrance_fader.dart';
import 'package:my_portfolio/src/config/app_dimensions.dart';
import 'package:my_portfolio/src/config/space.dart';
import 'package:my_portfolio/src/config/typography.dart';
import 'package:my_portfolio/src/helper/helper.dart';
import 'package:my_portfolio/src/utils/assets_manager.dart';
import 'package:my_portfolio/src/utils/color_manager.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.95,
      padding: Space.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: AppDimensions.normalize(30)),
            child: const Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: Offset(0, 0),
                delay: Duration(seconds: 1),
                duration: Duration(milliseconds: 800),
                child: CircleAvatar(
                  radius: 140,
                  backgroundColor: ColorManager.primaryColor,
                  backgroundImage: AssetImage(AssetsManager.logo),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(AppDimensions.normalize(40), AppDimensions.normalize(20), AppDimensions.normalize(10), 0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME TO MY PORTFOLIO! ',
                  style: AppText.b1!.copyWith(
                    fontFamily: 'Montserrat',
                  ),
                ),
                Space.y1!,
                Text(
                  "ZAIN  ",
                  style: AppText.h1b!.copyWith(
                      fontSize: AppDimensions.normalize(15),
                      height: 1,
                      color: ColorManager.whiteColor
                  ),
                ),
                Text(
                  "ULLAH",
                  style: AppText.h1b!.copyWith(
                      fontSize: AppDimensions.normalize(15),
                      height: 1,
                      color: ColorManager.whiteColor
                  ),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: ColorManager.secondaryColor,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [

                          TyperAnimatedText(
                            ' iOS Developer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' Web Developer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' UI/UX Enthusiast',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' Android Developer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
                Space.y1!,
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: ColorManager.whiteColor, size: 30),
                    buildSpaceHorizontal(15),
                    Text(
                      "Islamabad,\nPakistan",
                      style: AppText.b1!.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
                Space.y1!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
