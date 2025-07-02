import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/get_services_model/get_provider_dash_board.dart';
import 'package:graduation_project/screens/home_views/utils/cubit/request_state_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';
// ignore: depend_on_referenced_packages
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
    int? userId = prefs.getInt('id');
    // final key = 'request_ids_${widget.userId}';
    List<String> storedIds = prefs.getStringList(userId.toString()) ?? [];

    if (widget.requestId != null) {
      final idStr = widget.requestId.toString();
      if (!storedIds.contains(idStr)) {
        storedIds.add(idStr);
        await prefs.setStringList(userId.toString(), storedIds);
      }
    }

    final parsedIds = storedIds.map(int.parse).toList();

    if (parsedIds.isNotEmpty) {
      setState(() {
        requestIds = parsedIds;
      });

      final cubit = context.read<RequestStateCubit>();

      for (int id in requestIds) {
        cubit.requestDetailsMethod(id: id, userId: userId!);
      }

      _pollingTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
        for (int id in requestIds) {
          cubit.requestDetailsMethod(id: id, userId: userId!);
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












class ServicesProviderViewState extends StatefulWidget {
  const ServicesProviderViewState({super.key, this.request});
  final ServiceRequests? request;

  @override
  State<ServicesProviderViewState> createState() =>
      _ServicesProviderViewState();
}

class _ServicesProviderViewState extends State<ServicesProviderViewState> {
  List<ServiceRequests> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // تخزين البيانات
  Future<void> saveData(List<ServiceRequests> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.map((e) => e.toJson()).toList();
    prefs.setString('requests', jsonEncode(jsonList));
  }

  // تحميل البيانات
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('requests');
    if (jsonString != null) {
      final decoded = jsonDecode(jsonString) as List;
      setState(() {
        data = decoded.map((e) => ServiceRequests.fromJson(e)).toList();
      });
    }

    // إضافة الطلب الجديد (من الصفحة السابقة)
    if (widget.request != null) {
      setState(() {
        data.add(widget.request!);
      });
      await saveData(data); // حفظ القائمة بعد التعديل
    }
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
              color: Colors.green  ,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Type"),
                  Text("Date"),
                  Text("User"),
                  Text("Status"),
                ],
              ),
            ),
            data.isEmpty
                ?  Expanded(
                child: Center(child: Text('لا يوجد طلبات للعرض')))
                : Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  final limitedService = item.service?.characters.take(15).toString() ?? '-';
                  final limitedName = item.name?.characters.take(15).toString() ?? '-';
                  return ServicesProviderItem(
                    name: limitedName ,
                    job: limitedService ,
                    jobState: item.status == "pending" ? "accepted" : "pending",
                    color: item.status == 'accepted'
                        ? Colors.red
                        : Colors.green,
                    day: item.executionDay ?? '',
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
class ServicesProviderItem extends StatelessWidget {
  const ServicesProviderItem({
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
                child: Text(
                  name ,

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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

class TitleTextProviderItem extends StatelessWidget {
  const TitleTextProviderItem({required this.name, super.key});

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

