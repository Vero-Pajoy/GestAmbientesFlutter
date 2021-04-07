class UbicacionProvider{
  List<Map<String, dynamic>> _ubicaciones;

  static final UbicacionProvider _instancia = UbicacionProvider._privado();

  UbicacionProvider._privado(){
    _ubicaciones=[];
  }

  factory UbicacionProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get ubicaciones{
    return _ubicaciones;
  }

  void agregarUbicacion(Map<String, dynamic> nuevoUbicacion){
    _ubicaciones.add(nuevoUbicacion);
  }

  void editarUbicacion(Map<String, dynamic> moficarUbicacion, Map<String, dynamic> actualUbicacion){
    for(var i=0; i<_ubicaciones.length; i++){
      if(_ubicaciones[i]==actualUbicacion){
        _ubicaciones[i]=moficarUbicacion;
        break;
      }
    }
  }

  void eliminarUbicacion(Map<String, dynamic> borrarUbicacion){
    _ubicaciones.remove(borrarUbicacion);
  }

  void terminarUbicacion(Map<String, dynamic> actualUbicacion){
    for(var i=0; i<_ubicaciones.length; i++){
      actualUbicacion['Estado']=true;
      _ubicaciones[i]=actualUbicacion;
      break;
    }
  }
}
