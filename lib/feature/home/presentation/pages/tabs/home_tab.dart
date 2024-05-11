import 'package:e_store/feature/home/presentation/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_store/feature/home/presentation/manager/cubit.dart';
import 'package:e_store/feature/home/presentation/manager/states.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_images.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: TextField(
                  onSubmitted: (value) {
                    Navigator.pushNamed(context, Routes.searchScreen,
                        arguments: value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(AppImages.search),
                    ),
                    hintText: "What do you want to search?",
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.black54),
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide:
                          const BorderSide(color: Colors.black87, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageSlideshow(
                    height: 200.h,
                    width: 398.w,
                    isLoop: false,
                    indicatorColor: Colors.indigo,
                    indicatorBackgroundColor: Colors.white,
                    children: HomeCubit.get(context).sliders.map((i) {
                      return Image.asset(i);
                    }).toList()),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0D47A1), // Primary Color
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 280.h,
                child: state is HomeLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: HomeCubit.get(context).categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.catScreen,
                                        arguments: HomeCubit.get(context)
                                            .categories[index],
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: 50.w,
                                      backgroundImage: NetworkImage(
                                        HomeCubit.get(context)
                                                .categories[index]
                                                .image ??
                                            "https://www.shutterstock.com/image-vector/error-500-page-empty-symbol-260nw-1711106146.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  HomeCubit.get(context)
                                          .categories[index]
                                          .name ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color(0xFF212121), // Text Color
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Brands",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0D47A1), // Primary Color
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              SizedBox(
                height: 280.h,
                child: state is HomeLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: HomeCubit.get(context).brands.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                Expanded(
                                  child: CircleAvatar(
                                    radius: 50.w,
                                    backgroundImage: NetworkImage(
                                      HomeCubit.get(context)
                                              .brands[index]
                                              .image ??
                                          "",
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  HomeCubit.get(context).brands[index].name ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color(0xFF212121), // Text Color
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
