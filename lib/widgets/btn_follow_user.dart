import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon( 
                state.isFollowinUser ? Icons.directions_run_outlined : Icons.hail_outlined, 
                color: Colors.black
              ),
              onPressed: () {
                mapBloc.add(OnStartFollowingUserEvent());
              },
            );
          },
        ),
      ),
    );
  }
}
