import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/l_disponibilidades.dart';

class DisponibilidadProvider{
  List<Map<String, dynamic>> _actividades;

  static final DisponibilidadProvider _instancia = DisponibilidadProvider._privado();

  DisponibilidadProvider._privado(){
    _actividades=[];
  }

  factory DisponibilidadProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get actividades{
    return _actividades;
  }

  void agregarActividad(Map<String, dynamic> nuevaActividad){
    _actividades.add(nuevaActividad);
  }

  void editarActividad(Map<String, dynamic> moficarActividad, Map<String, dynamic> actualActividad){
    for(var i=0; i<_actividades.length; i++){
      if(_actividades[i]==actualActividad){
        _actividades[i]=moficarActividad;
        break;
      }
    }
  }

  void eliminarActividad(Map<String, dynamic> borrarActividad){
    _actividades.remove(borrarActividad);
  }

  void terminarActividad(Map<String, dynamic> actualActividad){
    for(var i=0; i<_actividades.length; i++){
      actualActividad['Estado']=true;
      _actividades[i]=actualActividad;
        break;
    }
  }
}
