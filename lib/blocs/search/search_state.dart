part of 'search_bloc.dart';

class SearchState extends Equatable {

  final bool displayManualMarker;
  final List<Feature> places;
  final List<Feature> history;

  const SearchState({
    this.displayManualMarker = false,
    this.places = const [],
    this.history = const []
  });

  SearchState copyWith({
    List<Feature>? places,
    List<Feature>? history,
    bool? displayManualMarker
  })
  => SearchState(
    places: places ?? this.places,
    history: history ?? this.history,
    displayManualMarker: displayManualMarker ?? this.displayManualMarker
  );
  
  @override
  List<Object> get props => [ displayManualMarker, places, history ];
}

