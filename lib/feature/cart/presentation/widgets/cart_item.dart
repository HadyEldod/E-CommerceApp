import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_store/feature/cart/presentation/manager/cubit.dart';
import 'package:e_store/feature/home/data/models/CartResponseee.dart';

class CartItem extends StatelessWidget {
  final Products product;

  CartItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 150.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Color(0x4C004182)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 120.w,
            height: 140.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.product?.imageCover ?? ""),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(width: 15.w),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title and Delete Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.product?.title ?? "",
                        style: GoogleFonts.poppins(
                          color: Colors.indigo,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        CartCubit.get(context).deleteItem(product.product?.id ?? "");
                      },
                      icon: Icon(Icons.delete, color: Color(0xFFCB2D2D)),
                    ),
                  ],
                ),
                // Product Count
                Text(
                  "Count: ${product.count}",
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 14.sp,
                  ),
                ),
                Spacer(),
                // Price and Quantity Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.price} EGP",
                      style: GoogleFonts.poppins(
                        color: Colors.indigo,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Quantity Control Buttons
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 129.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                int counter = product.count ?? 0;
                                if (counter > 1) {
                                  counter--;
                                  CartCubit.get(context).UpdateItem(
                                      product.product?.id ?? "", counter);
                                }
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${product.count}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                int counter = product.count ?? 0;
                                counter++;
                                CartCubit.get(context).UpdateItem(
                                    product.product?.id ?? "", counter);
                              },
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
