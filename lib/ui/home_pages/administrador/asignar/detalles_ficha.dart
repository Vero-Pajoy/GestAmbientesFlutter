import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/fichas/fichas_provider.dart';
import 'formulario_fichas.dart';

class DetallesFicha extends StatefulWidget{
  const DetallesFicha({Key key}): super(key:key);

  static final nombrePagina = "Detalles de ficha";

  @override
  _DetallesFichaState createState() => _DetallesFichaState();
}

class Ambiente{
  int id;
  String nombre;

  Ambiente(this.id, this.nombre);

  static List<Ambiente> getAmbientes(){
    return <Ambiente>[
      Ambiente(2,'Sofware 2'),
      Ambiente(3,'Archivo 1'),
      Ambiente(4,'Archivo 2'),
    ];
  }
}

class _DetallesFichaState extends State<DetallesFicha> {

  List<Ambiente> _ambientes = Ambiente.getAmbientes();
  List<DropdownMenuItem<Ambiente>> _dropdownMenuItems;
  Ambiente _selectedAmbiente;

  @override
  void initState() {
    _dropdownMenuItems = builDropdownMenuItems(_ambientes);
    _selectedAmbiente = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Ambiente>> builDropdownMenuItems(List ambientes){
    List<DropdownMenuItem<Ambiente>> items = List();
    for (Ambiente ambiente in ambientes){
      items.add(
          DropdownMenuItem(
            value: ambiente,
            child: Text(ambiente.nombre),
          ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Ambiente selectedAmbiente){
    setState(() {
      _selectedAmbiente = selectedAmbiente;
    });
  }

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> ficha = ModalRoute.of(context).settings.arguments;

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
                  Text('Ficha ' + "${ficha['Ficha']}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Container(height: 3, color: Colors.orangeAccent, margin: EdgeInsets.only(left: 150, right: 150),),SizedBox(height: 40,),
                  Text('Jefe de ficha',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  /*Text("${ficha['Jefe']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),*/
                  Text('Jeison Solarte', style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Ambiente', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  /*Text("${ficha['Ambiente']}",
                    style: TextStyle(fontSize: 20, color: Colors.brown,),),*/
                  Text('${_selectedAmbiente.nombre}', style: TextStyle(fontSize: 20, color: Colors.brown,),),
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
                      FichasProvider().terminarFicha(ficha);
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
                    onPressed: () =>Navigator.pushNamed(context, FormularioFichas.nombrePagina, arguments: ficha,),
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
                        FichasProvider().eliminarFicha(ficha);
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