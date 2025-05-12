import 'package:flutter/material.dart';
import 'package:tilmaame/architecture/routes/route_helper.dart';
import 'package:tilmaame/architecture/routes/routes.dart';
import 'package:tilmaame/model/key_value_pair.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';
import 'package:tilmaame/model/key_value_pair.dart';

class ListItemFormField extends StatelessWidget {
  final String label;
  final String screenLabel;
  final TextEditingController controller;
  final TextEditingController? subController;
  final bool isRequired;
  final bool isVisible;
  final List<KeyValuePair> list;
  final IconData? icon;
  final bool? showSubtitle;
  final bool? isSubController;
  final Function? onSelect;

  ListItemFormField({
    required this.label,
    required this.screenLabel,
    required this.controller,
    this.isSubController = false,
    this.subController,
    this.isRequired = true,
    this.isVisible = true,
    required this.list,
    this.icon,
    this.showSubtitle = true,
    this.onSelect,
  });

  _onFieldTap(BuildContext context) async {
    dynamic value = await Navigator.of(context).pushNamed(
      Routes.listScreen,
      arguments: RouteHelper(
        title: screenLabel,
        icon: icon,
      ),
    );

    if (value == null) return;
    dynamic data = value as Map<String, String>;
    controller.text = data.entries.first.value;
    if (isSubController!) subController!.text = data.entries.last.value;
    if (onSelect != null) onSelect!(data.entries.first.value);
  }

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeManager.radius)),
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down_circle_sharp),
                    onPressed: () => _onFieldTap(context),
                  ),
                ),
                controller: controller,
                readOnly: true,
                validator: (String? value) {
                  if (isRequired && (value!.isEmpty || value.trim().isEmpty)) {
                    return '$label is required';
                  }
                  return null;
                },
              ),
              Space(),
            ],
          )
        : Container();
  }
}
