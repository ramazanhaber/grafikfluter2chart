class AltinModel {
  double? alis;
  double? satis;
  String? kayitTarihi;

  AltinModel({this.alis, this.satis, this.kayitTarihi});

  AltinModel.fromJson(Map<String, dynamic> json) {
    try{
      alis = json['alis'];
      satis = json['satis'];
      kayitTarihi = json['kayit_tarihi'];
    }catch(ex){

    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alis'] = this.alis;
    data['satis'] = this.satis;
    data['kayit_tarihi'] = this.kayitTarihi;
    return data;
  }
}