// ignore_for_file: file_names, type_annotate_public_apis, prefer_typing_uninitialized_variables, lines_longer_than_80_chars

var acessToken;

void setToken(String token) => acessToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

getToken() => acessToken;

String someString() => 'asdas';

int someInt() => 1;
