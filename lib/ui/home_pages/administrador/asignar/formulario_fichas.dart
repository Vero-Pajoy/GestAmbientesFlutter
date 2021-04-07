import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/fichas/fichas_provider.dart';
import 'asignar_ficha.dart';

class FormularioFichas extends StatefulWidget{
  //FormularioFichas({Key key}): super(key: key);
  static final nombrePagina = "Formulario de Fichas";

  _FormularioFichasState createState() => _FormularioFichasState();
}

class Ambiente{
  int id;
  String nombre;

  Ambiente(this.id, this.nombre);

  static List<Ambiente> getAmbientes(){
    return <Ambiente>[
      Ambiente(1,'Sofware 1'),
      Ambiente(2,'Sofware 2'),
      Ambiente(3,'Archivo 1'),
      Ambiente(4,'Archivo 2'),
    ];
  }
}

class _FormularioFichasState extends State<FormularioFichas> {

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

  final List<String> instructores = <String>['Jeison Solarte','Ada Lorena Cerón','Jairo España'];
  String selectedIntructor = 'Jeison Solarte';

  Map<String, dynamic> ficha;
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic> nuevaFicha={};

  @override
  Widget build(BuildContext context) {

    //Se trae la información de la ficha creada para editarla
    ficha = ModalRoute.of(context).settings.arguments;

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
                        _crearInputCodigo(),
                        //_crearInputNombreJefe(),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Jefe de ficha', style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)),),
                            DropdownButton<String>(
                              value: selectedIntructor,
                              onChanged: (String string) => setState(() =>
                              selectedIntructor = string),
                              selectedItemBuilder: (BuildContext context) {
                                return instructores.map<Widget>((String item) {
                                  return Text(item);
                                }).toList();
                              },
                              items: instructores.map((String item) {
                                return DropdownMenuItem<String>(
                                  child: Text(item),
                                  value: item,
                                );
                              }).toList(),
                            ),
                          ],
                        ),SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ambiente', style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)),),
                            DropdownButton(
                              value: _selectedAmbiente,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                            ),
                          ],
                        ),
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

  _crearInputCodigo(){
    return TextFormField(
      initialValue: (ficha!=null)?ficha['Ficha']:"",
      onSaved: (valor){
        nuevaFicha['Ficha']=valor;
      },//Guarda el valor y lo manda al boton
      decoration: InputDecoration(
      hintText: "Código de ficha",
      ),
    );
  }

  _crearInputNombreJefe(){
    return TextFormField(
      initialValue: (ficha!=null)?ficha['Jefe']:"",
      onSaved: (valor){
        nuevaFicha['Jefe']=valor;
      },
      decoration: InputDecoration(
        hintText: "Jefe de ficha",
      ),
    );
  }

  _crearInputAmbiente(){
    return TextFormField(
      initialValue: (ficha!=null)?ficha['Ambiente']:"",
      onSaved: (valor){
        nuevaFicha['Ambiente']=valor;
      },
      decoration: InputDecoration(
        hintText: "Ambiente",
      ),
    );
  }

  _botonCrear(BuildContext context){
    return RaisedButton(
      elevation: 8,
      color: Colors.white,
      onPressed:() {
        idForm.currentState.save();
        nuevaFicha['Estado']=false;

        if(ficha!=null){
          FichasProvider().editarFicha(nuevaFicha, ficha);
          //Se devolvera hasta que encuentra la ruta indicada en este
          Navigator.popUntil(context, ModalRoute.withName(AsignarFicha.nombrePagina));
        }else{
          FichasProvider().agregarFicha(nuevaFicha);
          //Se devuelve a una vista anterior
          Navigator.pop(context);
        }
      },
      child: (ficha!=null)?Text('Editar ficha',
        style: TextStyle(fontSize: 20),):
      Text('Crear ficha', style: TextStyle(fontSize: 20),),
    );
  }
}