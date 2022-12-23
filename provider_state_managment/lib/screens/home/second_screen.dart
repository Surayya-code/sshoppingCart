import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managment/screens/home/home_screen.dart';

import '../../provider/data_class.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
          'Second Page',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Consumer<DataClass>(
                      builder: (context,dataClass,child) {
                        return  Text(
                          '${dataClass.x}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        );
                      }
                    ),
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 40, 
                      fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 40,
               right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      if( context.read<DataClass>().x>0){
                          context.read<DataClass>().decrementX();
                           // Provider.of<DataClass>(context,listen: false).decrementX();
                      }else{
                         Get.snackbar("Item", "Can not decrease more",
                     backgroundColor: Colors.black,
                        colorText: Colors.white,
                     titleText: const Text(
                          "Item",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white
                          ),
                        ),
                        messageText: const Text(
                          "Can not decrease more",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ));
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF716f72),
                          )),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap:(){
                          Get.to(()=>const HomeScreen(),transition: Transition.downToUp,
                           duration:const Duration(seconds: 1));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.skip_previous,
                              color: Color(0xFFfefeff),
                            ),
                            Text(
                              "Prev Page",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFFfefeff)),
                            ),
                          ],
                        ),
                      ),
                    ),
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
