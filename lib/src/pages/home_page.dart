import 'package:firebase_crud/src/pages/insert_page.dart';
import 'package:firebase_crud/src/pages/modify_page.dart';
import 'package:firebase_crud/src/pages/view_page.dart';
import 'package:firebase_crud/src/widgets/benziercontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          body: _callPage(currentIndex),
      bottomNavigationBar: _bottomnavigation(),
      //floatingActionButton: _floatingbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  
  }


  Widget _bottomnavigation(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex=index;
        });
      },
      backgroundColor: Color(0xffe46b10),
      items: [

      BottomNavigationBarItem(
        icon:Icon(Icons.add_circle_rounded,color: Colors.white,),
        title: Container() 
      ),
      BottomNavigationBarItem(
        icon:Icon(Icons.list_outlined,color: Colors.white,),
        title: Container() 
      ),

      ]
      
    );
  }
/*
  Widget _floatingbutton(){
    return FloatingActionButton(
      backgroundColor: Color(0xffe46b10),
      onPressed: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InsertPage()));
      },
      child: Icon(Icons.add_circle_rounded,color: Colors.white),

    );
  }
*/
  Widget _callPage(int paginactual){
    switch (paginactual) {
      case 0: return InsertPage();
      case 1: return ViewPage();
      default: return HomePage();
    }

  }
}
