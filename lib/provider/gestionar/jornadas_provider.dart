class JornadasProvider{
  List<Map<String, dynamic>> _jornadas;

  static final JornadasProvider _instancia = JornadasProvider._privado();

  JornadasProvider._privado(){
    _jornadas=[];
  }

  factory JornadasProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get jornadas{
    return _jornadas;
  }

  void agregarJornada(Map<String, dynamic> nuevoJornada){
    _jornadas.add(nuevoJornada);
  }

  void editarJornada(Map<String, dynamic> moficarJornada, Map<String, dynamic> actualJornada){
    for(var i=0; i<_jornadas.length; i++){
      if(_jornadas[i]==actualJornada){
        _jornadas[i]=moficarJornada;
        break;
      }
    }
  }

  void eliminarJornada(Map<String, dynamic> borrarJornada){
    _jornadas.remove(borrarJornada);
  }

  void terminarJornada(Map<String, dynamic> actualJornada){
    for(var i=0; i<_jornadas.length; i++){
      actualJornada['Estado']=true;
      _jornadas[i]=actualJornada;
      break;
    }
  }
}
