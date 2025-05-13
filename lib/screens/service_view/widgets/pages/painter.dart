import 'package:flutter/material.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyPainter extends StatelessWidget {
  const ServiceBodyPainter({super.key});
  static final List<ServiceModel> painter = [
    ServiceModel(
      name: 'Repair & Cover Defects',
      description:
          'Address cracks and holes in walls and ceilings and ensure smooth and beautiful installations',
      imageUrl: 'assets/images/painting/1.png',
      price: '50-100',
    ),

    ServiceModel(
      name: 'Painting Walls & Ceilings',
      description:
          'By using different types of paints and colors to improve the general appearance of places',
      imageUrl: 'assets/images/painting/(2).png',
      price: '175-200',
    ),

    ServiceModel(
      name: 'Decorative Finishes',
      description:
          'Adding decorative effects such as murals and special decorations to give the place a unique character',
      imageUrl: 'assets/images/painting/(3).png',
      price: '100-125',
    ),

    ServiceModel(
      name: 'Moisture treatment & insulation',
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
          SliverToBoxAdapter(child: ProviderCardListView()),
        ],
      ),
    );
  }
}
