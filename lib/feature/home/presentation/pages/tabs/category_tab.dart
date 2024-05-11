import 'package:e_store/config/routes/routes.dart';
import 'package:e_store/feature/home/presentation/manager/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/states.dart';
import '../../widgets/product_item.dart';

class CategotyTab extends StatelessWidget {
  const CategotyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return HomeCubit.get(context).products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.4 / 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.productScreen,
                                    arguments:
                                        HomeCubit.get(context).products[index]);
                              },
                              child: ProductItem(
                                  HomeCubit.get(context).products[index])),
                        );
                      },
                      itemCount: HomeCubit.get(context).products.length,
                    ),
                  )
                ],
              );
      },
    );
  }
}

/*{
        return HomeCubit.get(context).products.isEmpty?
            const Center(child: CircularProgressIndicator(),)
          :Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context,index){
                    return Image.network(HomeCubit.get(context).products[index].imageCover??"");
                  },
              itemCount: HomeCubit.get(context).products.length,),
            )
          ],
        );
      },*/
