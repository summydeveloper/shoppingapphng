// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shoppingapphng/models/product.dart';
import 'package:shoppingapphng/screens/successful_order.dart';

class checkoutScreen extends StatelessWidget {
  final List<Product> cart;
  final Function(Product) onRemoveFromCart;
  final VoidCallback onClearCart;
  const checkoutScreen(
      {super.key, required this.cart,
      required this.onRemoveFromCart,
      required this.onClearCart
      });
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: cart.isEmpty
            ? const Center(
                child: Text(
                'Nothing here right now😪\nProducts ordered would appear here',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
              ))
            : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final product = cart[index];
                  return ListTile(
                    title: Text(product.productname),
                    subtitle: Text(
                        'Quantity: ${product.quantity} - \$${product.price * product.quantity}'),
                    trailing: IconButton(
                      icon:const Icon(Icons.remove),
                      onPressed: () async {
                        if (product.quantity > 0) {
                          product.quantity-1;
                        }
                        onRemoveFromCart(product);
                      },
                    ),
                  );
                },
              ),
      ),
      if (cart.isNotEmpty)
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const OrderSuccessfulScreen( )),
              ).then((_) {
                onClearCart();
              });
            },
            child:const Text('Checkout'),
          ),
        ),
     const SizedBox(
        height: 10,
      ),
    ]);
  }
}
