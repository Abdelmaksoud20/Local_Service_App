import 'package:flutter/material.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyPlumber extends StatelessWidget {
  const ServiceBodyPlumber({super.key});
  static final List<ServiceModel> plumber = [
    ServiceModel(
      servicename: 'Plumber',
      name: 'Fix A Leak',
      description:
          'Maintenance and repair services for all plumbing malfunctions of the highest quality, in addition to installing plumbing for bathrooms, kitchens and bathtubs.',
      imageUrl:
          'assets/images/plumbing/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(1).png',
      price: '50-100',
    ),

    ServiceModel(
      servicename: 'Plumber',
      name: 'Unclog The Drain',
      description:
          'The installation of drainage and feeding pipes includes two bathrooms with bathtub and one kitchen.',
      imageUrl:
          'assets/images/plumbing/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(2).png',
      price: '175–200',
    ),

    ServiceModel(
      servicename: 'Plumber',
      name: 'Install A New Sink',
      description:
          'Maintenance and repair services for all plumbing malfunctions with the highest quality, in addition to installing and replacing plumbing and a new sink.',
      imageUrl:
          'assets/images/plumbing/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(3).png',
      price: '100–125',
    ),

    ServiceModel(
      servicename: 'Plumber',
      name: 'Replace A Faucet',
      description:
          'Maintenance and repair services for all plumbing malfunctions with the highest quality, in addition to installing and replacing faucets.',
      imageUrl:
          'assets/images/plumbing/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(4).png',
      price: '200–250',
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
            sliver: ServiceCardSliverList(services: plumber),
          ),
          SliverToBoxAdapter(child: ProviderCardListView()),
        ],
      ),
    );
  }
}
