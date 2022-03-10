import 'package:xml/xml.dart';

class clinique {
  String? code;
  String? id;
  String? nom;
  String? module;
  String? url;
  String? urllocal;

  clinique({this.code, this.id, this.nom, this.module, this.url , this.urllocal});

  static List<clinique> cliniqueFromXML(XmlDocument document) {
    List<clinique> list = [];
    document.findAllElements("return").forEach((element) {
      clinique cliniques =  clinique(
        code: element.findElements("code").first.text.toString(),
        id: element.findElements("id").first.text.toString(),
        module: element.findElements("module").first.text.toString(),
        nom: element.findElements("nom").first.text.toString(),
        url: element.findElements("url").first.text.toString(),
        urllocal: element.findElements("urllocal").first.text.toString(),
      );
      list.add(cliniques);
    });
    return list;
  }


}