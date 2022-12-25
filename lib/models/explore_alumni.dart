// ignore_for_file: non_constant_identifier_names

class ExploreAlumni {
  String? id_reg;
  String? NPM;
  String? nama_alumni;
  String? jenis_kelamin;
  String? id_prodi;
  String? angkatan;
  String? ipk;
  String? tanggal_wisuda;
  double? lama_studi;

  ExploreAlumni(
    this.id_reg,
    this.NPM,
    this.nama_alumni,
    this.jenis_kelamin,
    this.id_prodi,
    this.angkatan,
    this.ipk,
    this.tanggal_wisuda,
    this.lama_studi,
  );

  ExploreAlumni.fromJson(Map<String, dynamic> json) {
    id_reg = json['id_reg_pd'];
    NPM = json['npm'];
    nama_alumni = json['nama_alumni'];
    jenis_kelamin = json['jenis_kelamin'];
    id_prodi = json['id_prodi'];
    angkatan = json['angkatan'];
    ipk = json['ipk'];
    tanggal_wisuda = json['tanggal_wisuda'];
    lama_studi = double.parse(json['lama_studi']);
  }
}
