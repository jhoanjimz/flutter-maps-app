part of 'map_bloc.dart';

class MapState extends Equatable {

  final bool isMapInitialized;
  final bool isFollowinUser;
  final bool showMyRoute;

  //Polylines
  final Map<String, Polyline> polylines;
  //Markers
  final Map<String, Marker> markers;

  const MapState({
    this.isMapInitialized = false, 
    this.isFollowinUser = false,
    this.showMyRoute = false,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
  })
  : polylines = polylines ?? const {}, 
    markers = markers ?? const {}; 

  MapState copyWith({
    bool? isMapInitialized, 
    bool? isFollowinUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
  }) 
  => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized ,
    isFollowinUser: isFollowinUser ?? this.isFollowinUser,
    showMyRoute: showMyRoute ?? this.showMyRoute,
    polylines: polylines ?? this.polylines,
    markers: markers ?? this.markers,
  );
  
  @override
  List<Object> get props => [ isMapInitialized, isFollowinUser, polylines, showMyRoute, markers ];
}
