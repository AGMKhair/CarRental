import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';
import 'package:tilmaame/resourse/util/business_dictionary.dart';
import 'package:tilmaame/resourse/util/regx_constant.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final int length;
  final bool isVisible;
  final String error ;

  const PasswordFormField({
    Key? key,
    required this.controller,
    this.label = StringDictionary.PIN,
    this.length = BusinessDictionary.MAX_LENGTH,
    this.isVisible = true,
    this.error = ''
  }) : super(key: key);

  @override
  _PasswordFormFieldState createState() => new _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscureText = true;

  String star = '';
  String displayStar = '';
  int inc = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isEmpty && star.isNotEmpty) {
      star = '';
      inc = 0;
    }
    return widget.isVisible
        ? Column(
            children: <Widget>[
              Stack(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      obscuringCharacter: '●',
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        displayText(value);
                      },
                      decoration: InputDecoration(
                        labelText: widget.label,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeManager.BOX_RADIUS)),
                        prefixIcon: Icon(Icons.lock_outlined),
                        errorText: widget.error.isEmpty ? null : widget.error,

                        suffixIcon: IconButton(
                          icon: Semantics(
                            label: _isObscureText ? 'Show Password' : 'Hide Password',
                            child: Icon(_isObscureText ? Icons.visibility : Icons.visibility_off),
                          ),
                          onPressed: () => setState(() => _isObscureText = !_isObscureText),
                        ),
                        counterText: '',
                      ),
                      controller: widget.controller,
                      obscureText: getObscure(_isObscureText),
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9@#\$%^&*()_+!]+$')),

                        // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
                      ],
                      maxLength: widget.length,
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < widget.length) {
                          return 'Pin must be ${widget.length} digit';
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(top: 20, left: 50, child: Text(displayStar)),
                ],
              ),
              Space(),
            ],
          )
        : Container();
  }

  displayText(String controller) {
    if ((controller.length == 0 && inc == 0) || (controller.length == widget.length && inc == widget.length)) return;

    if (controller.length > 0 && controller.length > inc) {
      star = star + '●';
      inc++;
    } else if (controller.length < BusinessDictionary.MAX_LENGTH && controller.length < inc) {
      star = star.replaceFirst('●', '');
      inc--;
    }

    setState(() {
      if (_isObscureText) {
        displayStar = star;
      } else {
        displayStar = widget.controller.text;
      }
    });

    return controller;
  }

  getObscure(bool isObscureText) {
    setState(() => displayStar = isObscureText ? star : widget.controller.text);
    return isObscureText;
  }

}
