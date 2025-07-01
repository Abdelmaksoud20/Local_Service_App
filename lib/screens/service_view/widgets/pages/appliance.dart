import 'package:flutter/material.dart';
import 'package:graduation_project/models/provider_model.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyAppliance extends StatelessWidget {
  ServiceBodyAppliance({super.key});
  final List<ProviderModel> models =[
    ProviderModel(
      image: 'assets/images/top/51733077-plumber-man.jpg',
      name: "Seif Ehab Nader",
      job: 'Washing Machine Repair',
      desjob: 'Washing machine repair specialist',
      years: '12+ years',
      rate: ' 5',
    ),
    ProviderModel(
      image:
      'assets/images/top/depositphotos_137592562-stock-photo-young-handsome-plumber.jpg',
      name: 'Adel Fouad Masoud',
      job: 'Refrigerator Repair',
      desjob: 'Refrigerator repair expert with quick service',
      years: ' 10+ years ',
      rate: '5',
    ),
    ProviderModel(
      image: 'assets/images/top/istockphoto-1835093714-612x612.jpg',
      name: 'Louay Hossam Ramzi',
      job: 'Water Heater Repair',
      desjob: 'Water heater repair specialist',
      years: '10+ years ',
      rate: ' 5',
    ),
  ];
  static final List<ServiceModel> cleaner = [
    ServiceModel(
      servicename: 'Appliance Service',
      name: 'Washing Machine Repair',
      description:
          'Focuses on cleaning carpets, sofas, curtains, and other upholstery',
      imageUrl: 'assets/images/cleaning/download(1).png',
      price: '50-100',
    ),

    ServiceModel(
      servicename: 'Appliance Service',
      name: 'Refrigerator Repair',
      description: 'Involves cleaning up after construction or renovation work',
      imageUrl: 'assets/images/cleaning/download(2).png',
      price: '175-200',
    ),

    ServiceModel(
      servicename: 'Appliance Service',
      name: 'Water Heater Repair',
      description:
          'Involves cleaning offices, meeting rooms, bathrooms, and common areas',
      imageUrl: 'assets/images/cleaning/download(3).png',
      price: '100-125',
    ),

    ServiceModel(
      servicename: 'Appliance Service',
      name: 'Oven Repair',
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
          SliverToBoxAdapter(child: ProviderCardListView(providers: models,)),
        ],
      ),
    );
  }
}
