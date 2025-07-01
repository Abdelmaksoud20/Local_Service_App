import 'package:flutter/material.dart';
import 'package:graduation_project/models/provider_model.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyPainter extends StatelessWidget {
  ServiceBodyPainter({super.key});

  final List<ProviderModel> models = [
    ProviderModel(
      image: 'assets/images/top/51733077-plumber-man.jpg',
      name: "Akram Marwan AbdEllatef",
      job: 'Interior Wall Painting',
      desjob: 'Master painter specializing in interior finishes',
      years: '  12+ years ',
      rate: '4.5',
    ),
    ProviderModel(
      image:
          'assets/images/top/depositphotos_137592562-stock-photo-young-handsome-plumber.jpg',
      name: 'Adnan Taha Magdi',
      job: 'Exterior House Painting',
      desjob: 'Exterior painting expert with weatherproofing skills',
      years: ' 10+ years   ',
      rate: '4.5',
    ),
    ProviderModel(
      image: 'assets/images/top/istockphoto-1835093714-612x612.jpg',
      name: 'Hazem Nasr Zaki',
      job: 'Cabinet Refinishing',
      desjob: 'Cabinet refinishing specialist with precision detailing',
      years: ' 8+ years ',
      rate: '4.5',
    ),
  ];
  static final List<ServiceModel> painter = [
    ServiceModel(
      servicename: 'Painting',
      name: 'Interior Wall Painting',
      description:
          'Address cracks and holes in walls and ceilings and ensure smooth and beautiful installations',
      imageUrl: 'assets/images/painting/1.png',
      price: '50-100',
    ),

    ServiceModel(
      servicename: 'Painting',
      name: 'Exterior House Painting',
      description:
          'By using different types of paints and colors to improve the general appearance of places',
      imageUrl: 'assets/images/painting/(2).png',
      price: '175-200',
    ),

    ServiceModel(
      servicename: 'Painting',
      name: 'Cabinet Refinishing',
      description:
          'Adding decorative effects such as murals and special decorations to give the place a unique character',
      imageUrl: 'assets/images/painting/(3).png',
      price: '100-125',
    ),

    ServiceModel(
      servicename: 'Painting',
      name: 'Decorative Painting',
      description:
          'Applying sealing techniques and materials to preserve walls and ceilings from the effects of moisture',
      imageUrl: 'assets/images/painting/(4).png',
      price: '200-250',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10),
            sliver: ServiceCardSliverList(services: painter),
          ),
          SliverToBoxAdapter(child: ProviderCardListView(providers: models)),
        ],
      ),
    );
  }
}
