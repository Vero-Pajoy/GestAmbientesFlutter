class AdministradoresProvider{
  List<Map<String, dynamic>> _administradores;

  static final AdministradoresProvider _instancia = AdministradoresProvider._privado();

  AdministradoresProvider._privado(){
    _administradores=[];
  }

  factory AdministradoresProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get administradores{
    return _administradores;
  }

  void agregarAdministrador(Map<String, dynamic> nuevoAdministrador){
    _administradores.add(nuevoAdministrador);
  }

  void editarAdministrador(Map<String, dynamic> moficarAdministrador, Map<String, dynamic> actualAdministrador){
    for(var i=0; i<_administradores.length; i++){
      if(_administradores[i]==actualAdministrador){
        _administradores[i]=moficarAdministrador;
        break;
      }
    }
  }

  void eliminarAdministrador(Map<String, dynamic> borrarAdministrador){
    _administradores.remove(borrarAdministrador);
  }

  void terminarAdministrador(Map<String, dynamic> actualAdministrador){
    for(var i=0; i<_administradores.length; i++){
      actualAdministrador['Estado']=true;
      _administradores[i]=actualAdministrador;
      break;
    }
  }
}
