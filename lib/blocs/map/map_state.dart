part of 'map_bloc.dart';

class MapState extends Equatable {

  final bool isMapInitialized;
  final bool isFollowinUser;
  final bool showMyRoute;

  //Polylines
  final Map<String, Polyline> polylines;

  const MapState({
    this.isMapInitialized = false, 
    this.isFollowinUser = false,
    this.showMyRoute = false,
    Map<String, Polyline>? polylines
  }): polylines = polylines ?? const {}; 

  MapState copyWith({
    bool? isMapInitialized, 
    bool? isFollowinUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines
  }) 
  => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized ,
    isFollowinUser: isFollowinUser ?? this.isFollowinUser,
    showMyRoute: showMyRoute ?? this.showMyRoute,
    polylines: polylines ?? this.polylines
  );
  
  @override
  List<Object> get props => [ isMapInitialized, isFollowinUser, polylines, showMyRoute ];
}
