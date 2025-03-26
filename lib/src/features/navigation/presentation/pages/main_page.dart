import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';
import 'package:jihc_hack/src/features/navigation/presentation/bloc/tourism_bloc.dart';
import 'package:jihc_hack/src/features/navigation/presentation/widgets/info_list_tile.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<TourismBloc>().add(
          GetTourismData(
              country: 'France',
              city: 'Lyon',
              preferences:
                  'history, adventure, educational, museums, old vibes'),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: Image.asset(
          'assets/logo.png',
          width: 70,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<TourismBloc, TourismState>(
            builder: (context, state) {
              return state.maybeWhen(
                initial: () => Text("hello brothe"),
                loading: () => Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.iconsColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.grey,
                    ),
                  ),
                ),
                success: (data) => _buildPlacesList(data),
                failure: (message) => Text(message),
                orElse: () {
                  return Text('lkjfdljfkdfjlkd');
                },
              );
            },
          ),
        ),
      ),
    );
  }

  _buildPlacesList(TourismData data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.city,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              Icons.arrow_forward_sharp,
              color: AppColors.iconsColor,
              size: 28,
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.attractions.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              final place = data.attractions[index];
              return InfoListTile(
                placeName: place.name,
                placeDescription: place.desc,
                placeDestination: place.type,
                placeIcon: Icons.golf_course,
                latLng: LatLng(data.latitude, data.longitude),
              );
            },
          ),
        ),
      ],
    );
  }
}
