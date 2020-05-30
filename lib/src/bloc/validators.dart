import 'dart:async';


class Validators {


  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){

      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);

      if(regex.hasMatch(email)){
        sink.add(email);
      } else {
        sink.addError('El email no tiene un formato correcto');
      }

    }
  );


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){

      if(password.length >= 6){
        sink.add(password);
      } else {
        sink.addError('La contraseña debe tener más de 6 caracteres');
      }
    }
  );

}