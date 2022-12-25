import 'package:http/http.dart' as http;
import 'dart:convert';
import '/models/models.dart';

class InfonilaService {
  static Future<List<ExploreStudent>> getAllStudent() async {
    late String token;
    int page = 1;
    Map data;
    List<ExploreStudent> mahasiswa = [];

    await getToken().then((value) {
      if (value != "404") {
        token = value;
      }
    });

    String prodi = '54BBD27B-2376-4CAE-9951-76EF54BD2CA2';
    var header = {"Authorization": token};

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$page&limit=100&sort_by=ASC&id_prodi=$prodi';

    http.Response response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      data = json.decode(response.body);

      if (data['data'] != null) {
        data['data'].forEach((v) {
          mahasiswa.add(ExploreStudent.fromJson(v));
        });
      } else {
        return [];
      }
    }
    return mahasiswa;
  }

  static Future<List<ExploreAlumni>> getAllAlumni() async {
    late String token;
    int page = 1;
    Map data;
    List<ExploreAlumni> alumni = [];

    await getToken().then((value) {
      if (value != "404") {
        token = value;
      }
    });

    String prodi = '54BBD27B-2376-4CAE-9951-76EF54BD2CA2';
    var header = {"Authorization": token};

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_alumni?page=$page&limit=100&sort_by=ASC&tahun_lulus=2022&id_prodi=$prodi';

    http.Response response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    if (response.statusCode == 200) {
      data = json.decode(response.body);

      if (data['data'] != null) {
        data['data'].forEach((v) {
          alumni.add(ExploreAlumni.fromJson(v));
        });
      } else {
        return [];
      }
    }
    return alumni;
  }

  static Future<List<ExploreLesson>> getAllLesson() async {
    late String token;
    int page = 1;
    Map data;
    List<ExploreLesson> matkul = [];

    await getToken().then((value) {
      if (value != "404") {
        token = value;
      }
    });

    String prodi = '54BBD27B-2376-4CAE-9951-76EF54BD2CA2';
    var header = {"Authorization": token};

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mata_kuliah/list_matkul?page=$page&limit=50&sort_by=ASC&id_prodi=$prodi';

    http.Response response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      data = json.decode(response.body);

      if (data['data'] != null) {
        data['data'].forEach((v) {
          matkul.add(ExploreLesson.fromJson(v));
        });
      } else {
        return [];
      }
    }

    return matkul;
  }

  static Future<String> getToken() async {
    String url = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';
    String idAplikasi = '948df317-78f7-4b92-a53f-0a56215e07de';
    String username = 'mhs-testing';
    String password = 'unilajaya';

    var apiToken = await http.post(Uri.parse(url), body: {
      'id_aplikasi': idAplikasi,
      'username': username,
      'password': password,
    });

    var fetchJsonToken = json.decode(apiToken.body);

    return 'bearer${fetchJsonToken['data']['token']}';
  }
}
