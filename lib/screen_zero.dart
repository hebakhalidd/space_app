 import 'package:flutter/material.dart';
import 'package:space_app/screen_one.dart';
class ScreenZero extends StatelessWidget{
  const ScreenZero ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
           children: [
             Positioned.fill(
                 child:Image.asset('assets/images/Frame 1.png',
                   fit: BoxFit.cover,
                 ),
             ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
                child:  Text('Explore\nThe\nUniverse',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                  child: Padding(padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const ScreenOne(),
                      ),
                      );
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEE403D),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(16),
                          shape: const StadiumBorder()
                        ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Explore',
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward,size: 22,),
                        ],
                      ),
                    ),
                  ),
                  ),
              ),
            )
      ]
      ),
    );
  }

}