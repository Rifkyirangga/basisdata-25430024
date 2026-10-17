# Dokumen Kebutuhan Data - Koperasi Mahasiswa Sejahtera

## 1. Latar belakang dan aktivitas organisasi
Kopma menjual alat tulis, makanan ringan, dan minuman di lingkungan kampus, di mana pembelinya dapat berupa anggota maupun pembeli umum. Yang bekerja di Kopma ada tiga kasir yang bertugas bergantian per sif, ada petugas gudang, serta ketua koperasi. Tiga keluhan yang disampaikan dalam wawancara adalah kebingungan pengurus saat memeriksa nota lama karena harga barang sering naik, catatan stok barang yang terkadang bernilai minus, serta kasir yang kesulitan melayani anggota karena sering lupa membawa kartu. Dari ketiga keluhan operasional tersebut, teridentifikasi kebutuhan data untuk mencatat riwayat transaksi secara akurat, mengamankan batasan stok, serta menyediakan identifikasi data anggota yang andal.

## 2. Aktor dan proses bisnis
| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mendaftarkan anggota | Kasir | Mahasiswa meminta untuk mendaftar sebagai anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli melakukan transaksi pembelian barang |
| PB-03 | Memesan barang ke pemasok | Petugas Gudang | Stok suatu barang berada di bawah batas minimum saat pemeriksaan rutin sore hari |
| PB-04 | Menerima kedatangan barang | Petugas Gudang | Barang pesanan datang dari pemasok beserta faktur |
| PB-05 | Menyusun laporan bulanan | Ketua Koperasi | Waktu pergantian awal bulan baru tiba |
| PB-06 | Mengelola data referensi dan keanggotaan | Petugas Gudang / Kasir / Ketua | Terdapat penambahan master data atau pembaruan status keaktifan anggota |

## 3. Dokumen sumber yang dianalisis
| Isian pada nota | Disimpan / dihitung | Alasan |
|---|---|---|
| Nomor nota | Disimpan | Identitas pengenal unik untuk membedakan tiap transaksi penjualan |
| Tanggal & Jam | Disimpan | Mencatat waktu pasti terjadinya transaksi secara historis |
| Kasir | Disimpan | Identitas/ID petugas kasir yang bertanggung jawab melayani transaksi |
| Anggota | Disimpan | Identitas/ID anggota pembeli (kosong jika pembeli umum) untuk penentuan hak diskon |
| Nama barang | Disimpan (via ID) | Merujuk ke master barang; nama barang diambil/direlasikan dari ID barang |
| Qty (Jumlah barang) | Disimpan | Jumlah unit barang yang dibeli pada transaksi tersebut |
| Harga satuan | Disimpan | Harga barang **pada saat transaksi terjadi** (mencatat harga historis) |
| Subtotal | Dihitung | Nilai turunan dari perkalian Qty × Harga satuan |
| Jumlah | Dihitung | Nilai turunan dari penjumlahan seluruh Subtotal item barang |
| Diskon | Dihitung | Nilai turunan sebesar 5% × Jumlah jika pembeli adalah anggota aktif |
| TOTAL | Dihitung | Nilai turunan dari Jumlah - Diskon |
| Bayar tunai | Disimpan | Jumlah uang fisik yang diserahkan/diterima dari pembeli |
| Kembali | Dihitung | Nilai turunan dari selisih Bayar tunai - TOTAL |

## 4. Entitas kandidat dan elemen data

| Entitas kandidat | Elemen data utama | Sumber |
| :--- | :--- | :--- |
| **Anggota** | nomor anggota, NIM, nama, program studi, nomor HP, status aktif | Formulir pendaftaran |
| **Barang** | kode barang, nama barang, kategori, harga jual, stok, batas minimum stok | Daftar barang |
| **Penjualan** | nomor nota, tanggal-jam, kasir, nomor anggota (opsional), bayar tunai | Nota penjualan |
| **Detail penjualan** | nomor nota, kode barang, qty, harga satuan saat transaksi | Nota penjualan |
| **Petugas** | kode petugas, nama petugas, peran (kasir/gudang/ketua) | Wawancara |
| **Pemasok** | kode pemasok, nama pemasok, telepon, alamat | Faktur pemasok |
| **Pembelian** | nomor faktur, tanggal, kode pemasok, petugas penerima, status | Faktur pemasok |
| **Detail pembelian** | nomor faktur, kode barang, qty, harga beli | Faktur pemasok |

**Penjelasan Singkat Pemisahan Entitas:**
* **Anggota:** Mengelompokkan data personal pembeli yang terdaftar berdasarkan formulir pendaftaran.
* **Barang:** Mencatat master produk yang dijual atau disimpan (alat tulis, makanan, dan minuman) beserta stok dan batas minimumnya.
* **Penjualan & Detail penjualan:** Dipisah menjadi kepala nota dan baris item barang karena satu nota memuat banyak baris barang. Nilai turunan tidak disimpan di tabel ini melainkan dihitung.
* **Petugas:** Mencatat pihak yang bekerja di koperasi (kasir, petugas gudang, dan ketua) berdasarkan perannya.
* **Pemasok & Pembelian (beserta detailnya):** Dipisah menjadi kepala faktur dan rincian barang masuk dari pemasok, karena satu faktur pembelian dari pemasok dapat memuat banyak baris barang.

## 5. Aturan bisnis

| Kode | Aturan bisnis |
| :--- | :--- |
| **AB-01** | Setiap nota penjualan memiliki nomor unik dan memuat minimal satu baris barang. |
| **AB-02** | Penjualan dapat dilakukan tanpa anggota (pembeli umum); jika menggunakan keanggotaan, status anggota harus aktif untuk memperoleh diskon 5%. |
| **AB-03** | Stok barang tidak boleh bernilai negatif; transaksi penjualan wajib ditolak apabila jumlah kuantiti melebihi stok yang tersedia di gudang. |
| **AB-04** | Harga jual barang yang berlaku saat transaksi dicatat secara permanen per baris detail penjualan dan tidak boleh berubah meskipun master harga barang naik di kemudian hari. |
| **AB-05** | NIM anggota bersifat unik, dan pencarian data anggota dapat dilakukan melalui nomor anggota atau NIM apabila kartu anggota tertinggal. |
| **AB-06** | Pesanan pembelian ke pemasok baru akan dibuat oleh petugas gudang apabila hasil pemeriksaan rutin menunjukkan stok barang berada di bawah batas minimum. |

## 6. Kebutuhan informasi

| Kode | Kebutuhan informasi | Data yang diperlukan |
| :--- | :--- | :--- |
| **KI-01** | Omzet dan jumlah nota per hari dan per bulan | Penjualan, Detail penjualan |
| **KI-02** | Lima barang terlaris per bulan berdasarkan kuantiti | Detail penjualan, Barang |
| **KI-03** | Daftar barang dengan stok di bawah batas minimum | Barang |
| **KI-04** | Sepuluh anggota dengan total belanja terbesar per bulan | Anggota, Penjualan, Detail penjualan |

## 7. Matriks CRUD

| Proses bisnis | Anggota | Barang | Petugas | Penjualan | Detail penjualan | Pemasok | Pembelian | Detail pembelian |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **PB-01** Mendaftarkan anggota | C,| - | - | - | - | - | - | - |
| **PB-02** Mencatat penjualan | R | R, U | R | C | C | - | - | - |
| **PB-03** Memesan ke pemasok | - | R | R | - | - | R | C | C |
| **PB-04** Menerima barang | - | U | R | - | - | R | U | R |
| **PB-05** Laporan bulanan | R | R | R | R | R | - | R | R |
| **PB-06** Mengelola data referensi dan keanggotaan | - | C, R, U | C, R, U | R | U | C, R, U | - | - |

*(Catatan Keputusan Analisis Matriks CRUD):*
* **Pembaruan Status Anggota (`U` pada Anggota di  (PB-06):** Ditambahkan ke dalam proses pemeliharaan data untuk menangani perubahan status keaktifan anggota yang memengaruhi hak diskon (AB-02).
* **Penghapusan Data (`D` ditiadakan):** Sengaja tidak ada huruf `D` pada entitas master (Barang, Petugas, Pemasok) guna melindungi integritas historis catatan transaksi lama. Berdasarkan AB-04, harga dan relasi kasir/pemasok pada nota masa lalu tidak boleh rusak atau hilang hanya karena master data terkait dihapus. Jika entitas tersebut tidak aktif lagi, statusnya cukup diubah (*Update*), bukan dihapus (*Delete*).

## 8. Kamus data awal

| Elemen | Arti | Contoh | Aturan | Penanggung jawab | Entitas |
|---|---|---|---|---|---|
| no_anggota | Nomor anggota koperasi | A-0457 | Unik, format A-4 digit | Ketua | Anggota |
| nim_anggota | Nomor Induk Mahasiswa anggota | 2301010123 | Unik, 10 digit | Ketua | Anggota |
| nama_anggota | Nama lengkap anggota sesuai kartu/nota | Budi S. | Wajib diisi, teks | Ketua | Anggota |
| no_hp_anggota | Nomor telepon genggam anggota | 081234567890 | Data pribadi dengan akses terbatas | Ketua | Anggota |
| status_anggota | Status keaktifan anggota | aktif | Bernilai aktif atau nonaktif | Ketua | Anggota |
| kode_petugas | Kode unik petugas | K03 | Unik, 3 karakter | Ketua | Petugas |
| nama_petugas | Nama lengkap petugas | Rina | Wajib diisi, teks | Ketua | Petugas |
| kode_barang | Kode pengenal barang | ATK-001 | Unik per barang | Petugas Gudang | Barang |
| nama_barang | Nama jenis barang | Pulpen Gel 0.5 | Wajib diisi, teks | Petugas Gudang | Barang |
| harga_jual_barang | Harga jual satuan barang saat ini | 4000 | Bilangan bulat >= 0 (rupiah) | Petugas Gudang | Barang |
| stok_barang | Jumlah ketersediaan stok barang | 120 | Bilangan bulat >= 0 (AB-03) | Petugas Gudang | Barang |
| stok_min_barang | Batas minimum stok yang memicu pemesanan | 20 | Bilangan bulat >= 0 (AB-06) | Petugas Gudang | Barang |
| no_nota_penjualan | Nomor unik nota penjualan | PJ-2609-0142 | Unik per nota (AB-01) | Kasir | Penjualan |
| tgl_penjualan | Tanggal dan jam transaksi penjualan | 2026-09-24 10:15 | Wajib diisi, format tanggal-jam | Kasir | Penjualan |
| bayar_penjualan | Jumlah uang tunai yang dibayarkan | 30000 | Bilangan bulat >= 0 (rupiah) | Kasir | Penjualan |
| qty_detail_penjualan | Jumlah barang yang dibeli per baris | 3 | Bilangan bulat > 0 | Kasir | Detail penjualan |
| harga_satuan_detail_penjualan | Harga satuan saat transaksi terjadi | 4000 | Bilangan bulat >= 0 (historis, AB-04) | Kasir | Detail penjualan |
| kode_pemasok | Kode unik pengenal pemasok | PVS-01 | Unik, pengenal pemasok | Petugas Gudang | Pemasok |
| nama_pemasok | Nama perusahaan pemasok barang | CV Sumber ATK | Wajib diisi, teks | Petugas Gudang | Pemasok |
| no_faktur_pembelian | Nomor faktur dari pemasok | FK-9988 | Wajib diisi | Petugas Gudang | Pembelian |
| status_pembelian | Status progres pengadaan barang | dipesan | Nilai: dipesan atau diterima | Petugas Gudang | Pembelian |
| qty_detail_pembelian | Jumlah barang yang dibeli dari pemasok | 50 | Bilangan bulat > 0 | Petugas Gudang | Detail pembelian |
| harga_beli_detail_pembelian | Harga modal beli per unit dari pemasok | 3500 | Bilangan bulat >= 0 (rupiah) | Petugas Gudang | Detail pembelian |

## 9. Kebutuhan non-fungsional data
* **Volume Transaksi:** Diperkirakan ±150 nota per hari perkiraan dari buku praktikum (D.6).
* **Retensi Data:** Data transaksi penjualan disimpan sekurang-kurangnya selama 5 tahun untuk keperluan pelacakan arsip historis.
* **Privasi dan Keamanan:** Nomor telepon anggota dikategorikan sebagai data pribadi dengan akses terbatas yang hanya boleh dilihat oleh pihak berwenang (Ketua).

## 10. Isu kualitas data yang diantisipasi
* **Inkonsistensi Ejaan Pemasok:** Variasi penulisan nama pemasok pada faktur yang berbeda (misalnya "CV Sumber ATK" versus "CV. Sumber A.T.K.").
  * *Mitigasi:* Pemberlakuan standarisasi entitas Pemasok dengan kode unik dan validasi input.
* **Risiko Stok Barang Negatif:** Kesalahan pencatatan manual yang membuat stok fisik tercatat minus.
  * *Mitigasi:* Diterapkan aturan bisnis AB-03 agar sistem menolak transaksi apabila stok tidak mencukupi.
* **Duplikasi dan Kesalahan Data Identitas Anggota:** Risiko anggota mendaftar ganda atau kesalahan pengetikan NIM.
  * *Mitigasi:* Diterapkan aturan keunikan NIM (AB-05) untuk mencegah data ganda pada entitas anggota.