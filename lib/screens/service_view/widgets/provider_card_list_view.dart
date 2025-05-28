import 'package:flutter/material.dart';
import 'package:graduation_project/screens/service_view/widgets/provider_card.dart';

class ProviderCardListView extends StatelessWidget {
  const ProviderCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffE9F8E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProviderCard(),
            );
          },
        ),
      ),
    );
  }
}
