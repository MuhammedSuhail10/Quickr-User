import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class WorkerDetailsScreen extends StatefulWidget {
  final int orderId;
  const WorkerDetailsScreen({super.key, required this.orderId});

  static const routeName = 'worker-details';

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
      HomeEvent.getWorkerDetails(orderId: widget.orderId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        surfaceTintColor: ColorResources.transparent,
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorResources.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('Worker Info', style: context.heading.w400.s24),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.help_outline, color: ColorResources.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.getWorkerDetailsStatus == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.getWorkerDetailsStatus == ApiStatus.error) {
            return Center(
              child: Text(
                state.errorMessage ?? 'Failed to load worker details',
                style: context.textStyle1.s16,
              ),
            );
          }

          final worker = state.workerDetailsResponse;
          if (worker == null) {
            return const Center(child: Text('No worker details found'));
          }

          final genderStr = worker.gender == 1
              ? "M"
              : worker.gender == 2
              ? "F"
              : "Other";

          return SafeArea(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      // 2. Profile Circle Section
                      Center(
                        child: Container(
                          width: 240.w,
                          height: 240.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorResources.lightGray,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://api.dicebear.com/7.x/avataaars/png?seed=Muhammed',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),

                      // 3. Name and Details Section
                      Text(
                        '${worker.firstName ?? ''} ${worker.lastName ?? ''}',
                        style: TextStyle(
                          fontFamily: AppFonts.heading,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Exp: ${worker.totalExperiance ?? 0} | Gender: $genderStr | Age: ${worker.age ?? ""}',
                        style: TextStyle(
                          fontFamily: AppFonts.body,
                          fontSize: 18.sp,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      // 4. Work Images Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Work Images',
                              style: TextStyle(
                                fontFamily: AppFonts.body,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            if (worker.images != null &&
                                worker.images!.isNotEmpty)
                              Row(
                                children: [
                                  for (
                                    int i = 0;
                                    i <
                                        (worker.images!.length > 2
                                            ? 2
                                            : worker.images!.length);
                                    i++
                                  )
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: i == 0 ? 16.w : 0,
                                        ),
                                        child: Container(
                                          height: 200.h,
                                          decoration: BoxDecoration(
                                            color: ColorResources.lightGray,
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                worker.images![i],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (worker.images!.length == 1)
                                    const Expanded(child: SizedBox()),
                                ],
                              )
                            else
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                        color: ColorResources.lightGray,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Container(
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                        color: ColorResources.lightGray,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
