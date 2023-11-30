import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/textStyles.dart';
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

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  bool isFinished = false;

  _onTap() async {
    if (isFinished) return;
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
    late final String _text;
    late final Color _buttonColor;
    late final double _padding;
    late final TextStyle _textStyle;

    if (widget.isDisabled) {
      _text = widget.text;
      _buttonColor = AppColors.lighGreyColor;
    } else if (isFinished) {
      _text = widget.finishedText ?? widget.text;
      _buttonColor = AppColors.secondaryCyanColor;
    } else if (isLoading) {
      _text = widget.loadingText ?? widget.text;
      _buttonColor = AppColors.lighGreyColor;
    } else {
      _text = widget.text;
      _buttonColor = AppColors.primaryPurpleColor;
    }

    if (widget.buttonSize == ButtonSize.small) {
      _textStyle = widget.isFilled
          ? AppTextStyles.primaryWhiteBoldText8
          : AppTextStyles.primaryPurpleMediumText8;
      _padding = 5.sp;
    } else if (widget.buttonSize == ButtonSize.medium) {
      _textStyle = widget.isFilled
          ? AppTextStyles.primaryWhiteBoldText12
          : AppTextStyles.primaryPurpleMediumText12;
      _padding = 8.sp;
    } else if (widget.buttonSize == ButtonSize.large) {
      _textStyle = widget.isFilled
          ? AppTextStyles.primaryWhiteBoldText14
          : AppTextStyles.primaryPurpleMediumText14;
      _padding = 14.sp;
    }

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          color: widget.isFilled ? _buttonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color:
                widget.isFilled ? _buttonColor : AppColors.primaryPurpleColor,
            width: 0.5.sp,
          ),
        ),
        child: Text(
          _text,
          style: _textStyle,
        ),
      ),
    );
  }
}
