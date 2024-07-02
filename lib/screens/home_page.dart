import "package:flutter/material.dart";
import "package:shoppingapphng/models/product.dart";
import "package:shoppingapphng/screens/checkout.dart";
import "package:shoppingapphng/screens/product_screen.dart";

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  final List<Product> _cart =[];

  static List<Product> products =[
    Product('Pizza 🍕', 20.0),
    Product('Shoes 🥿', 11.0),
    Product('Tshirt 👕', 23)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _clearCart() {
    setState(() {
      for (var product in _cart) {
        product.quantity = 0;
      }
      _cart.clear();

    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('HNG Simple Shopping App'),
      ),
      body: _selectedIndex==0 ?ProductsScreen(products: products, cart: _cart, onAddToCart: (products){
        setState(() {
final existingProduct = _cart.firstWhere(
        (element) => element.productname == products.productname,
        orElse: () => Product('', 0.0),
      );

      if (existingProduct.productname.isEmpty) {
        _cart.add(products);
      } else {
        existingProduct.quantity++;
      }        });
      }):checkoutScreen(
              cart: _cart,
              onRemoveFromCart: (products) {
                setState(() {
 if (products.quantity > 1) {
        products.quantity--;
      } else {
        _cart.remove(products);
      }                });
              }, onClearCart: _clearCart,
            ),bottomNavigationBar: BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify_sharp),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            label: 'Checkout',
          ),],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green[200],
          onTap: _onItemTapped,
      ),
    );
  }
}