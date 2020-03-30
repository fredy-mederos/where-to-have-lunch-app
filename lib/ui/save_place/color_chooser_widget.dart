import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';

class ColorChooserWidget extends StatefulWidget {
  final List<PlaceColor> colors;
  final SelectedColorController selectedColorController;

  const ColorChooserWidget({
    Key key,
    @required this.colors,
    @required this.selectedColorController,
  }) : super(key: key);

  @override
  _ColorChooserWidgetState createState() => _ColorChooserWidgetState();
}

class _ColorChooserWidgetState extends State<ColorChooserWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getItemWidgets(),
    );
  }

  List<Widget> getItemWidgets() => widget.colors
      .map(
        (placeColor) => ColorItemWidget(
          placeColor: placeColor,
          selected: widget.selectedColorController.selectedColor?.id == placeColor.id,
          onTap: () {
            setState(() {
              widget.selectedColorController.selectedColor = placeColor;
            });
          },
        ),
      )
      .toList();
}

class ColorItemWidget extends StatelessWidget {
  final PlaceColor placeColor;
  final bool selected;
  final Function onTap;

  const ColorItemWidget({
    Key key,
    @required this.placeColor,
    this.selected = false,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 48,
          width: 70,
          decoration: BoxDecoration(
            color: placeColor.color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                offset: Offset(selected ? 4 : 0, selected ? 4 : 0),
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade700,
              width: 0.5,
            ),
          ),
          child: Center(
            child: Text(
              placeColor.name,
              style: TextStyle(
                fontSize: 12,
                color: placeColor.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedColorController {
  PlaceColor selectedColor;

  SelectedColorController({
    @required this.selectedColor,
  });
}
