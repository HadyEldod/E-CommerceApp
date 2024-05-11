import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';
import 'package:e_store/feature/home/presentation/manager/cubit.dart';
import 'package:flutter/widgets.dart';

class ProductItem extends StatelessWidget {
  final ProductDataEntity model;

  ProductItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.network(
                  model.imageCover ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title != null && model.title!.length > 15
                        ? '${model.title!.substring(0, 15)}...'
                        : model.title ?? "",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "EGP ${model.price.toString()}",
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      color: Colors.green,
                                    ),
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Text(
                                "Rating ${model.ratingsAverage.toString()}",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFB300),
                                size: 16.0,
                              ),
                            ],
                          ),
                        ],
                      ),Spacer(),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  HomeCubit.get(context)
                                      .addCart(model.id ?? "");
                                },
                                borderRadius: BorderRadius.circular(30.0),
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  size: 30.0,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
