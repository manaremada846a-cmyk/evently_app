import 'package:flutter/material.dart';

class CustomLoginTextFiled extends StatefulWidget {
  const CustomLoginTextFiled({
    super.key,
    required this.context,
    this.label,
    this.prefix,
    this.isPassword = false, this.validator,
  });

  final BuildContext context;
  final String? label;
  final Widget? prefix;
  final bool isPassword;
final String? Function(String?)? validator;
  @override
  State<CustomLoginTextFiled> createState() => _CustomLoginTextFiledState();
}

class _CustomLoginTextFiledState extends State<CustomLoginTextFiled> {
  late bool isPasswordEnable;

  @override
  void initState() {
    super.initState();
    isPasswordEnable = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: widget.validator,
      obscureText: isPasswordEnable,
      decoration: InputDecoration(
        enabledBorder: _buildBorderInput(),
        focusedBorder: _buildBorderInput(),
        errorBorder: _buildBorderInput(),

        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),

        prefixIcon: widget.prefix,

        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordEnable = !isPasswordEnable;
                  });
                },
                icon: isPasswordEnable
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: Theme.of(context).hintColor,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: Theme.of(context).hintColor,
                      ),
              )
            : null,

        filled: true,
        fillColor: Theme.of(widget.context).cardColor,
      ),
    );
  }

  InputBorder _buildBorderInput() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      borderSide: BorderSide(color: Theme.of(widget.context).focusColor),
    );
  }
}
