import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget{
  final String name;
  final String image;
  const ScreenTwo({
    super.key,
  required this.name,
    required this.image,
});
  Widget _fact(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
            TextSpan(text: value),
          ],
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: Column(
       children: [
         SizedBox(
           height: 250,
           width: double.infinity,
           child: Stack(
             children: [
               Positioned.fill(
                   child: Image.asset('assets/images/Rectangle 4.png',
                   fit: BoxFit.cover,
                   ),
               ),
               const Positioned.fill(
                   child: DecoratedBox(
                       decoration:BoxDecoration(
                         gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           colors: [Colors.transparent,Color(0xFF0E0E0E)],
                         ),
                       ),
                   ),
               ),
               SafeArea(
                 child: Stack(
                   children: [
                     Align(
                       alignment: Alignment.topCenter,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 16),
                         child: Text(
                           name,
                           style: Theme.of(context).textTheme.titleLarge,
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 8, left: 16),
                         child: Container(
                           decoration: const BoxDecoration(
                             color: Color(0xFFEE403D),
                             shape: BoxShape.circle,
                           ),
                           child: IconButton(
                             onPressed: () {
                               Navigator.pop(context);
                             },
                             icon: const Icon(
                               Icons.arrow_back,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Padding(
                   padding: const EdgeInsets.all(16),
                   child: Text(
                     name,
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontWeight: FontWeight.w900,
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
         SizedBox(
           height: 300,
           child: Padding(
             padding: const EdgeInsets.all(24),
             child: Image.asset(
               image,
               fit: BoxFit.contain,
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'About',
                 style: Theme.of(context).textTheme.titleLarge,
               ),
               const SizedBox(height: 8),
               Text(
                 'Earth is the only known planet in the universe that supports life. '
                     'Its unique combination of factors, including liquid water, a breathable '
                     'atmosphere, and a suitable distance from the Sun, has created the ideal '
                     'conditions for the development of complex organisms.',
                 style: Theme.of(context).textTheme.bodyLarge,
               ),
               _fact('Distance from Sun (km)', '149598026'),
               _fact('Length of Day (hours)', '23.93'),
               _fact('Orbital Period (Earth years)', '1'),
               _fact('Radius (km)', '6371'),
               _fact('Mass (kg)', '5.972 × 10²⁴'),
               _fact('Gravity (m/s²)', '9.81'),
               _fact('Surface Area (km²)', '5.10 × 10⁸'),
             ],

           ),
         ),
       ],
     ),
     ),
   );
  }
}