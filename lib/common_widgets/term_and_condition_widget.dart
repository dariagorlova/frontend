import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Center(
        child: Theme(
          data: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: GymismoColors.white,
              selectionColor: GymismoColors.lightSkyBlue.withOpacity(0.4),
              selectionHandleColor: GymismoColors.lightSkyBlue,
            ),
          ),
          child: SelectableText.rich(
            _getTextSpan(context: context, cursor: SystemMouseCursors.click),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(bottom: GymismoStyles.spacingExtraLarge),
      child: RichText(
        textAlign: TextAlign.center,
        text: _getTextSpan(context: context),
      ),
    );
  }

  TextSpan _getTextSpan({required BuildContext context, MouseCursor? cursor}) {
    const style = kIsWeb ? GymismoStyles.tsSilverArchivo12 : GymismoStyles.tsGreyTextArchivo10;
    final underlinedStyle = style.copyWith(decoration: TextDecoration.underline);

    return TextSpan(
      text: 'By tapping Log In, you agree to our ',
      style: style,
      children: [
        TextSpan(
          text: 'Terms. \n',
          mouseCursor: cursor,
          recognizer: TapGestureRecognizer()..onTap = _onTermsTap(context),
          style: underlinedStyle,
        ),
        const TextSpan(
          text: 'Learn how we process your data in our ',
          style: style,
        ),
        TextSpan(
          text: 'Privacy Policy',
          mouseCursor: SystemMouseCursors.click,
          recognizer: TapGestureRecognizer()..onTap = _onPrivacyPolicyTap(context),
          style: underlinedStyle,
        ),
        if (kIsWeb) ...[
          const TextSpan(text: '  and  ', style: GymismoStyles.tsSilverArchivo12),
          TextSpan(
            text: 'Cookies Policy',
            mouseCursor: cursor,
            recognizer: TapGestureRecognizer()..onTap = _onCookiesTap(context),
            style: underlinedStyle,
          )
        ],
        const TextSpan(
          text: '.',
          style: style,
        ),
      ],
    );
  }

  VoidCallback _onTermsTap(BuildContext context) => () {
        // if (kIsWeb) {
        //   Navigator.of(context).pushNamed(profileInfoTermsRoute);
        // } else {
        //   final model = GlobalVariables.objSetting?.generalSetting
        //       ?.where(
        //         (element) => element.type == InfoScreenType.termConditions,
        //       )
        //       .first;
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute<void>(
        //       builder: (context) => ProfileInfoScreen(
        //         title: model?.title ?? '',
        //         description: model?.description ?? '',
        //       ),
        //     ),
        //   );
        // }
      };

  VoidCallback _onPrivacyPolicyTap(BuildContext context) => () {
        // if (kIsWeb) {
        //   Navigator.of(context).pushNamed(profileInfoPrivacyRoute);
        // } else {
        //   final model = GlobalVariables.objSetting?.generalSetting
        //       ?.where(
        //         (element) => element.type == InfoScreenType.privacyPolicy,
        //       )
        //       .first;
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute<void>(
        //       builder: (context) => ProfileInfoScreen(
        //         title: model?.title ?? '',
        //         description: model?.description ?? '',
        //       ),
        //     ),
        //   );
        // }
      };

  VoidCallback _onCookiesTap(BuildContext context) => () {
        // Navigator.of(context).pushNamed(profileInfoCookiesPolicyRoute);
      };
}
