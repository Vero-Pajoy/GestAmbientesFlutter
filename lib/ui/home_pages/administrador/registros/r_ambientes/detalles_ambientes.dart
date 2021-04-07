import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/registros/ambientes_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/formulario_ambientes.dart';

class DetallesAmbiente extends StatelessWidget{
  const DetallesAmbiente({Key key}): super(key:key);

  static final nombrePagina = "Detalles de ambiente";

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> ambiente = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
        actions: [
          Row(
            children: [SizedBox(width: 20,),
              SizedBox(width: 100,),
              Text('DETALLES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 120,),
              CircleAvatar(
                backgroundColor: Colors.white54,
                child: Image.asset('assets/logo/portada.png'),
              ),SizedBox(width: 30,),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children:<Widget> [
                  SizedBox(height: 40,),
                  Text('Ambiente: ' + "${ambiente['Nombre']}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Container(height: 3, color: Colors.orangeAccent, margin: EdgeInsets.only(left: 100, right: 100),),SizedBox(height: 40,),

                  Text('Capacidad de aprendices',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${ambiente['Capacidad']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Ubicación',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${ambiente['Ubicación']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Sede',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${ambiente['Sede']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Disponibilidad', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${ambiente['Disponibilidad']}",
                    style: TextStyle(fontSize: 20, color: Colors.brown,),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget> [
                  RaisedButton(
                    elevation: 8,
                    textColor: Colors.brown,
                    color: Colors.white,
                    onPressed: (){
                      AmbientesProvider().terminarAmbiente(ambiente);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.close_fullscreen),SizedBox(width: 5,),
                        Text("Terminar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  RaisedButton(
                    elevation: 8,
                    textColor: Colors.brown,
                    color: Colors.white,
                    onPressed: () =>Navigator.pushNamed(context, FormularioAmbientes.nombrePagina, arguments: ambiente),
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined),SizedBox(width: 5,),
                        Text("Editar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  RaisedButton(
                      elevation: 8,
                      textColor: Colors.brown,
                      color: Colors.white,
                      onPressed: (){
                        AmbientesProvider().eliminarAmbiente(ambiente);
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.remove_circle_outline),SizedBox(width: 5,),
                          Text("Eliminar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      )
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