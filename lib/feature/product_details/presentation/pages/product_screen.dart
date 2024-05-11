import 'package:flutter/material.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';
import '../widgets/description_text_widget.dart';

class ProductScreen extends StatelessWidget {
  final ProductDataEntity productDataEntity;

  ProductScreen(this.productDataEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A73B7),
        elevation: 1,
        title: const Text(
          "Product Details",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    productDataEntity.images?.first ?? "",
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 100, color: Colors.red),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              productDataEntity.title ?? "",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Color(0xFF1A1A1A),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "EGP ${productDataEntity.price.toString()}",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Color(0xFF0A73B7),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD700).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xFFFFD700)),
                  ),
                  child: Text(
                    "${productDataEntity.sold.toString()} Sold",
                    style: const TextStyle(color: Color(0xFF000000)),
                  ),
                ),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    Text(
                      "Rating ${productDataEntity.ratingsAverage.toString()}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(width: 4.0),
                    const Icon(Icons.star, color: Color(0xFFFFD700), size: 20),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Description",
              style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            DescriptionTextWidget(text: productDataEntity.description ?? ""),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // BlocProvider.of<HomeCubit>(context).addCart(productDataEntity.id ?? "");
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: Color(0xFFFF5733),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_shopping_cart, color: Colors.white),
                    SizedBox(width: 8.0),
                    Text(
                      "ADD TO CART",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
