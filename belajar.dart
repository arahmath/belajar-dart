import "dart:io";

void main() {
  String nama, kbarang, barang, lagi;
  int idnama, jbarang;
  double harga, subtotal, diskon, pajak, total, grandTotal = 0;

  // list data
  List<String> listBarang = [];
  List<int> listQty = [];
  List<double> listTotal = [];

  stdout.write("Masukkan Id Pegawai   : ");
  idnama = int.parse(stdin.readLineSync()!);

  if (idnama == 1111) {
    nama = "Rahmat";
  } else if (idnama == 1112) {
    nama = "Hera";
  } else if (idnama == 1113) {
    nama = "Rezky";
  } else {
    nama = "ID Kasir Tidak Ditemukan";
  }

  do {
    stdout.write("\nMasukkan Kode Barang  : ");
    kbarang = stdin.readLineSync().toString();

    stdout.write("Masukkan Jml Barang   : ");
    jbarang = int.parse(stdin.readLineSync()!);

    if (kbarang.toUpperCase() == "UHT") {
      barang = "Susu UHT";
      harga = 12000;
    } else if (kbarang.toUpperCase() == "IDM") {
      barang = "Indomie";
      harga = 3000;
    } else if (kbarang.toUpperCase() == "PCK") {
      barang = "Teh Pucuk";
      harga = 5000;
    } else if (kbarang.toUpperCase() == "MYK") {
      barang = "Minyak";
      harga = 20000;
    } else {
      barang = "-";
      harga = 0;
    }

    subtotal = harga * jbarang;
    diskon = jbarang >= 5 ? subtotal * 0.10 : 0;
    pajak = (subtotal - diskon) * 0.11;
    total = subtotal - diskon + pajak;

    grandTotal += total;

    // simpan ke list
    listBarang.add(barang);
    listQty.add(jbarang);
    listTotal.add(total);

    stdout.write("Tambah barang lagi? (Y/N): ");
    lagi = stdin.readLineSync().toString().toUpperCase();
  } while (lagi == "Y");

  print("\n===== STRUK PEMBELIAN =====");
  print("Kasir : $nama");
  print("\nBarang\t\tQty\tTotal");

// tampilkan list item
  for (int i = 0; i < listBarang.length; i++) {
    String barang = listBarang[i];

    // kalau nama barang kurang dari 8 karakter, tambah tab extra biar rapi
    if (barang.length < 8) {
      print("$barang\t\t${listQty[i]}\tRp${listTotal[i]}");
    } else {
      print("$barang\t${listQty[i]}\tRp${listTotal[i]}");
    }
  }

  print("------------------------------");
  print("Grand Total : Rp$grandTotal");
  print("==============================");
}
