import 'package:e_store/feature/cart/data/data_sources/dto.dart';
import 'package:e_store/feature/cart/presentation/manager/cubit.dart';
import 'package:e_store/feature/cart/presentation/widgets/cart_item.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';
import 'package:e_store/feature/login/data/data_sources/login_data_Sources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(RemoteCartDto())..getCart(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartSuccessState) {
            return Scaffold(
              bottomNavigationBar: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child:
                      Row(
                        children: [
                          Text(
                            "Total Price :",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            " ${state.cartResponseee.data?.totalCartPrice}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500,color: Colors.blueAccent),

                          ),
                          Text(
                            "  EGP",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            textStyle: const TextStyle(color: Colors.white)),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                "Order Now -->",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(
                            state.cartResponseee.data!.products![index]);
                      },
                      itemCount: state.cartResponseee.numOfCartItems,
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
