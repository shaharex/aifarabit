import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/features/navigation/presentation/bloc/tourism_bloc.dart';

class CityInfoPage extends StatefulWidget {
  const CityInfoPage({
    super.key,
    // required this.city,
    // required this.country,
    // required this.preferences,
  });
  // final String city;
  // final String country;
  // final String preferences;

  @override
  State<CityInfoPage> createState() => _CityInfoPageState();
}



class _CityInfoPageState extends State<CityInfoPage> {
  Map<String, dynamic>? cityData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: GestureDetector(
        onTap: () {
          context.read<TourismBloc>().add(GetTourismData(country: 'France', city: 'Lyon', preferences: 'history, adventure, educational, museums, old vibes'));
        },
        child: Text('where is tourism data'),)),
      body: BlocBuilder<TourismBloc, TourismState>(builder: (context, state) {
        return state.when(
          initial: () => Text('Init State botrthe'),
          loading: () =>  Center(child: CircularProgressIndicator()),
          success: (tourismData) => Text('This is tourism data: $tourismData'),
          failure: (message) => Text('this is error: $message'),
        );
      }),
    );
  }
}
