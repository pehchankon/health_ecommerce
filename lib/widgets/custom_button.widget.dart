import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum ButtonTapBehaviour { action, transition }

enum ButtonSize { small, medium, large }

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.buttonTapBehaviour = ButtonTapBehaviour.action,
    this.isFilled = true,
    required this.text,
    required this.onTap,
    this.loadingText,
    this.finishedText,
    this.isOneTimeAction = false,
    this.buttonSize = ButtonSize.small,
    this.isDisabled = false,
    this.isFinished,
  });

  final ButtonTapBehaviour buttonTapBehaviour;
  final bool isFilled;
  final String text;
  final Function onTap;
  final bool isOneTimeAction;
  final String? loadingText;
  final String? finishedText;
  final ButtonSize buttonSize;
  final bool isDisabled;
  final bool? isFinished;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  bool isFinished = false;

  _onTap() async {
    if (isFinished || widget.isDisabled) return;
    if (widget.buttonTapBehaviour == ButtonTapBehaviour.action) {
      setState(() => isLoading = true);
    }
    await widget.onTap();
    if (widget.buttonTapBehaviour == ButtonTapBehaviour.action) {
      setState(() => isLoading = false);
    }
    if (widget.isOneTimeAction) {
      setState(() => isFinished = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color buttonColor;
    late final double padding;
    late final TextStyle textStyle;
    late final double borderRadius;

    isFinished = widget.isFinished ?? isFinished;

    if (widget.isDisabled) {
      text = widget.text;
      buttonColor = AppColors.lighGreyColor;
    } else if (isFinished) {
      text = widget.finishedText ?? widget.text;
      buttonColor = AppColors.secondaryCyanColor;
    } else if (isLoading) {
      text = widget.loadingText ?? widget.text;
      buttonColor = AppColors.lighGreyColor;
    } else {
      text = widget.text;
      buttonColor = AppColors.primaryPurpleColor;
    }

    if (widget.buttonSize == ButtonSize.small) {
      textStyle = widget.isFilled
          ? AppTextStyles.primaryWhiteBoldText8
          : AppTextStyles.primaryPurpleMediumText8;
      padding = 5.sp;
      borderRadius = 5;
    } else if (widget.buttonSize == ButtonSize.medium) {
      textStyle = widget.isFilled
          ? AppTextStyles.primaryWhiteBoldText12
          : AppTextStyles.primaryPurpleMediumText12;
      padding = 8.sp;
      borderRadius = 5;
    } else if (widget.buttonSize == ButtonSize.large) {
      textStyle = widget.isFilled
          ? AppTextStyles.primaryWhiteBoldText14
          : AppTextStyles.primaryPurpleMediumText14;
      padding = 14.sp;
      borderRadius = 10;
    }

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: widget.isFilled ? buttonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color:
                widget.isFilled ? buttonColor : AppColors.primaryPurpleColor,
            width: 0.5.sp,
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
