import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      "Айша-Биби, Kazakhstan"
    ],
    [
      "Мавзолей Бабаджи-Хатун",
      "Мистическое наследие",
      Icons.account_balance,
      "Айша-Биби, Kazakhstan"
    ],
    [
      "Мавзолей Карахан",
      "Королевское наследие",
      Icons.location_city,
      'Мавзолей Карахана, Taraz, Kazakhstan'
    ],
    [
      "Архитектурный комплекс «Тектурмас»",
      "Древняя панорама",
      Icons.landscape,
      "Мавзолей Тектурмас, Тектұрмас көшесі, Taraz, Kazakhstan"
    ],
    [
      "«Акиртас»",
      "Великолепный Дворцовый комплекс ",
      Icons.account_balance_outlined,
      "Мавзолей Тектурмас, Тектұрмас көшесі, Taraz, Kazakhstan"
    ]
  ];

  List modernPlaces = [
    [
      "Рынок «Шахристан»",
      "Яркий базар",
      Icons.store,
      "Шахристан, Taraz, Kazakhstan"
    ],
    [
      "Центральный стадион Тараза",
      "Спортивный дух",
      Icons.sports_soccer,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
    ],
    [
      "Дендрологический парк",
      "Зелёный оазис",
      Icons.park,
      "Шахристан, Taraz, Kazakhstan"
    ]
  ];

  List stayToPlaces = [
    [
      "Отель «Жамбыл»",
      "Элегантный комфорт",
      Icons.hotel,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
    ],
    [
      "Отель «Газовик»",
      "Тёплое гостеприимство",
      Icons.king_bed,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
    ],
    [
      "Отель «Уют»",
      "Уютное убежище",
      Icons.home,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
    ]
  ];

  List eatToPlaces = [
    [
      "Ресторан «Арасан»",
      "Изысканные вкусы",
      Icons.restaurant,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
    ],
    [
      "Ресторан «Кишлак»",
      "Традиционный вкус",
      Icons.local_dining,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
    ],
    [
      "Кафе «Салам»",
      "Местные деликатесы",
      Icons.local_cafe,
      "Орталық стадионы, Tole Bi Street, Taraz, Kazakhstan"
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
          child: CustomBackButton(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [

              //     Container(
              //       width: MediaQuery.of(context).size.width / 2 - 30,
              //       height:  MediaQuery.of(context).size.width / 2 - 30,
              //       decoration: BoxDecoration(
              //         color: AppColors.iconsColor,
              //         borderRadius: BorderRadius.circular(15)
              //       ),
              //       child: Center(
              //         child: Text('New Journey', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width / 2 - 30,
              //       height:  MediaQuery.of(context).size.width / 2 - 30,
              //       decoration: BoxDecoration(
              //         // color: AppColors.iconsColor,
              //         borderRadius: BorderRadius.circular(15),
              //         border: Border.all(color: AppColors.iconsColor)
              //       ),
              //       child: Center(
              //         child: Text('Search place', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.iconsColor),),
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: placesList.length * 220,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
