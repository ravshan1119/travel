import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel/src/config/themes/get_theme.dart';
import 'package:travel/src/utils/resources/app_colors.dart';
class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? prefixIcon;
  final String caption;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final TextInputFormatter? maskFormatter;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final int? maxLength;
  final TextCapitalization textCapitalization;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.caption = "",
    this.suffixIcon,
    this.readOnly = false,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.maskFormatter,
    this.obscureText,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  late TextEditingController _internalController;
  final internalFocusNode = FocusNode();
  Color color = const Color(0xFFFAFAFA);

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) {
        widget.onChanged!(value);
      },
      obscuringCharacter: '●',
      readOnly: widget.readOnly,
      controller: _internalController,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode ?? internalFocusNode,
      inputFormatters: widget.maskFormatter != null ? [widget.maskFormatter!] : [],
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        counterText: '',
        hintStyle: const TextStyle(
          fontFamily: "Urbanist",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff9e9e9e),
          height: 20 / 14,
        ),
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: getTheme(context) ? AppColors.dark3 : const Color(0xFFFAFAFA)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: getTheme(context) ? const Color(0xFFFAFAFA) : AppColors.dark2),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: getTheme(context)
            ? (widget.focusNode?.hasFocus ?? internalFocusNode.hasFocus)
                ? AppColors.yellowTransparent
                : AppColors.yellowTransparent
            : (widget.focusNode?.hasFocus ?? internalFocusNode.hasFocus)
                ? AppColors.dark3
                : AppColors.dark3,
        filled: true,
      ),
      style: const TextStyle(color: AppColors.dark1, fontSize: 16),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }
}
