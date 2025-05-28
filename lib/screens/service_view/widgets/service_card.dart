import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/models/service_model.dart';
import 'package:graduation_project/screens/request_view/request_view.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.data});
  final ServiceModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 342,
          height: 234,
          decoration: BoxDecoration(
            color: const Color(0xffE9F8E8),
            borderRadius: BorderRadius.circular(27),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                data.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        data.imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        data.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6D5C5C),
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ ${data.price}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text('/Visit', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => RequestView(
                                price: data.price,
                                skill: data.name,
                                service: data.servicename,
                              ),
                        ),
                      );
                    },
                    child: Container(
                      height: 36,
                      width: 90,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Request',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
