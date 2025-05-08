import 'package:carousel_slider/carousel_slider.dart';
import 'package:flowchat_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {


  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> imgList = [
    "https://i.pinimg.com/736x/aa/df/9c/aadf9c7d7be3ad2d16ce75f747e69702.jpg",
    "https://i.pinimg.com/736x/aa/df/9c/aadf9c7d7be3ad2d16ce75f747e69702.jpg",
    "https://i.pinimg.com/736x/aa/df/9c/aadf9c7d7be3ad2d16ce75f747e69702.jpg",
    "https://i.pinimg.com/736x/aa/df/9c/aadf9c7d7be3ad2d16ce75f747e69702.jpg",
    "https://i.pinimg.com/736x/aa/df/9c/aadf9c7d7be3ad2d16ce75f747e69702.jpg",
    "https://i.pinimg.com/736x/aa/df/9c/aadf9c7d7be3ad2d16ce75f747e69702.jpg",
  ];
  final List<String> foodList = [
    "https://i.pinimg.com/736x/fa/88/be/fa88be14fd77a5f9a918094b223027fa.jpg",
    "https://i.pinimg.com/736x/fa/88/be/fa88be14fd77a5f9a918094b223027fa.jpg",
    "https://i.pinimg.com/736x/fa/88/be/fa88be14fd77a5f9a918094b223027fa.jpg",
    "https://i.pinimg.com/736x/fa/88/be/fa88be14fd77a5f9a918094b223027fa.jpg",
    "https://i.pinimg.com/736x/fa/88/be/fa88be14fd77a5f9a918094b223027fa.jpg",
    "https://i.pinimg.com/736x/fa/88/be/fa88be14fd77a5f9a918094b223027fa.jpg",

  ];

  final List<String> foodNames  = [
    "meat", "fish", "lazania", "pepperoni", "pizza", "rice",
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    buildCarouselIndicator(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i = 0; i < imgList.length; i++)
            Container(
              height: i == _currentPage ? 15 : 10,
              width: i == _currentPage ? 15 : 10,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: i == _currentPage ? Colors.grey[300] : Colors.grey,
                shape: BoxShape.circle,
              ),
            )
        ],
      );
    }
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey[100],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(()=> ProfileScreen());
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network("https://i.pinimg.com/736x/eb/76/a4/eb76a46ab920d056b02d203ca95e9a22.jpg",
                    ),
                  ),
                ),
              ),
            ),
            
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi Iyke,",
                  style: TextStyle(
                    fontSize: 12,
                  ),),
                  Text("Are you ready to order Today?",
                    style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ],
        ),

        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.menu,
          ),
        )],
      ),

      // backgroundColor: Colors.grey[100],
      body: Padding(
        padding:  EdgeInsets.all(screenHeight * 0.010 ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: screenHeight * 0.070 ,
                  width: screenWidth * 0.74,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, size: 30,),
                        SizedBox(width: 5,),
                        Text("Search your cravings...",
                          style: TextStyle(
                            color: Colors.black
                          )),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.03,),
                Container(
                  height: screenHeight * 0.070 ,
                  width: screenWidth* 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200]
                  ),
                  child: IconButton(
                    onPressed: (){
                    },
                    icon : Icon(Icons.shopping_cart),
                  color: Colors.grey,),
                ),
              ],
            ),

            SizedBox(height: 25,),

            Center(
              child: Column(
                children: [
                  CarouselSlider(
                    items: imgList.map((e)=>  Container(
                      width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(e, fit: BoxFit.cover,),
                    ),
                    ),).toList(),


                    options: CarouselOptions(
                      height: 150,
                    initialPage: 0,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (value,_){
                      setState(() {
                        _currentPage = value;
                      });
                    }
                    ),
                  ),

                 SizedBox(height: 10,),

                 buildCarouselIndicator(),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Select by category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),


            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context,index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(80),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(imgList[index],
                            // height: 100,
                            // width: 150,
                            //   // fit: BoxFit.cover,
                            ),

                          ),
                          
                          Text(foodNames[index]),
                        ],
                      ),
                    ),
                    
                  ),
                );
              }),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Popular Menu items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5,),

            SizedBox(
              height: 170,
              child: GridView.builder(
                itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 50,
                        decoration:  BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(foodList[index],
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: (){
      },
        child: Icon(
          Icons.location_on,
        color: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
          height: 65,
          color: Colors.transparent,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.home,
            size: 35,
            color: Colors.grey,
            ),
            Icon(Icons.favorite,
              size: 35,
              color: Colors.grey,
            ),
            Icon(Icons.star_border,
              size: 35,
              color: Colors.grey,
            ),
            Icon(Icons.person,
              size: 35,
              color: Colors.grey,
            ),
          ],
        ),
        ),


    );
  }
}
