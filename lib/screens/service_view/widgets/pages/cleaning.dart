import 'package:flutter/material.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyCleaning extends StatelessWidget {
  const ServiceBodyCleaning({super.key});
  static final List<ServiceModel> cleaner = [
    ServiceModel(
      servicename: 'Cleaning',
      name: 'Carpet & Upholstery',
      description:
          'Focuses on cleaning carpets, sofas, curtains, and other upholstery',
      imageUrl: 'assets/images/cleaning/download(1).png',
      price: '50-100',
    ),

    ServiceModel(
      servicename: 'Cleaning',
      name: 'Post-Construction',
      description: 'Involves cleaning up after construction or renovation work',
      imageUrl: 'assets/images/cleaning/download(2).png',
      price: '175-200',
    ),

    ServiceModel(
      servicename: 'Cleaning',
      name: 'Office Cleaning',
      description:
          'Involves cleaning offices, meeting rooms, bathrooms, and common areas',
      imageUrl: 'assets/images/cleaning/download(3).png',
      price: '100-125',
    ),

    ServiceModel(
      servicename: 'Cleaning',
      name: 'Home Cleaning',
      description:
          'Includes cleaning rooms, kitchens, bathrooms, floors, windows, and furniture',
      imageUrl: 'assets/images/cleaning/download(4).png',
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
            sliver: ServiceCardSliverList(services: cleaner),
          ),
          SliverToBoxAdapter(child: ProviderCardListView()),
        ],
      ),
    );
  }
}
