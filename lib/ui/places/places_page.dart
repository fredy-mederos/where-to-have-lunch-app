import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_state.dart';
import 'package:where_to_have_lunch/ui/base/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/on_init_widget.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';
import 'package:where_to_have_lunch/ui/place_details/place_detail_page.dart';
import 'package:where_to_have_lunch/ui/places/item_place.dart';
import 'package:where_to_have_lunch/ui/places/places_bloc.dart';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends StateWithBloC<PlacesPage, PlacesBloC> {
  @override
  void initState() {
    super.initState();
    bloc.loadPlaces();
  }

  void registerErrorStream(BuildContext cntx) {
    bloc.errorMessageStream.listen((error) {
      if (error != null)
        Scaffold.of(cntx).showSnackBar(SnackBar(
          content: Text(error),
        ));
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton.icon(onPressed: addPlace, icon: Icon(MdiIcons.plus), label: Text(R.string.addAPlace)),
        ],
      ),
      body: OnInitWidget(
        onInit: registerErrorStream,
        child: PageBackgroundWidget(
          iconRes: MdiIcons.silverwareVariant,
          rotateAngle: 0,
          child: body(),
        ),
      ),
    );
  }

  Widget body() => StreamBuilder<List<Place>>(
      initialData: [],
      stream: bloc.placesStream,
      builder: (context, snapshot) {
        final places = snapshot.data ?? [];
        return Column(
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
      });

  Widget placesList(List<Place> places) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailPage(
          place: place,
        ),
      ),
    );
  }

  void addPlace() {
    Navigator.pushNamed(context, AppRoutes.ADD_PLACE);
  }
}
