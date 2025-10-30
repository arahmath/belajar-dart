import "dart:io";

void main() {
  String nama, kbarang, barang, lagi;
  int idnama, jbarang;
  double harga, subtotal = 0, diskon = 0, pajak = 0, grandTotal = 0;

  List<String> listBarang = [];
  List<int> listQty = [];
  List<double> listTotal = [];

  print("\n=== DAFTAR KASIR ===");
  print("Rahmat[1111]\tHera[1112]\tRezky[1113]");
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

  print("\n=== DAFTAR BARANG ===");
  print("Susu[UHT]\tMinyak[MYK]\tTeh Pucuk[PCK]\tIndomie[IDM]");

  do {
    stdout.write("\nMasukkan Kode Barang  : ");
    kbarang = stdin.readLineSync()!.toUpperCase();

    stdout.write("Masukkan Jumlah       : ");
    jbarang = int.parse(stdin.readLineSync()!);

    if (kbarang == "UHT") {
      barang = "Susu UHT";
      harga = 12000;
    } else if (kbarang == "IDM") {
      barang = "Indomie";
      harga = 3000;
    } else if (kbarang == "PCK") {
      barang = "Teh Pucuk";
      harga = 5000;
    } else if (kbarang == "MYK") {
      barang = "Minyak";
      harga = 20000;
    } else {
      barang = "-";
      harga = 0;
    }

    double totalItem = harga * jbarang;

    bool found = false;
    for (int i = 0; i < listBarang.length; i++) {
      if (listBarang[i] == barang) {
        listQty[i] += jbarang;
        listTotal[i] = listQty[i] * harga;
        found = true;
        break;
      }
    }

    if (!found) {
      listBarang.add(barang);
      listQty.add(jbarang);
      listTotal.add(totalItem);
    }

    stdout.write("Tambah barang lagi? (Y/N): ");
    lagi = stdin.readLineSync()!.toUpperCase();

  } while (lagi == "Y");

  for (double t in listTotal) {
    subtotal += t;
  }

  diskon = subtotal >= 50000 ? subtotal * 0.05 : 0;
  pajak = (subtotal - diskon) * 0.11;
  grandTotal = subtotal - diskon + pajak;

  print("\n===== STRUK PEMBELIAN =====");
  print("Kasir : $nama");
  print("\nBarang\t\tQty\tTotal");

  for (int i = 0; i < listBarang.length; i++) {
    String brg = listBarang[i];

    if (brg.length < 8) {
      print("$brg\t\t${listQty[i]}\tRp${listTotal[i].toInt()}");
    } else {
      print("$brg\t${listQty[i]}\tRp${listTotal[i].toInt()}");
    }
  }

  print("-----------------------------");
  print("Sub Total  : Rp${subtotal.toInt()}");
  print("Diskon     : Rp${diskon.toInt()}");
  print("Pajak 11%  : Rp${pajak.toInt()}");
  print("-----------------------------");
  print("Grand Total: Rp${grandTotal.toInt()}");
}
