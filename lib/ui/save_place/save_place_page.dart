import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/di/state_with_bloc.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';
import 'package:where_to_have_lunch/ui/save_place/color_chooser_widget.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_bloc.dart';
import 'package:where_to_have_lunch/utils/validators.dart';

class SavePlacePage extends StatefulWidget {
  final Place? place;

  const SavePlacePage({Key? key, this.place}) : super(key: key);

  @override
  _SavePlacePageState createState() => _SavePlacePageState();
}

class _SavePlacePageState extends StateWithBloC<SavePlacePage, SavePlaceState, SavePlaceBloC> {
  TextEditingController? nameFieldController;
  TextEditingController? descriptionFieldController;
  final formKey = GlobalKey<FormState>();
  late SelectedColorController selectedColorController;

  void initControllers() {
    selectedColorController = SelectedColorController(
      selectedColor: widget.place?.color,
    );
    nameFieldController = TextEditingController(text: widget.place?.name ?? "");
    descriptionFieldController = TextEditingController(text: widget.place?.description ?? "");
  }

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    nameFieldController?.dispose();
    descriptionFieldController?.dispose();
  }

  @override
  onNewState(BuildContext context, SavePlaceState state) {
    if (state.status == SaveStatus.FINISHED && state.currentPlace != null) {
      Navigator.pop(context, state.currentPlace);
    }
  }

  @override
  Widget buildWidget(BuildContext context, SavePlaceState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
          child: PageBackgroundWidget(
            iconRes: MdiIcons.silverwareVariant,
            rotateAngle: 0,
            child: body(state),
          ),
        ),
      ),
    );
  }

  Widget body(SavePlaceState state) => Column(
        children: [
          Text(
            widget.place == null ? R.string.addPlace : R.string.editPlace,
            style: TextStyle(fontSize: 40),
          ),
          Container(
            height: 30,
          ),
          Card(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameFieldController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: R.string.placeName,
                      ),
                      validator: validatorRequired,
                    ),
                    TextFormField(
                      controller: descriptionFieldController,
                      minLines: 2,
                      maxLines: 5,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: R.string.description,
                      ),
                    ),
                    Container(height: 10),
                    ColorChooserWidget(
                      colors: state.colors,
                      selectedColorController: selectedColorController,
                    ),
                    Container(height: 10),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        saveButton(state),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );

  Widget saveButton(SavePlaceState state) {
    final isLoading = state.loading;
    return isLoading
        ? CircularProgressIndicator()
        : RaisedButton.icon(
            icon: Icon(Icons.save),
            label: Text(R.string.save),
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                bloC.addPlace(
                  id: widget.place?.id,
                  name: nameFieldController?.text ?? "",
                  description: descriptionFieldController?.text ?? "",
                  placeColor: selectedColorController.selectedColor,
                );
              }
            },
          );
  }
}
