class AmbientesProvider{
  List<Map<String, dynamic>> _ambientes;

  static final AmbientesProvider _instancia = AmbientesProvider._privado();

  AmbientesProvider._privado(){
    _ambientes=[];
  }

  factory AmbientesProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get ambientes{
    return _ambientes;
  }

  void agregarAmbiente(Map<String, dynamic> nuevoAmbiente){
    _ambientes.add(nuevoAmbiente);
  }

  void editarAmbiente(Map<String, dynamic> moficarAmbiente, Map<String, dynamic> actualAmbiente){
    for(var i=0; i<_ambientes.length; i++){
      if(_ambientes[i]==actualAmbiente){
        _ambientes[i]=moficarAmbiente;
        break;
      }
    }
  }

  void eliminarAmbiente(Map<String, dynamic> borrarAmbiente){
    _ambientes.remove(borrarAmbiente);
  }

  void terminarAmbiente(Map<String, dynamic> actualAmbiente){
    for(var i=0; i<_ambientes.length; i++){
      actualAmbiente['Estado']=true;
      _ambientes[i]=actualAmbiente;
      break;
    }
  }
}
