import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managment/screens/home/second_screen.dart';

import '../../provider/data_class.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfefcff),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: const Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children:  [
              Consumer<DataClass>(
                builder: (context,dataClass,child) {
                  return  Text(
                    '${dataClass.x}',
                    style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }
              ),
              const Spacer(),
              const Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xFF716f72), width: 1)),
                  child: const Icon(Icons.add),
                ),
                onTap: () {
                  if(Provider.of<DataClass>(context,listen: false).x<5){
                     Provider.of<DataClass>(context,listen: false).incrementX();
                  }else{
                   Get.snackbar("Item", "Can not more than this",
                      backgroundColor: Colors.black,
                      colorText: Colors.white,
                      titleText: const Text(
                        "Item",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      messageText: const Text(
                        "Can not be more than this",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      );
                  }
                },
              ),
              const Spacer(),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Row(
                      children: const [
                        Text(
                          "Next Page",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.skip_next, color: Colors.white)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => const SecondScreen(),
                          transition: Transition.upToDown,
                          duration: const Duration(seconds: 1));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
