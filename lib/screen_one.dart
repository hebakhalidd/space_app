import 'package:flutter/material.dart';
import 'package:space_app/screen_two.dart';
import 'package:google_fonts/google_fonts.dart';
class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}
class _ScreenOneState extends State<ScreenOne> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<Map<String, String>> planets = [
    {'name': 'Mercury', 'image': 'assets/images/mercury.png'},
    {'name': 'Earth', 'image': 'assets/images/earth.png'},
    {'name': 'Jupiter', 'image': 'assets/images/jupiter.png'},
    {'name': 'Mars', 'image': 'assets/images/mars.png'},
    {'name': 'Neptune', 'image': 'assets/images/neptune.png'},
    {'name': 'Saturn', 'image': 'assets/images/saturn.png'},
    {'name': 'Sun', 'image': 'assets/images/sun.png'},
    {'name': 'Venus', 'image': 'assets/images/venus.png'},
    {'name': 'Uranus', 'image': 'assets/images/uranus.png'},
  ];
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            child:DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end:  Alignment.bottomCenter,
                                    colors: [Colors.transparent,Color(0xFF0E0E0E)],
                                  ),
                                ),
                            ),
                        ),
                        SafeArea(
                          child : Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              'Explore',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                        ),
                         Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Which planet\nwould you like to explore?',
                              style: GoogleFonts.spaceGrotesk(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
              ]
                    ),
                  ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: planets.length,
                    onPageChanged: (index){
                      setState(() {
                        _currentIndex=index;
                      });
                    },
                    itemBuilder: (context,index){
                      return Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 16,vertical:24 ),
                      child: Image.asset(planets[index]['image']!,
                      fit: BoxFit.contain,)
                        ,);
                    },
                  ),
                  ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFEE403D),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: (){
                          _controller.previousPage(duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                          );
                        },
                          icon: const Icon(Icons.arrow_back,color: Colors.white),
                      ),
                    ),
                    Text(planets[_currentIndex]['name']!,
                    style: Theme.of(context).textTheme.titleLarge
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0XFFEE403D),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(onPressed: (){
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                          icon: const Icon(Icons.arrow_forward,color: Colors.white,)),
                    )
                  ],
                ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding:const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ScreenTwo(
                              name: planets[_currentIndex]['name']!,
                              image: planets[_currentIndex]['image']!,
                          ),
                          ),
                      );
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEE403D),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(16),
                          shape: const StadiumBorder(),
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Explore ${planets[_currentIndex]['name']}',
                          style: const TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward,size:22)
                        ],
                      ),
                        )
                  ),),
                ),
              ],
            ),
      
    );
  }
}