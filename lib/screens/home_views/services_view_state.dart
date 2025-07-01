import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/home_views/utils/cubit/request_state_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/colors_app.dart';

class ServicesViewState extends StatefulWidget {
  const ServicesViewState({super.key, this.requestId});
  final int? requestId;

  @override
  State<ServicesViewState> createState() => _ServicesViewStateState();
}

class _ServicesViewStateState extends State<ServicesViewState> {
  Timer? _pollingTimer;
  List<int> requestIds = [];

  @override
  void initState() {
    super.initState();
    _initAndStartPolling();
  }

  Future<void> _initAndStartPolling() async {

    final prefs = await SharedPreferences.getInstance();
    List<String> storedIds = prefs.getStringList('request_ids') ?? [];

    if (widget.requestId != null) {
      final idStr = widget.requestId.toString();
      if (!storedIds.contains(idStr)) {
        storedIds.add(idStr);
        await prefs.setStringList('request_ids', storedIds);
      }
    }

    final parsedIds = storedIds.map(int.parse).toList();

    if (parsedIds.isNotEmpty) {
      log('parsed IDs: $parsedIds');
      setState(() {
        requestIds = parsedIds;
      });
        log('Request IDs: $requestIds');

      final cubit = context.read<RequestStateCubit>();

      for (int id in requestIds) {
        cubit.requestDetailsMethod(id: id);
      }

      _pollingTimer = Timer.periodic(const Duration(seconds: 7), (timer) {
        for (int id in requestIds) {
          cubit.requestDetailsMethod(id: id);
        }
      });
    }
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: ColorsApp.primarycolor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTextItem(name: "Type"),
                  TitleTextItem(name: "Date"),
                  TitleTextItem(name: "Provider"),
                  TitleTextItem(name: "Status"),
                ],
              ),
            ),
            requestIds.isEmpty
                ? const Center(child: Text('لا يوجد طلبات للعرض'))
                : Expanded(
                  child: BlocBuilder<RequestStateCubit, RequestStateState>(
                    builder: (context, state) {
                      if (state is RequestStateLoaded) {
                        return ListView.builder(
                          itemCount: state.details.length,
                          itemBuilder: (context, index) {
                            final item = state.details[index];
                            return ServicesItem(
                              name: item.acceptedProvider?.name ?? '...',
                              job: item.service ?? '',
                              jobState: item.status ?? '',
                              color:
                                  item.status == 'accepted'
                                      ? Colors.green
                                      : Colors.red,
                              day: item.executionDay ?? '',
                            );
                          },
                        );
                      } else if (state is RequestStateLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is RequestStateError) {
                        return Center(child: Text(state.errMessage));
                      } else {
                        return const Text('لا توجد بيانات');
                      }
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class ServicesItem extends StatelessWidget {
  const ServicesItem({
    super.key,
    this.name = "-",
    required this.job,
    required this.jobState,
    required this.color,
    required this.day,
  });
  final String name, job, jobState, day;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(job),
              Text(day),
              SizedBox(
                width: 60,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    cutName(name: name, wordsnumber: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                //width: 70,
                width: MediaQuery.sizeOf(context).width * .2,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      jobState,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TitleTextItem extends StatelessWidget {
  const TitleTextItem({required this.name, super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }
}
