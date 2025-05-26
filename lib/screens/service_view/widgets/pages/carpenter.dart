
import 'package:flutter/material.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyCarpenter extends StatelessWidget {
  const ServiceBodyCarpenter({super.key});
  static final List<ServiceModel> carpenter = [
  ServiceModel(
  servicename: 'Carpenter',
  name: 'Door Installation and Repair',
  description: 'Design and manufacture of interior and exterior wooden doors. We create custom doors to order, with a choice of materials, colors and finishes.',
  imageUrl: 'assets/images/carpentry/doors(1).png',
  price: '50–100',
),

ServiceModel(
  servicename: 'Carpenter',
  name: 'Door Installation and Repair',
  description: 'Choose the appropriate wood species that can withstand different weather conditions. The nets are designed according to dimensions and technical specifications.',
  imageUrl: 'assets/images/carpentry/windo(2).png',
  price: '175–200',
),

ServiceModel(
  servicename: 'Carpenter',
  name: 'Table Crafting and Restoration',
  description: 'Get a unique piece of furniture tailored to meet your needs and suit your taste. Whether you are looking for a dining table that is classic or modern, simple or complex, small or large.',
  imageUrl: 'assets/images/carpentry/table(3).png',
  price: '100–125',
),

ServiceModel(
  servicename: 'Carpenter',
  name: 'Bedroom Furniture Assembly',
  description: 'Classic bedrooms: characterized by luxurious designs, fine details, and the use of dark woods. Modern bedrooms: characterized by clean lines, calm colors, and the use of modern materials.',
  imageUrl: 'assets/images/carpentry/bedroom(4).png',
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
            sliver: ServiceCardSliverList(services: carpenter),
          ),
          SliverToBoxAdapter(child: ProviderCardListView()),
        ],
      ),
    );
  }
}
