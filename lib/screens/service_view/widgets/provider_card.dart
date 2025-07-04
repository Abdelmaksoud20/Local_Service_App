import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/models/provider_model.dart';

// import '../../../notification/notification.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({super.key, required this.data});
  final ProviderModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 178,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xff74C69D), width: 2),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    data!.image,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data!.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data!.job,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff4B5563),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              data!.desjob,
              style: TextStyle(fontSize: 10, color: Color(0xff6D5C5C)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.handyman, color: Color(0xff4B5563), size: 20),
                SizedBox(width: 10),
                Text(
                 data!.years,
                  style: TextStyle(fontSize: 10, color: Color(0xff4B5563)),
                ),
                SizedBox(width: 10),
                Text(
                 data!.rate,
                  style: TextStyle(fontSize: 10, color: Color(0xff4B5563)),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  color: Color(0xffFBBF24),
                  size: 14,
                );
              }),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {
                // NotificationApp().showNotification();
              },
              child: Container(
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Request',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
