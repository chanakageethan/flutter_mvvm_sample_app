import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/models/product.dart';


class ProductListItem extends StatelessWidget {
  final Product productItem;

  const ProductListItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              productItem.title.toString(),
              maxLines: 2,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(width: 4),

          // (productItem?.completed == true)
          //     ? Icon(Icons.check_circle, color: Colors.green, size: 36.0)
          //     : Icon(
          //         Icons.check_circle_outlined,
          //         color: Colors.black12,
          //         size: 36.0,
          //       ),
        ],
      ),
    );
  }
}
