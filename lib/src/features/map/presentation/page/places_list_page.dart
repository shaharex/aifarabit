import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jihc_hack/src/features/map/presentation/bloc/place_bloc/places_bloc.dart';

class PlacesListPage extends StatefulWidget {
  const PlacesListPage({super.key});

  @override
  State<PlacesListPage> createState() => _PlacesListPageState();
}

class _PlacesListPageState extends State<PlacesListPage> {
  @override
  void initState() {
    super.initState();
    GetIt.instance.get<PlacesBloc>().add(PlacesEvent.getPlaces());
    // GetIt.read<PlacesBloc>().add(PlacesEvent.getPlaces());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Places')),
      body: BlocBuilder<PlacesBloc, PlacesState>(
        bloc: GetIt.instance.get<PlacesBloc>(),
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text('loading...')),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (viewModel) {
              print('Loaded state triggered! Data: ${viewModel.cartItems}');
              return ListView.builder(
                itemCount: viewModel.cartItems!.length,
                itemBuilder: (context, index) {
                  final place = viewModel.cartItems![index];
                  return ListTile(
                    title: Text(place.placeName),
                    subtitle: Text('Rating: ${place.rating}'),
                  );
                },
              );
            },

            loadingFaliure: () => Center(child: Text('error')),
          );
        },
      ),
    );
  }
}
