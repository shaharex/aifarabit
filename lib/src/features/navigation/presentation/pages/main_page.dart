import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/hive/hive_serv.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';
import 'package:jihc_hack/src/features/navigation/presentation/bloc/tourism_bloc.dart';
import 'package:jihc_hack/src/features/navigation/presentation/widgets/headline_widget.dart';
import 'package:jihc_hack/src/features/navigation/presentation/widgets/widgets.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  void initState() {
    super.initState();
    getCity();
  }

  getCity() async {
    String city = await HiveService.getCity() ?? '';
    List<String?> prefs = await HiveService.getPrefs();
    String country = await HiveService.getCountry() ?? 'no data';
    print("this is country: $country");

    context.read<TourismBloc>().add(GetTourismData(
        country: country, city: city, preferences: prefs.join(', ')));
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
          child: _buildBloc(),
        ),
      ),
    );
  }

  BlocBuilder<TourismBloc, TourismState> _buildBloc() {
    return BlocBuilder<TourismBloc, TourismState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => Container(),
          loading: () => Container(
            height: MediaQuery.of(context).size.height - 150,
            width: double.infinity,
            alignment: Alignment.center,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.iconsColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.grey,
              ),
            ),
          ),
          success: (data, country, preferences) => DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: HeadLineWidget(
                        text: 'NEW JOURNEY',
                        btnText: 'Start',
                        onTap: () {},
                        imagePath: 'assets/hotel_2.jpg',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: HeadLineWidget(
                        icon: Icons.location_on,
                        text: '${data.city} $country',
                        btnText: 'Edit',
                        onTap: () {},
                        imagePath: 'assets/restaurant.jpg',
                      ),
                    ),
                  ],
                ),
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: "History"),
                    Tab(text: "Attractions"),
                    Tab(text: "To eat"),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        itemCount: data.attractions.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          final attraction = data.attractions[index];
                          return AttractionsListTile(
                            attraction: attraction,
                          );
                        },
                      ),
                      ListView.separated(
                        itemCount: data.attractions.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          final attraction = data.attractions[index];
                          return AttractionsListTile(
                            attraction: attraction,
                          );
                        },
                      ),
                      ListView.separated(
                        itemCount: data.attractions.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          final attraction = data.attractions[index];
                          return AttractionsListTile(
                            attraction: attraction,
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          failure: (message) => Text(message),
          orElse: () {
            return Text('Something went wrong. Try again later');
          },
        );
      },
    );
  }

  _buildAttractionList(List<Attraction> data) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (context, index) {
        return const SizedBox(width: 20);
      },
      itemBuilder: (context, index) {
        final attraction = data[index];
        return AttractionsListTile(
          attraction: attraction,
        );
      },
    );
  }

  _buildHotelsList(List<Hotel> data) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              final hotel = data[index];
              return HotelListTile(
                hotel: hotel,
              );
            },
          ),
        ),
      ],
    );
  }

  _buildRestaurantsList(List<Restaurant> data) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              final restaurant = data[index];
              return RestaurantsListTile(restaurant: restaurant);
            },
          ),
        ),
      ],
    );
  }
}
