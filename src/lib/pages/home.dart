import 'package:flutter/material.dart';
import 'package:test1/models/article.dart';
import 'package:test1/pages/profile.dart';
import 'package:test1/pages/tabbar.dart';
import 'package:test1/services/api.dart';

import 'history.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key ? key}) : super(key: key) ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  late AnimationController animationController;
  late List<Widget> _pages;
  
  late PageController _pageController;

  List<String> userHistory = [];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void addToHistory(String title){
    setState(() {
      userHistory.add(title);
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _pages = <Widget>[
      Tabbar(
        isHideBottomNavBar: (isHideBottomNavBar) {
          isHideBottomNavBar ? animationController.forward() : animationController.reverse();
        },
        addToHistory: addToHistory,
      ),
      const Profile(),
      History(userHistory: userHistory),
    ];
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  ApiService apiService = ApiService();
  String searchQuery = '';
  List<Article> searchArticles = [];
   bool _isSearching = false;

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _isSearching ? AnimatedOpacity(
          opacity: _isSearching ? 1.0 : 0.0,
          duration:  const Duration(milliseconds: 300),
          child: const SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search.....',
                hintStyle: TextStyle(color: Colors.white60),
                border: InputBorder.none,
              ),
            ),
          ),
        )
        : const Text("News App", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: _toggleSearch,
            icon: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: const Icon(Icons.search),
              secondChild: const Icon(Icons.close),
              crossFadeState: _isSearching ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurpleAccent, size: 20),
        selectedItemColor: Colors.deepPurpleAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) => 
          page,
        transitionsBuilder: (
          BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
        ) => 
          FadeTransition(
            opacity: animation,
            child: child,
          ),
      );
}
