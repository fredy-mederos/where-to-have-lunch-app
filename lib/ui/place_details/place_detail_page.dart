import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_bloc.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_page.dart';

class PlaceDetailPage extends StatefulWidget {
  final Place place;

  const PlaceDetailPage({
    Key key,
    @required this.place,
  }) : super(key: key);

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  @override
  Widget build(BuildContext context) {
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

  void navigateToSavePlacePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavePlacePage(
          place: widget.place,
        ),
      ),
    );
  }

  void deletePlace() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Do you want to delete this place?"),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget getBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Text(
              widget.place.name,
              style:
                  TextStyle(fontSize: 40, color: widget.place.color.textColor),
            ),
            Text(
              widget.place.description,
              style:
                  TextStyle(fontSize: 14, color: widget.place.color.textColor),
            ),
          ],
        ),
      );
}
