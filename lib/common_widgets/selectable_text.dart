import 'package:flutter/material.dart';

class SelectableTextCustomStyle extends StatelessWidget {
  const SelectableTextCustomStyle({
    required this.text,
    required this.style,
    super.key,
    this.overflow,
    this.onclick,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.softWrap = false,
    this.padding = EdgeInsets.zero,
  });
  final String text;
  final TextAlign textAlign;
  final TextStyle? style;
  final int? maxLines;

  final TextOverflow? overflow;
  final bool softWrap;
  final VoidCallback? onclick;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        mouseCursor: onclick == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
        onTap: onclick,
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: style,
          softWrap: softWrap,
        ),
      ),
    );
  }
}
