import 'package:altas_c/see_Supplier.dart';
import 'package:flutter/material.dart';
import 'package:altas_c/release_Client.dart';
import 'package:altas_c/release_Supplier.dart';
import 'package:altas_c/disable_Client.dart';
import 'package:altas_c/disable_Supplier.dart';
import 'package:altas_c/release_Project.dart';

class CustomScreen extends StatefulWidget {
  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8470A1),
      drawer: buildNavigationDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF2F2740),
        title: Text("Principal", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildSearchContainer(),
            buildContentContainer(),
          ],
        ),
      ),
      bottomNavigationBar: buildCurvedBottomNavigationBar(),
    );
  }

  Widget buildSearchContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF463D5E),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    setState(() {
                      _searchText = text;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContentContainer() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF2F2740),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _searchText.isEmpty ? '' : 'Resultados para "$_searchText"',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCurvedBottomNavigationBar() {
    return ClipPath(
      clipper: BottomNavClipper(),
      child: Container(
        color: Color(0xFF2F2740),
        height: 72,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person, size: 28),
              ),
              label: 'Altas Clientes',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.group, size: 28),
              ),
              label: 'Altas proveedor',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.book, size: 28),
              ),
              label: 'Altas Proyectos',
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Release_Client()));
            } else if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Release_Provider()));
            }
            else if (index ==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Release_project()));
            }
          },
        ),
      ),
    );
  }

  Widget buildNavigationDrawer() {
    return Drawer(
      child: Container(
        color: Color(0xFF2F2740),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF463D5E),
              ),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_box_sharp, color: Colors.white),
              title: Text('Proveedores', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SeeSupplier()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_off_rounded, color: Colors.white),
              title: Text('Proveedores inhabilitados', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DisableSupplier()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_off, color: Colors.white),
              title: Text('Clientes inhabilitados', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DisableClient()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(3 * size.width / 4, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


