class ModalidadesProvider{
  List<Map<String, dynamic>> _niveles;

  static final ModalidadesProvider _instancia = ModalidadesProvider._privado();

  ModalidadesProvider._privado(){
    _niveles=[];
  }

  factory ModalidadesProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get niveles{
    return _niveles;
  }

  void agregarNivel(Map<String, dynamic> nuevoNivel){
    _niveles.add(nuevoNivel);
  }

  void editarNivel(Map<String, dynamic> moficarNivel, Map<String, dynamic> actualNivel){
    for(var i=0; i<_niveles.length; i++){
      if(_niveles[i]==actualNivel){
        _niveles[i]=moficarNivel;
        break;
      }
    }
  }

  void eliminarNivel(Map<String, dynamic> borrarNivel){
    _niveles.remove(borrarNivel);
  }

  void terminarNivel(Map<String, dynamic> actualNivel){
    for(var i=0; i<_niveles.length; i++){
      actualNivel['Estado']=true;
      _niveles[i]=actualNivel;
      break;
    }
  }
}
