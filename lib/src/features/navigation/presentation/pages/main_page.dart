import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/hive/hive_serv.dart';
import 'package:jihc_hack/src/features/navigation/presentation/bloc/tourism_bloc.dart';
import 'package:jihc_hack/src/features/navigation/presentation/widgets/headline_widget.dart';
import 'package:jihc_hack/src/features/navigation/presentation/widgets/widgets.dart';
import 'package:jihc_hack/src/features/preferences/presentation/pages/preferences_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: HeadLineWidget(
                        text: 'NEW JOURNEY',
                        btnText: 'Start',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PreferencesPage()));
                        },
                        imagePath: 'assets/hotel_2.jpg',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: data.hospitals.length * 50,
                  child: ListView.separated(
                    itemCount: data.hospitals.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                        // final Uri launchUri = Uri(
                        //   scheme: 'tel',
                        //   path: '87057402142',
                        // );
                        // launchUrl(launchUri);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.local_hospital, color: Colors.red,size: 30,),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.hospitals[index].name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                Text(data.hospitals[index].address.length > 30 ? data.hospitals[index].address.substring(0, 30) + '...' : data.hospitals[index].address, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 15,),
                          ]
                        ),
                      ),
                      );
                    },
                  )
                ),
                Divider(),
                SizedBox(
                  height: 50,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.local_taxi, color: Colors.blueGrey,size: 30,),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.services.taxi.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 15,),
                          ]
                        ),
                      ),
                      )
                ),
                const SizedBox(height: 10),
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
                  height: 2100,
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
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
                        physics: const NeverScrollableScrollPhysics(),
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
                        physics: const NeverScrollableScrollPhysics(),
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
}