import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CustomFormField extends StatefulWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final bool iconVisibility;
  final ValueChanged<String>?
      onChanged; // Menggunakan ValueChanged untuk onChanged
  final Function(String)? onFieldSubmitted;

  const CustomFormField({
    super.key,
    required this.title,
    this.obsecureText = false,
    this.controller,
    this.isShowTitle = true,
    this.iconVisibility = false,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obsecureText;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowTitle)
          Text(
            widget.title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (widget.isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          obscureText: _obsecureText,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: !widget.isShowTitle ? widget.title : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12),
              suffixIcon: widget.iconVisibility
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      },
                      icon: Icon(
                        _obsecureText ? Icons.visibility_off : Icons.visibility,
                        color: greyColor,
                      ),
                    )
                  : null),
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ],
    );
  }
}
