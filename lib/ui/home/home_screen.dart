import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:g_ambientes/ui/api_clima/api_clima.dart';
import 'package:g_ambientes/ui/home_pages/administrador/asignar/asignar_ficha.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/gestionar_general/gestionar.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/registros_general/registros.dart';
import 'package:g_ambientes/ui/perfil/credenciales.dart';
import 'package:g_ambientes/ui/perfil/modificar_perfil.dart';

const PRIMARY = "primary";
const WHITE = "white";

const Map<String, Color> myColors={
  PRIMARY: Color.fromRGBO(247, 148, 94, 1.0),
  WHITE: Colors.white,
};

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  var images = [
    "https://scontent-bog1-1.xx.fbcdn.net/v/t31.0-8/12977143_1076045742470415_7995394311988920499_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=19026a&_nc_ohc=ylD-ALXZUcUAX8YG0Zt&_nc_ht=scontent-bog1-1.xx&oh=28131021555fb2ee1d0c2a7417baf0fc&oe=607FE33B",
    //"https://i1.wp.com/computerworld.co/wp-content/uploads/2017/11/20171107_SENA-Sal%C3%B3n-ideas-vida-academica-e1510053782174.jpg?fit=603%2C303&ssl=1",
    "https://scontent-bog1-1.xx.fbcdn.net/v/t1.0-9/89514401_3595703697171261_5133113915953119232_o.jpg?_nc_cat=105&ccb=1-3&_nc_sid=730e14&_nc_ohc=Sk7nk09wXAIAX8SfUEr&_nc_ht=scontent-bog1-1.xx&oh=d185d51b3291c8983ebb4c9b1b41e5fc&oe=6082057A",
    "https://scontent.fclo7-1.fna.fbcdn.net/v/t31.18172-8/12970897_1076042379137418_7250758910320817610_o.jpg?_nc_cat=105&ccb=1-3&_nc_sid=174925&_nc_ohc=Awxr_iBpO04AX9EvFbs&_nc_ht=scontent.fclo7-1.fna&oh=46af18569429e69f3e8a34cd845cac34&oe=6089B312",
  ];

  GlobalKey<ScaffoldState> _scaffolldKey = GlobalKey<ScaffoldState>();
  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffolldKey,
      backgroundColor: myColors[PRIMARY],
      drawer: Drawer(
        child: Container(
          color: Colors.orangeAccent.withOpacity(0.1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Colors.brown[300],
                child: Column(
                  children: [
                    Container(color: myColors[PRIMARY], padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          SizedBox(height: 27,),
                          Padding(
                            padding: const EdgeInsets.only(left: 260),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios, color: Colors.white60, size: 33,),
                              onPressed: _closeEndDrawer,
                            ),
                          ),SizedBox(height: 0,),
                          UserAccountsDrawerHeader(
                            accountName: Text('Harold Rosero',style: TextStyle(fontSize: 28),),
                            decoration: BoxDecoration(
                              color: myColors[PRIMARY],
                            ),
                            accountEmail: Text('ADMNISTRADOR'),
                            currentAccountPicture: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                  'assets/logo/portada1.png'
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),Container(height: 10, color: Colors.brown[200],), SizedBox(height: 30,),
              ListTile(
                title: Text('Perfil',style: TextStyle(
                    color: Colors.brown, fontSize: 19),),
                leading: Icon(Icons.person_outline, color: Colors.brown, size: 25,),
                onTap: () => Navigator.pushNamed(context, ModificarPerfil.nombrePagina),
              ),SizedBox(height: 20,),
              ListTile(
                title: Text('Credenciales',style: TextStyle(
                    color: Colors.brown, fontSize: 19),),
                leading: Icon(Icons.verified_user_outlined, color: Colors.brown, size: 25,),
                onTap: () => Navigator.pushNamed(context, Credenciales.nombrePagina),
              ),
              SizedBox(height: 430,),
              Divider(thickness: 2,),
              ListTile(
                title: Text('Cerrar sesión',style: TextStyle(
                    color: Colors.brown, fontSize: 19),),
                leading: Icon(Icons.exit_to_app_outlined, color: Colors.brown, size: 25,),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
              ),
              ListTile(
                title: Text('Clima',style: TextStyle(
                    color: Colors.brown, fontSize: 19),),
                leading: Icon(Icons.public, color: Colors.brown, size: 25,),
                onTap: (){
                  Navigator.pushNamed(context, RespuestaApiUi.nombrePagina);
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: myColors[WHITE],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 40,),
                      PreferredSize(
                        preferredSize: Size.fromHeight(70),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.menu, color: myColors[PRIMARY], size: 30,
                                ),
                                onPressed: () => _scaffolldKey.currentState.openDrawer(),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white54,
                                child: Image.asset('assets/logo/portada.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Positioned(
                        child: Container(
                          //Contiene Image Background
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/logo/fuente.png',
                            height: size.height * 0.1,
                          ),
                        ),
                      ),
                      Container(
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(images[index],
                              fit: BoxFit.cover,);
                          },
                          layout: SwiperLayout.TINDER,
                          itemHeight: size.height * 0.45,
                          itemWidth: size.width * 0.86,
                          //autoplay: true,
                          //itemCount: images.length,
                          itemCount: 3,
                          pagination: new SwiperPagination(),
                          // control: new SwiperControl(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 230, top: 30,bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AsignarFicha.nombrePagina);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_forward, color: Colors.white, size: 26,),SizedBox(width: 4,),
                          Text('Asignar ficha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
                        ],
                      )),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Registros.nombrePagina);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.white, size: 26,),SizedBox(width: 4,),
                        Text('Registros', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Gestionar.nombrePagina);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.white, size: 26,),SizedBox(width: 4,),
                        Text('Gestionar otros', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}