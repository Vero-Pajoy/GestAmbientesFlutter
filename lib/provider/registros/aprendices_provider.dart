class AprendicesProvider{
  List<Map<String, dynamic>> _aprendices;

  static final AprendicesProvider _instancia = AprendicesProvider._privado();

  AprendicesProvider._privado(){
    _aprendices=[];
  }

  factory AprendicesProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get aprendices{
    return _aprendices;
  }

  void agregarAprendiz(Map<String, dynamic> nuevoAprendiz){
    _aprendices.add(nuevoAprendiz);
  }

  void editarAprendiz(Map<String, dynamic> moficarAprendiz, Map<String, dynamic> actualAprendiz){
    for(var i=0; i<_aprendices.length; i++){
      if(_aprendices[i]==actualAprendiz){
        _aprendices[i]=moficarAprendiz;
        break;
      }
    }
  }

  void eliminarAprendiz(Map<String, dynamic> borrarAprendiz){
    _aprendices.remove(borrarAprendiz);
  }

  void terminarAprendiz(Map<String, dynamic> actualAprendiz){
    for(var i=0; i<_aprendices.length; i++){
      actualAprendiz['Estado']=true;
      _aprendices[i]=actualAprendiz;
      break;
    }
  }
}
