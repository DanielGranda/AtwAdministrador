class Usuarios {
  List<Usuario> items=new List();
  Usuarios();

  Usuarios.fromJsonList(List<dynamic>jsonList){
    if (jsonList ==null) return;
    for (var item in jsonList) {
      final usuario = new Usuario.fromJsonMap(item);
      items.add(usuario);
      
    }
  }
}


class Usuario{
  String email;
  String slogan;

  Usuario({this.email, this.slogan});

  Usuario.fromJsonMap(Map<String, dynamic>json){
    email =json['email'];
    slogan =json['slogan'];
  }
}