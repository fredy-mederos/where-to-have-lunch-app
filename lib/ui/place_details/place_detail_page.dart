import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/state_with_viewmodel.dart';
import 'package:where_to_have_lunch/ui/place_details/place_details_viewmodel.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_page.dart';
import 'package:where_to_have_lunch/utils/navigation_utils.dart';

class PlaceDetailPage extends StatefulWidget {
  final Place place;

  const PlaceDetailPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends StateWithViewModel<PlaceDetailPage, PlaceDetailsViewModel> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: widget.place.color.textColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(MdiIcons.pencil),
            onPressed: navigateToSavePlacePage,
          ),
          IconButton(
            icon: Icon(MdiIcons.trashCan),
            onPressed: deletePlace,
          ),
        ],
      ),
      backgroundColor: widget.place.color.color,
      body: getBody(),
    );
  }

  void navigateToSavePlacePage() async {
    final place = await NavigatorUtils.push(
      context,
      SavePlacePage(place: widget.place),
    );
    if (place != null) {
      setState(() {
        widget.place.updateFromPlace(place: place);
      });
    }
  }

  void deletePlace() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Text(R.string.deletePlaceConfirmation),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () async {
              await viewModel.deleteItem(place: widget.place);
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget getBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.place.name,
              style: TextStyle(
                fontSize: 40,
                color: widget.place.color.textColor,
              ),
            ),
            Text(
              widget.place.description,
              style: TextStyle(
                fontSize: 14,
                color: widget.place.color.textColor,
              ),
            ),
          ],
        ),
      );
}
