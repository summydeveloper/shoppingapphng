import 'package:flutter/material.dart';
import 'package:shoppingapphng/models/product.dart';

class ProductsScreen extends StatelessWidget{
  final List<Product> products;
  final List<Product> cart;
  final Function(Product) onAddToCart;
const ProductsScreen({super.key,  required this.products, required this.cart, required this.onAddToCart})
;
@override 
Widget build(BuildContext context){
return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.productname),
          subtitle: Text('\$${product.price}'),
          trailing: Row(
             mainAxisSize: MainAxisSize.min,
            children: [
             Text('${product.quantity}'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  product.quantity++;
                  onAddToCart(product);
                },
              ),
            ],
          ),
        );
      },
    );
}
}