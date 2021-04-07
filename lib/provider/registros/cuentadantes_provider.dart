class CuentadantesProvider{
  List<Map<String, dynamic>> _cuentadantes;

  static final CuentadantesProvider _instancia = CuentadantesProvider._privado();

  CuentadantesProvider._privado(){
    _cuentadantes=[];
  }

  factory CuentadantesProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get cuentadantes{
    return _cuentadantes;
  }

  void agregarCuentadante(Map<String, dynamic> nuevoCuentadante){
    _cuentadantes.add(nuevoCuentadante);
  }

  void editarCuentadante(Map<String, dynamic> moficarCuentadante, Map<String, dynamic> actualCuentadante){
    for(var i=0; i<_cuentadantes.length; i++){
      if(_cuentadantes[i]==actualCuentadante){
        _cuentadantes[i]=moficarCuentadante;
        break;
      }
    }
  }

  void eliminarCuentadante(Map<String, dynamic> borrarCuentadante){
    _cuentadantes.remove(borrarCuentadante);
  }

  void terminarCuentadante(Map<String, dynamic> actualCuentadante){
    for(var i=0; i<_cuentadantes.length; i++){
      actualCuentadante['Estado']=true;
      _cuentadantes[i]=actualCuentadante;
      break;
    }
  }
}
