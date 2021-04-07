import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/registros/ambientes_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/r_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/registros_general/registros.dart';

class FormularioAmbientes extends StatefulWidget{
  //FormularioAmbientes({Key key}): super(key: key);
  static final nombrePagina = "Formulario de ambientes";

  _FormularioAmbientesState createState() => _FormularioAmbientesState();
}

class _FormularioAmbientesState extends State<FormularioAmbientes> {

  Map<String, dynamic> ambiente;
  final GlobalKey<FormState> _idFormA = GlobalKey<FormState>();
  Map<String, dynamic> nuevoAmbiente={};

  @override
  Widget build(BuildContext context) {

    //Se trae la información del ambiente creada para editarla
    ambiente = ModalRoute.of(context).settings.arguments;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
        actions: [
          Row(
            children: [SizedBox(width: 20,),
              SizedBox(width: 128,),
              Text('FORMULARIO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 114,),
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
              child: SingleChildScrollView(
                child: Container(margin: EdgeInsets.all(30.0),
                  child: Form(
                    key: _idFormA,
                    child: Column(
                      children: <Widget> [
                        _crearInputNombre(), SizedBox(height: 30,),
                        _crearInputCapacidad(), SizedBox(height: 30,),
                        _crearInputUbicacion(), SizedBox(height: 30,),
                        _crearInputSede(), SizedBox(height: 30,),
                        _crearInputDisponibilidad(), SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: _botonCrear(context),
            ),
          ),
        ],
      ),
    );
  }

  _crearInputNombre(){
    return TextFormField(
      initialValue: (ambiente!=null)?ambiente['Nombre']:"",
      onSaved: (valor){
        nuevoAmbiente['Nombre']=valor;
      },//Guarda el valor y lo manda al boton
      decoration: InputDecoration(
        hintText: "Nombre del ambiente",
      ),
    );
  }

  _crearInputCapacidad(){
    return TextFormField(
      initialValue: (ambiente!=null)?ambiente['Capacidad']:"",
      onSaved: (valor){
        nuevoAmbiente['Capacidad']=valor;
      },
      decoration: InputDecoration(
        hintText: "Capacidad de aprendices",
      ),
    );
  }

  _crearInputUbicacion(){
    return TextFormField(
      initialValue: (ambiente!=null)?ambiente['Ubicación']:"",
      onSaved: (valor){
        nuevoAmbiente['Ubicación']=valor;
      },
      decoration: InputDecoration(
        hintText: "Ubicación",
      ),
    );
  }
  _crearInputSede(){
    return TextFormField(
      initialValue: (ambiente!=null)?ambiente['Sede']:"",
      onSaved: (valor){
        nuevoAmbiente['Sede']=valor;
      },
      decoration: InputDecoration(
        hintText: "Sede",
      ),
    );
  }
  _crearInputDisponibilidad(){
    return TextFormField(
      initialValue: (ambiente!=null)?ambiente['Disponibilidad']:"",
      onSaved: (valor){
        nuevoAmbiente['Disponibilidad']=valor;
      },
      decoration: InputDecoration(
        hintText: "Disponibilidad",
      ),
    );
  }

  _botonCrear(BuildContext context){
    return RaisedButton(
      elevation: 8,
      color: Colors.white,
      onPressed:() {
        _idFormA.currentState.save();
        nuevoAmbiente['Estado']=false;

        if(ambiente!=null){
          AmbientesProvider().editarAmbiente(nuevoAmbiente, ambiente);
          //Se devolvera hasta que encuentra la ruta indicada en este
          Navigator.popUntil(context, ModalRoute.withName(Ambientes.nombrePagina));
        }else{
          AmbientesProvider().agregarAmbiente(nuevoAmbiente);
          //Se devuelve a una vista anterior
          Navigator.pop(context);
        }
      },
      child: (ambiente!=null)?Text('Editar Ambiente',
        style: TextStyle(fontSize: 20),):
      Text('Crear ambiente', style: TextStyle(fontSize: 20),),
    );
  }
}