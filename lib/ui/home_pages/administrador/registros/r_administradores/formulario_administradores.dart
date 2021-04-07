import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/registros/administradores_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_administradores/r_administradores.dart';

class FormularioAdministradores extends StatefulWidget{
  //FormularioAdministradores({Key key}): super(key: key);
  static final nombrePagina = "Formulario de administradores";

  _FormularioAdministradoresState createState() => _FormularioAdministradoresState();
}

class _FormularioAdministradoresState extends State<FormularioAdministradores> {

  Map<String, dynamic> administrador;
  final GlobalKey<FormState> _idFormA = GlobalKey<FormState>();
  Map<String, dynamic> nuevoAdministrador={};

  @override
  Widget build(BuildContext context) {

    //Se trae la información del administrador creada para editarla
    administrador = ModalRoute.of(context).settings.arguments;

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
                        _crearInputTipoP(), SizedBox(height: 30,),
                        _crearInputNombres(), SizedBox(height: 30,),
                        _crearInputTipoIdent(), SizedBox(height: 30,),
                        _crearInputNumeroIdent(), SizedBox(height: 30,),
                        _crearInputTelefono(), SizedBox(height: 30,),
                        _crearInputCorreo(), SizedBox(height: 30,),
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

  _crearInputTipoP(){
    return TextFormField(
      initialValue: (administrador!=null)?administrador['Tipo de persona']:"",
      onSaved: (valor){
        nuevoAdministrador['Tipo de persona']=valor;
      },//Guarda el valor y lo manda al boton
      decoration: InputDecoration(
        hintText: "Tipo de persona",
      ),
    );
  }

  _crearInputNombres(){
    return TextFormField(
      initialValue: (administrador!=null)?administrador['Nombres']:"",
      onSaved: (valor){
        nuevoAdministrador['Nombres']=valor;
      },//Guarda el valor y lo manda al boton
      decoration: InputDecoration(
        hintText: "Nombre completo",
      ),
    );
  }

  _crearInputTipoIdent(){
    return TextFormField(
      initialValue: (administrador!=null)?administrador['Tipo de identidad']:"",
      onSaved: (valor){
        nuevoAdministrador['Tipo de identidad']=valor;
      },
      decoration: InputDecoration(
        hintText: "Tipo de identidad",
      ),
    );
  }

  _crearInputNumeroIdent(){
    return TextFormField(
      initialValue: (administrador!=null)?administrador['Número de identidad']:"",
      onSaved: (valor){
        nuevoAdministrador['Número de identidad']=valor;
      },
      decoration: InputDecoration(
        hintText: "Número de identidad",
      ),
    );
  }
  _crearInputTelefono(){
    return TextFormField(
      initialValue: (administrador!=null)?administrador['Télefono celular']:"",
      onSaved: (valor){
        nuevoAdministrador['Télefono celular']=valor;
      },
      decoration: InputDecoration(
        hintText: "Télefono celular",
      ),
    );
  }
  _crearInputCorreo(){
    return TextFormField(
      initialValue: (administrador!=null)?administrador['Correo']:"",
      onSaved: (valor){
        nuevoAdministrador['Correo']=valor;
      },
      decoration: InputDecoration(
        hintText: "Correo",
      ),
    );
  }

  _botonCrear(BuildContext context){
    return RaisedButton(
      elevation: 8,
      color: Colors.white,
      onPressed:() {
        _idFormA.currentState.save();
        nuevoAdministrador['Estado']=false;

        if(administrador!=null){
          AdministradoresProvider().editarAdministrador(nuevoAdministrador, administrador);
          //Se devolvera hasta que encuentra la ruta indicada en este
          Navigator.popUntil(context, ModalRoute.withName(Administradores.nombrePagina));
        }else{
          AdministradoresProvider().agregarAdministrador(nuevoAdministrador);
          //Se devuelve a una vista anterior
          Navigator.pop(context);
        }
      },
      child: (administrador!=null)?Text('Editar administrador',
        style: TextStyle(fontSize: 20),):
      Text('Crear administrador', style: TextStyle(fontSize: 20),),
    );
  }
}