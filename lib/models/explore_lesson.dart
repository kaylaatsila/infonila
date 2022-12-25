// ignore_for_file: non_constant_identifier_names

class ExploreLesson {
  String? id_kurikulum_sp;
  String? kode_mk;
  String? nm_mk;
  String? status;

  ExploreLesson({
    this.id_kurikulum_sp,
    this.kode_mk,
    this.nm_mk,
    this.status,
  });

  ExploreLesson.fromJson(Map<String, dynamic> json) {
    id_kurikulum_sp = json['id_kurikulum_sp'];
    kode_mk = json['kode_mk'];
    nm_mk = json['nm_mk'];
    status = json['status'];
  }
}
