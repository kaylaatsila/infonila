// ignore_for_file: non_constant_identifier_names

class ExploreStudent {
  String? id_peserta_didik;
  String? id_reg_pd;
  String? NPM;
  String? nama;
  String? jenis_kelamin;
  String? id_prodi;
  String? program_studi;
  String? status_sekarang;
  String? semester_sekarang;
  String? total_sks;
  String? ipk;
  String? periode_masuk;

  ExploreStudent({
    this.id_peserta_didik,
    this.id_reg_pd,
    this.NPM,
    this.nama,
    this.jenis_kelamin,
    this.id_prodi,
    this.program_studi,
    this.status_sekarang,
    this.semester_sekarang,
    this.total_sks,
    this.ipk,
    this.periode_masuk,
  });

  ExploreStudent.fromJson(Map<String, dynamic> json) {
    id_peserta_didik = json['id_peserta_didik'];
    id_reg_pd = json['id_reg_pd'];
    NPM = json['NPM'];
    nama = json['nama_mahasiswa'];
    jenis_kelamin = json['jenis_kelamin'];
    id_prodi = json['id_prodi'];
    program_studi = json['program_studi'];
    status_sekarang = json['status_sekarang'];
    periode_masuk = json['periode_masuk'];
    ipk = json['ipk'];
    semester_sekarang = json['semester_sekarang'];
    total_sks = json['total_sks'];
  }
}
