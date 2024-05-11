import 'package:e_store/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatelessWidget {
    DataEntity model;
  CatScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Category Details", style: TextStyle(
              color: Color(0xff06004F),
              fontWeight: FontWeight.w500,
              fontSize: 18),)),
          actions: [
            //#004182
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search,size: 25,),
              color: const Color(0xff004182),

            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined,size: 25,),
              color: const Color(0xff004182),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    model.image ?? "",
                    height: 300,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      model.name ?? "",
                      style: const TextStyle(
                          color: Color(0xff06004F),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
      ],
          ),
        ));
  }
}
