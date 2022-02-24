import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/CliniqueModel.dart';

class WebService {
  String endpoint = 'http://41.226.168.150:8000/dmi-core/DossierSoinWSService';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('adminWS:pom'));

  listCliniques() async {
    var envelope = '''<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <ListCliniqueForAndroidByModule xmlns="http://service.dmi.csys.com/">
            <arg0 xmlns="">Comptes_Rendu</arg0>
        </ListCliniqueForAndroidByModule>
    </Body>
</Envelope>
        ''';
    http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          "SOAPAction":
          "https://service.dmi.csys.com/GetListDossierPatientResponse",
          "content-type": "text/xml",
          'content-encoding': 'gzip',
          'accept': 'text/xml',
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods":
          "POST, GET, OPTIONS, PUT, DELETE, HEAD",
          "Authorization": basicAuth,
          "cache-control": "no-cache"
        },
        body: envelope);
    // The server's response should be the raw XML output.
    var rawXmlResponse = response.body;
    XmlDocument parsedXml = XmlDocument.parse(rawXmlResponse);
    List<clinique> list = clinique.cliniqueFromXML(parsedXml);
    return list;
  }
  Future<bool> checkClinique(String user, String password) {
    if (user == 'foo@foo.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
