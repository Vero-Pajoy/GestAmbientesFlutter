class SedesProvider{
  List<Map<String, dynamic>> _sedes;

  static final SedesProvider _instancia = SedesProvider._privado();

  SedesProvider._privado(){
    _sedes=[];
  }

  factory SedesProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get sedes{
    return _sedes;
  }

  void agregarSede(Map<String, dynamic> nuevoSede){
    _sedes.add(nuevoSede);
  }

  void editarSede(Map<String, dynamic> moficarSede, Map<String, dynamic> actualSede){
    for(var i=0; i<_sedes.length; i++){
      if(_sedes[i]==actualSede){
        _sedes[i]=moficarSede;
        break;
      }
    }
  }

  void eliminarSede(Map<String, dynamic> borrarSede){
    _sedes.remove(borrarSede);
  }

  void terminarSede(Map<String, dynamic> actualSede){
    for(var i=0; i<_sedes.length; i++){
      actualSede['Estado']=true;
      _sedes[i]=actualSede;
      break;
    }
  }
}
