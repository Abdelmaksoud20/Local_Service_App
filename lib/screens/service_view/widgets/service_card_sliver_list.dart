
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/service_view/widgets/service_card.dart';

class ServiceCardSliverList extends StatelessWidget {
  const ServiceCardSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ServiceCard();
        },
        childCount: 10,
      ),
    );
  }
}
