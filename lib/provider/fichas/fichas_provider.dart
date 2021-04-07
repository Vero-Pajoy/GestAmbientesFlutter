class FichasProvider{
  List<Map<String, dynamic>> _fichas;

  static final FichasProvider _instancia = FichasProvider._privado();

  FichasProvider._privado(){
    _fichas=[];
  }

  factory FichasProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get fichas{
    return _fichas;
  }

  void agregarFicha(Map<String, dynamic> nuevaFicha){
    _fichas.add(nuevaFicha);
  }

  void editarFicha(Map<String, dynamic> moficarFicha, Map<String, dynamic> actualFicha){
    for(var i=0; i<_fichas.length; i++){
      if(_fichas[i]==actualFicha){
        _fichas[i]=moficarFicha;
        break;
      }
    }
  }

  void eliminarFicha(Map<String, dynamic> borrarFicha){
    _fichas.remove(borrarFicha);
  }

  void terminarFicha(Map<String, dynamic> actualFicha){
    for(var i=0; i<_fichas.length; i++){
      actualFicha['Estado']=true;
        _fichas[i]=actualFicha;
        break;
    }
  }
}
