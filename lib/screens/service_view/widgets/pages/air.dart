import 'package:flutter/material.dart';
import 'package:graduation_project/models/provider_model.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card_list_view.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card_sliver_list.dart';

class ServiceBodyAir extends StatelessWidget {
  ServiceBodyAir({super.key});

  final List<ProviderModel> modles = [
    ProviderModel(
      image: 'assets/images/top/51733077-plumber-man.jpg',
      name: "Ali Mostafa Zedan",
      job: 'Air conditioning cleaning & summer maintenance',
      desjob: 'AC specialist in maintenance and cleaning services',
      years: ' 8+ years',
      rate: '5',
    ),
    ProviderModel(
      image:
          'assets/images/top/depositphotos_137592562-stock-photo-young-handsome-plumber.jpg',
      name: 'Youssef Soliman Fouad',
      job: 'Charging Freon air conditioning',
      desjob: 'AC technician specializing in freon charging and repairs',
      years: '  7+ years ',
      rate: '4.5',
    ),
    ProviderModel(
      image: 'assets/images/top/istockphoto-1835093714-612x612.jpg',
      name: 'Mohamed Sami Youssef',
      job: 'Dismantling and installing Air conditioning',
      desjob: 'AC expert specializing in installation and dismantling',
      years: '6+ years ',
      rate: ' 4.5',
    ),
  ];

  static final List<ServiceModel> air = [
    ServiceModel(
      servicename: 'Air conditionar',
      name: 'Air conditioning cleaning & summer maintenance',
      description:
          'Prepare your air conditioning for the heat. Professional cleaning service to ensure the best performance during the summer season.',
      imageUrl:
          'assets/images/air/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(1).png',
      price: '200–250',
    ),

    ServiceModel(
      servicename: 'Air conditionar',
      name: 'Dismantling and installing Air conditioning',
      description:
          'Professional technicians to deal with all types of air conditioners accurately and efficiently.',
      imageUrl:
          'assets/images/air/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(2).png',
      price: '400–650',
    ),

    ServiceModel(
      servicename: 'Air conditionar',
      name: 'Charging Freon air conditioning',
      description:
          'Is it poor cooling? We offer a freon filling service to rejuvenate the efficiency of your air conditioning.',
      imageUrl:
          'assets/images/air/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b(3).png',
      price: '800–1100',
    ),

    ServiceModel(
      servicename: 'Air conditionar',
      name: 'Air conditioning inspection',
      description:
          'To avoid sudden breakdowns, book a comprehensive preview to detect potential problems.',
      imageUrl:
          'assets/images/air/صورة واتساب بتاريخ 2025-02-25 في 19.43.39_487e84b4(4).png',
      price: '175–200',
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
            sliver: ServiceCardSliverList(services: air),
          ),
          SliverToBoxAdapter(child: ProviderCardListView(providers: modles)),
        ],
      ),
    );
  }
}
