import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: () => Navigator.pop(context),      icon: const Icon(Icons.chevron_left),
) ,
        title: const Text('🎉🎉🎉'),
      ),
      body:const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your order was successful!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
             
          ],
        ),
      ),
    
    );
  }
}
