class bidangUsaha{
  String BidangusahaId;
  String Bidangusahacode;
  String Bidangusahanama;
  String BidangusahacreateAt;
  String BidangusahaupdateAt;

  bidangUsaha({
    this.BidangusahaId,
    this.Bidangusahacode,
    this.Bidangusahanama,
    this.BidangusahacreateAt,
    this.BidangusahaupdateAt,
  });

  factory bidangUsaha.fromjson(Map<String, dynamic> parsedJson){
    return bidangUsaha(
      BidangusahaId: parsedJson['id'],
      Bidangusahacode: parsedJson['code_bidangusaha'],
      Bidangusahanama: parsedJson['name_bidangusaha'],
      BidangusahacreateAt: parsedJson['createdAt'],
      BidangusahaupdateAt: parsedJson['updatedAt'],
    );
  }
}