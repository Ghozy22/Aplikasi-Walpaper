import '../model/kategori_model.dart';

String apiKey = '563492ad6f91700001000001822833b1131043db9ac110cb62141211';

List<kategori> getKategori(){

  List<kategori> kategoris = [];
  kategori Kategori = new kategori();

  Kategori.imagURL =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  Kategori. NamaKategori= "Street Art";
  kategoris.add(Kategori);
  Kategori = new kategori();

  //
  Kategori.imagURL =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  Kategori.NamaKategori = "Wild Life";
  kategoris.add(Kategori);
  Kategori = new kategori();

  //
  Kategori.imagURL =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  Kategori.NamaKategori = "Nature";
  kategoris.add(Kategori);
  Kategori = new kategori();

  //
  Kategori.imagURL =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  Kategori.NamaKategori = "City";
  kategoris.add(Kategori);
  Kategori = new kategori();

  //
  Kategori.imagURL =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  Kategori.NamaKategori = "Motivation";

  kategoris.add(Kategori);
  Kategori = new kategori();

  //
  Kategori.imagURL =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  Kategori.NamaKategori = "Bikes";
  kategoris.add(Kategori);
  Kategori = new kategori();

  //
  Kategori.imagURL =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  Kategori.NamaKategori = "Cars";
  kategoris.add(Kategori);
  Kategori = new kategori();

  return kategoris;

}