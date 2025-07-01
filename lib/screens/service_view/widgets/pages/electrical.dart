import 'package:flutter/material.dart';
import 'package:graduation_project/models/provider_model.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyElectrical extends StatelessWidget {
   ServiceBodyElectrical({super.key});

  final List<ProviderModel> models = [
    ProviderModel(
      image: 'assets/images/top/51733077-plumber-man.jpg',
      name: "Ramy Adham Sabri",
      job: 'Wiring and Cabling Services',
      desjob: 'Expert in electrical wiring and installations',
      years: '  12+ years ',
      rate: '4.5',
    ),
    ProviderModel(
      image:
      'assets/images/top/depositphotos_137592562-stock-photo-young-handsome-plumber.jpg',
      name: 'Hazem Bassam Rafek',
      job: 'Installing and Maintaining Electrical Panels',
      desjob: 'Specialist in electrical panel installation and maintenance',
      years: ' 10+ years   ',
      rate: '4.5',
    ),
    ProviderModel(
      image: 'assets/images/top/istockphoto-1835093714-612x612.jpg',
      name: 'Haithem Magdi Anwar',
      job: 'Installing and Maintaining Lighting Systems',
      desjob: 'Expert in installing and maintaining lighting systems',
      years: ' 8+ years ',
      rate: '4.5',
    ),
  ];
  static final List<ServiceModel> electricals = [
    ServiceModel(
      servicename: 'Electrical',
      name: 'Wiring and cabling services',
      description:
          'Repairing damaged wires and ensuring safe electrical connections.Installing and upgrading electrical wiring in homes and office',
      imageUrl:
          'assets/images/electrical/8ddec7a8f36ca5eb8331a39fcc4ee378(1).png',
      price: '200-250',
    ),
    ServiceModel(
      servicename: 'Electrical',
      name: 'Installing and maintaining lighting systems',
      description:
          'Replacing and maintaining damaged light fixtures. Installing indoor and outdoor lights and timers',
      imageUrl: 'assets/images/electrical/download(2).png',
      price: '400-650',
    ),

    ServiceModel(
      servicename: 'Electrical',
      name: 'Installing and maintaining electrical panels',
      description:
          'Installing main and sub electrical panels for homes and buildings. Maintaining electrical panels to ensure safe and proper power distribution',
      imageUrl: 'assets/images/electrical/download(3).png',
      price: '500-750',
    ),

    ServiceModel(
      servicename: 'Electrical',
      name: 'Installing and maintaining alarm and home system security',
      description:
          'Installing burglary and fire alarm systems. Maintaining and updating home security systems for enhanced protection',
      imageUrl: 'assets/images/electrical/download(4).png',
      price: '350-500',
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
            sliver: ServiceCardSliverList(services: electricals,),
          ),
          SliverToBoxAdapter(child: ProviderCardListView(providers: models)),
        ],
      ),
    );
  }
}
