import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/login_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/widgets/info_list_tile.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({super.key});

  List historicPlaces = [
    [
      "Мавзолей Айши-Биби",
      "Священная красота",
      Icons.mosque,
      "Айша-Биби, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Мавзолей Бабаджи-Хатун",
      "Мистическое наследие",
      Icons.account_balance,
      "Айша-Биби, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Мавзолей Карахан",
      "Королевское наследие",
      Icons.location_city,
      'Мавзолей Карахана, Taraz, Kazakhstan',
      LatLng(42.871944, 71.345833)
    ],
    [
      "Архитектурный комплекс «Тектурмас»",
      "Древняя панорама",
      Icons.landscape,
      "Мавзолей Тектурмас, Тектұрмас көшесі, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "«Акиртас»",
      "Великолепный Дворцовый комплекс ",
      Icons.account_balance_outlined,
      "Мавзолей Тектурмас, Тектұрмас көшесі, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ]
  ];

  List modernPlaces = [
    [
      "Рынок «Шахристан»",
      "Яркий базар",
      Icons.store,
      "Шахристан, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Центральный стадион Тараза",
      "Спортивный дух",
      Icons.sports_soccer,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Дендрологический парк",
      "Зелёный оазис",
      Icons.park,
      "Шахристан, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ]
  ];

  List stayToPlaces = [
    [
      "Отель «Жамбыл»",
      "Элегантный комфорт",
      Icons.hotel,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Отель «Газовик»",
      "Тёплое гостеприимство",
      Icons.king_bed,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Отель «Уют»",
      "Уютное убежище",
      Icons.home,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ]
  ];

  List eatToPlaces = [
    [
      "Ресторан «Арасан»",
      "Изысканные вкусы",
      Icons.restaurant,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Ресторан «Кишлак»",
      "Традиционный вкус",
      Icons.local_dining,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ],
    [
      "Кафе «Салам»",
      "Местные деликатесы",
      Icons.local_cafe,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan",
      LatLng(42.871944, 71.345833)
    ]
  ];

  @override
  Widget build(BuildContext context) {
    List placesList = [
      ['Древний Тараз', historicPlaces],
      ['Современный Тараз', modernPlaces],
      ['Где переночевать', stayToPlaces],
      ['Сходить поесть', eatToPlaces]
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
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
          child: Column(
            children: [
              SizedBox(
                height: placesList.length * 220,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _buildPlacesList(placesList[index]);
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: placesList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPlacesList(List placesInfo) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              placesInfo[0],
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
            itemCount: placesInfo[1].length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              final place = placesInfo[1][index];
              return InfoListTile(
                placeName: place[0],
                placeDescription: place[1],
                placeDestination: place[3],
                placeIcon: place[2],
                latLng: place[4],
              );
            },
          ),
        ),
      ],
    );
  }
}
