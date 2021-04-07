import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/gestionar/disponibilidad_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/l_disponibilidades.dart';

class FormularioDisponibilidad extends StatefulWidget{
  //FormularioDisponibilidad({Key key}): super(key: key);
  static final nombrePagina = "Formulario de Actividades";

  _FormularioDisponibilidadState createState() => _FormularioDisponibilidadState();
}

class _FormularioDisponibilidadState extends State<FormularioDisponibilidad> {

  Map<String, dynamic> actividad;
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic> nuevaActividad={};

  @override
  Widget build(BuildContext context) {

    //Se trae la información de la actividad creada para editarla
    actividad = ModalRoute.of(context).settings.arguments;

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
                child: Container(margin: EdgeInsets.all(40.0),
                  child: Form(
                    key: idForm,
                    child: Column(
                      children: <Widget> [
                        _crearInputActividad(), SizedBox(height: 30,),
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

  _crearInputActividad(){
    return TextFormField(
      initialValue: (actividad!=null)?actividad['Actividad']:"",
      onSaved: (valor){
        nuevaActividad['Actividad']=valor;
      },//Guarda el valor y lo manda al boton
      decoration: InputDecoration(
      hintText: "Actividad",
      ),
    );
  }

  _botonCrear(BuildContext context){
    return RaisedButton(
      elevation: 8,
      color: Colors.white,
      onPressed:() {
        idForm.currentState.save();
        nuevaActividad['Estado']=false;

        if(actividad!=null){
          DisponibilidadProvider().editarActividad(nuevaActividad, actividad);
          //Se devolvera hasta que encuentra la ruta indicada en este
          Navigator.popUntil(context, ModalRoute.withName(Disponibilidad.nombrePagina));
        }else{
          DisponibilidadProvider().agregarActividad(nuevaActividad);
          //Se devuelve a una vista anterior
          Navigator.pop(context);
        }
      },
      child: (actividad!=null)?Text('Editar actividad',
        style: TextStyle(fontSize: 20),):
      Text('Crear actividad', style: TextStyle(fontSize: 20),),
    );
  }
}