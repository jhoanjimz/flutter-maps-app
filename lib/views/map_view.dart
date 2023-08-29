import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/map/map_bloc.dart';

class MapView extends StatelessWidget {

  final LatLng initialLocation;
  final Set<Polyline> polylines;

  const MapView({
    super.key, 
    required this.initialLocation, 
    required this.polylines
  });

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);

    CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15
    );

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (_) => mapBloc.add(OnStopFollowingUserEvent()),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          polylines: polylines,
          onMapCreated: ( controller ) => mapBloc.add(OnMapInitializedEvent(controller)),
          onCameraMove: ( position ) => mapBloc.mapCenter = position.target,
        ),
      ),
    );
  }
}