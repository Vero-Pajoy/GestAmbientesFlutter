class InstructoresProvider{
  List<Map<String, dynamic>> _instructores;

  static final InstructoresProvider _instancia = InstructoresProvider._privado();

  InstructoresProvider._privado(){
    _instructores=[];
  }

  factory InstructoresProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get instructores{
    return _instructores;
  }

  void agregarInstructor(Map<String, dynamic> nuevoInstructor){
    _instructores.add(nuevoInstructor);
  }

  void editarInstructor(Map<String, dynamic> moficarInstructor, Map<String, dynamic> actualInstructor){
    for(var i=0; i<_instructores.length; i++){
      if(_instructores[i]==actualInstructor){
        _instructores[i]=moficarInstructor;
        break;
      }
    }
  }

  void eliminarInstructor(Map<String, dynamic> borrarInstructor){
    _instructores.remove(borrarInstructor);
  }

  void terminarInstructor(Map<String, dynamic> actualInstructor){
    for(var i=0; i<_instructores.length; i++){
      actualInstructor['Estado']=true;
      _instructores[i]=actualInstructor;
      break;
    }
  }
}
