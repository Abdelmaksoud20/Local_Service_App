import 'package:flutter/material.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyElectrical extends StatelessWidget {
  const ServiceBodyElectrical({super.key});
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
          SliverToBoxAdapter(child: ProviderCardListView()),
        ],
      ),
    );
  }
}