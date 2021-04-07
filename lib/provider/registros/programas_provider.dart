class ProgramasProvider{
  List<Map<String, dynamic>> _programas;

  static final ProgramasProvider _instancia = ProgramasProvider._privado();

  ProgramasProvider._privado(){
    _programas=[];
  }

  factory ProgramasProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get programas{
    return _programas;
  }

  void agregarPrograma(Map<String, dynamic> nuevoPrograma){
    _programas.add(nuevoPrograma);
  }

  void editarPrograma(Map<String, dynamic> moficarPrograma, Map<String, dynamic> actualPrograma){
    for(var i=0; i<_programas.length; i++){
      if(_programas[i]==actualPrograma){
        _programas[i]=moficarPrograma;
        break;
      }
    }
  }

  void eliminarPrograma(Map<String, dynamic> borrarPrograma){
    _programas.remove(borrarPrograma);
  }

  void terminarPrograma(Map<String, dynamic> actualPrograma){
    for(var i=0; i<_programas.length; i++){
      actualPrograma['Estado']=true;
      _programas[i]=actualPrograma;
      break;
    }
  }
}
