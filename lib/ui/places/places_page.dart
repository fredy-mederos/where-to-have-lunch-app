import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/di/state_with_bloc.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';
import 'package:where_to_have_lunch/ui/place_details/place_detail_page.dart';
import 'package:where_to_have_lunch/ui/places/item_place.dart';
import 'package:where_to_have_lunch/ui/places/places_bloc.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_page.dart';
import 'package:where_to_have_lunch/utils/navigation_utils.dart';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends StateWithBloC<PlacesPage, PlacesPageState, PlacesBloC> {

  @override
  onNewState(BuildContext context, PlacesPageState state) {
    if (state.error != null)
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(state.error!),
      ));
  }

  @override
  Widget buildWidget(BuildContext context, PlacesPageState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton.icon(
            onPressed: addPlace,
            icon: Icon(MdiIcons.plus),
            label: Text(R.string.addAPlace),
          ),
        ],
      ),
      body: PageBackgroundWidget(
        iconRes: MdiIcons.silverwareVariant,
        rotateAngle: 0,
        child: body(state.places),
      ),
    );
  }

  Widget body(List<Place> places) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              R.string.yourPlaces,
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(child: placesList(places)),
          if (places.isEmpty) bottomSection(),
        ],
      );

  Widget placesList(List<Place> places) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: R.isSmallWidthSize(context) ? 3 : 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: places.length,
            itemBuilder: (context, index) {
              final item = places[index];
              return ItemPlace(
                place: item,
                onTap: () => navigateToPlace(item),
              );
            }),
      );

  Widget bottomSection() => Column(
        children: [
          IconButtonWidget(
            iconData: MdiIcons.plus,
            label: R.string.addAPlace,
            onPressed: addPlace,
          ),
          Container(height: 40),
        ],
      );

  void navigateToPlace(Place place) {
    NavigatorUtils.push(context, PlaceDetailPage(place: place));
  }

  void addPlace() {
    NavigatorUtils.push(context, SavePlacePage());
  }
}
