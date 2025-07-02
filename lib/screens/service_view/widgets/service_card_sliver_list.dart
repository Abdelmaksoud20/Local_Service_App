import 'package:flutter/material.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card.dart';

class ServiceCardSliverList extends StatelessWidget {
  const ServiceCardSliverList({super.key, required this.services});
  final List<ServiceModel> services;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ServiceCard(data: services[index],);
      }, childCount: services.length),
    );
  }
}
