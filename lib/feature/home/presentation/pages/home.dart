import 'package:e_store/config/routes/routes.dart';
import 'package:e_store/feature/home/data/data_sources/data_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto())
        ..getCategories()
        ..getBrands()
        ..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            showDialog(
                context: context,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.indigo,
                    strokeWidth: 4.0,
                  ),
                ));
          } else if (state is HomeGetCategoriesSuccessState) {
            HomeCubit.get(context).setCategories(state.model.data ?? []);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              elevation: 2.5,
              title: const Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                HomeCubit.get(context).changeBottomNav(value);
              },
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.black54,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Badge(
                    alignment: Alignment.topCenter,
                    label: Text(
                      HomeCubit.get(context).numOfItemsInCart.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                  label: "Cart",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomeCubit.get(context)
                  .tabs[HomeCubit.get(context).bottomNavIndex],
            ),
          );
        },
      ),
    );
  }
}
