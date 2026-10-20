# MODUL 4 — NORMALISASI DAN SKEMA RELASIONAL
## Proyek Perpustakaan Digital Raharsa Inspirasi

**Nama:** Rifky Irangga  
**NIM:** 25430024  
**Kelas:** A  
**Tanggal:** 21 Oktober 2026  
**Asisten/Dosen:** Dedi Irawan, S.Kom., M.T.I
---

## 1. Tujuan Normalisasi

Normalisasi merupakan proses penyusunan struktur tabel basis data untuk mengurangi duplikasi data, mencegah anomali penyisipan, pembaruan, dan penghapusan, serta menjaga konsistensi hubungan antarentitas.

Normalisasi pada proyek Perpustakaan Digital Raharsa Inspirasi dilakukan berdasarkan dokumen kebutuhan data Modul 2. Data yang dianalisis mencakup anggota, buku, eksemplar, petugas, peminjaman, detail peminjaman, dan pembayaran denda.

Tahapan normalisasi yang digunakan meliputi Unnormalized Form (UNF), First Normal Form (1NF), Second Normal Form (2NF), Third Normal Form (3NF), dan pemeriksaan Boyce-Codd Normal Form (BCNF).

## 2. Bentuk Awal Tidak Ternormalisasi (UNF)

Dokumen peminjaman mencatat informasi transaksi, anggota, petugas, dan daftar eksemplar yang dipinjam. Satu transaksi peminjaman dapat memiliki beberapa eksemplar sehingga terdapat kelompok data berulang.

Bentuk awal relasi dapat dituliskan sebagai berikut:

**PEMINJAMAN_UNF**

`PEMINJAMAN_UNF(no_pinjam, tgl_pinjam, tgl_harus_kembali, no_anggota, nama_anggota, kode_petugas, nama_petugas, tarif_denda_harian, {kode_eksemplar, judul_buku, tgl_kembali_fisik, kondisi_eksemplar, status_pengembalian})`

Tanda kurung kurawal menunjukkan kelompok atribut yang dapat berulang dalam satu transaksi.

Contohnya, transaksi `P-202610-001` dapat memuat eksemplar `BK-001` dan `BK-002`. Kedua eksemplar tersebut tidak seharusnya disimpan sebagai daftar berulang dalam satu kolom.

**Permasalahan UNF:**
1. Satu transaksi dapat memiliki beberapa eksemplar dalam satu kelompok data.
2. Informasi anggota dan petugas dapat berulang pada banyak transaksi.
3. Informasi judul buku dapat berulang untuk eksemplar yang berasal dari judul yang sama.
4. Pengulangan data dapat menyebabkan inkonsistensi ketika informasi anggota, buku, atau petugas berubah.

Oleh karena itu, relasi perlu diubah menjadi bentuk 1NF.

## 3. Bentuk Normal Pertama (1NF)

Relasi memenuhi 1NF apabila setiap atribut berisi nilai atomik dan tidak memiliki kelompok atribut berulang.

Untuk memenuhi 1NF, setiap eksemplar dalam transaksi dicatat pada baris tersendiri.

**PEMINJAMAN_1NF**

`PEMINJAMAN_1NF(no_pinjam, kode_eksemplar, tgl_pinjam, tgl_harus_kembali, no_anggota, nama_anggota, kode_petugas, nama_petugas, judul_buku, tarif_denda_harian, tgl_kembali_fisik, kondisi_eksemplar, status_pengembalian)`

Kunci gabungan awal yang digunakan untuk ilustrasi normalisasi adalah `(no_pinjam, kode_eksemplar)`, dengan asumsi satu eksemplar hanya dicatat satu kali pada satu transaksi peminjaman.

Contoh data:

| no_pinjam | kode_eksemplar | no_anggota | kode_petugas |
|---|---|---|---|
| P-202610-001 | BK-001 | M-2026-001 | PTG-01 |
| P-202610-001 | BK-002 | M-2026-001 | PTG-01 |

Setiap baris sekarang mewakili satu eksemplar dalam transaksi.

**Hasil 1NF:** kelompok data berulang telah dipecah menjadi baris terpisah. Namun, informasi transaksi, anggota, petugas, dan buku masih tercampur dalam satu relasi.

**Catatan:** Dokumen kebutuhan data menyediakan `kode_detail_peminjaman` sebagai identitas unik setiap detail. Dalam skema akhir, atribut tersebut digunakan sebagai primary key detail. Kunci gabungan pada tahap ini digunakan untuk memperlihatkan proses normalisasi.

## 4. Dependensi Fungsional

Dependensi fungsional menunjukkan hubungan ketika suatu atribut atau kelompok atribut menentukan atribut lainnya.

Berdasarkan kamus data, entitas kandidat, dan aturan bisnis pada dokumen kebutuhan data, dependensi fungsional awal dirumuskan sebagai berikut.

### 4.1 Entitas Anggota

`no_anggota → nim_nip_anggota, nama_anggota, status_anggota`

Nomor anggota menentukan data identitas dan status anggota.

Dasar: Kamus Data Awal, entitas Anggota, serta AB-04 dan AB-07 untuk kelayakan dan pencarian anggota.

### 4.2 Entitas Buku

`isbn_buku → judul_buku, pengarang_buku, penerbit_buku`

ISBN digunakan sebagai identitas buku pada rancangan ini untuk menentukan informasi judul, pengarang, dan penerbit.

Dasar: Kamus Data Awal dan entitas Buku.

### 4.3 Entitas Eksemplar

`kode_eksemplar → isbn_buku, status_eksemplar`

Kode eksemplar mengidentifikasi satu salinan fisik dan menghubungkannya dengan judul buku yang bersangkutan.

Dasar: AB-03 dan AB-05.

### 4.4 Entitas Petugas

`kode_petugas → nama_petugas, peran_petugas`

Kode petugas menentukan identitas petugas dan perannya.

Dasar: Kamus Data Awal dan AB-10.

### 4.5 Entitas Peminjaman

`no_pinjam → tgl_pinjam, tgl_harus_kembali, no_anggota, kode_petugas, tarif_denda_harian`

Nomor peminjaman menentukan informasi utama satu transaksi peminjaman.

Dasar: AB-06, AB-08, AB-09, serta Kamus Data Awal.

### 4.6 Entitas Detail Peminjaman

`kode_detail_peminjaman → no_pinjam, kode_eksemplar_detail, tgl_kembali_fisik, kondisi_eksemplar, status_pengembalian`

Kode detail peminjaman mengidentifikasi satu catatan detail eksemplar pada transaksi, termasuk informasi pengembaliannya.

Dasar: Kamus Data Awal dan AB-05.

### 4.7 Entitas Pembayaran Denda

`no_pembayaran → no_pinjam_pembayaran, tanggal_pembayaran, jumlah_dibayar`

Nomor pembayaran menentukan satu catatan pembayaran denda.

Dasar: AB-11 dan Kamus Data Awal.

**Catatan:** Dependensi di atas merupakan rancangan berdasarkan asumsi identitas yang dinyatakan dalam dokumen. Ketentuan keunikan atribut alternatif, seperti NIM/NIP atau ISBN, perlu ditegaskan apabila atribut tersebut juga akan digunakan sebagai kunci kandidat.

## 5. Bentuk Normal Kedua (2NF)

Relasi memenuhi 2NF apabila telah memenuhi 1NF dan setiap atribut nonkunci bergantung sepenuhnya pada seluruh kunci kandidat, bukan hanya sebagian kunci gabungan.

Pada relasi 1NF, kunci gabungan `(no_pinjam, kode_eksemplar)` digunakan untuk ilustrasi. Beberapa atribut hanya bergantung pada `no_pinjam`, misalnya:

`no_pinjam → tgl_pinjam, tgl_harus_kembali, no_anggota, kode_petugas, tarif_denda_harian`

Atribut tersebut tidak bergantung pada kode eksemplar. Dengan demikian, terdapat dependensi parsial apabila seluruh atribut tetap ditempatkan pada satu relasi dengan kunci gabungan tersebut.

Untuk mengatasi masalah ini, relasi dipecah menjadi dua:

**PEMINJAMAN**

`PEMINJAMAN(no_pinjam, tgl_pinjam, tgl_harus_kembali, no_anggota, nama_anggota, kode_petugas, nama_petugas, tarif_denda_harian)`

Primary key: `no_pinjam`

**DETAIL_PEMINJAMAN**

`DETAIL_PEMINJAMAN(kode_detail_peminjaman, no_pinjam, kode_eksemplar, tgl_kembali_fisik, kondisi_eksemplar, status_pengembalian)`

Primary key: `kode_detail_peminjaman`

Foreign key:
- `no_pinjam` mengacu pada `PEMINJAMAN`.
- `kode_eksemplar` mengacu pada `EKSEMPLAR`.

Pemisahan ini membuat atribut transaksi utama berada pada tabel Peminjaman, sedangkan atribut per eksemplar berada pada Detail Peminjaman.

**Hasil 2NF:** dependensi parsial pada relasi dengan kunci gabungan dihilangkan melalui pemisahan data transaksi dan detail. Namun, dependensi transitif masih perlu diperiksa.

## 6. Bentuk Normal Ketiga (3NF)

Relasi memenuhi 3NF apabila sudah memenuhi 2NF dan tidak memiliki dependensi transitif atribut nonkunci terhadap kunci kandidat.

Pada tabel Peminjaman, atribut `nama_anggota` ditentukan oleh `no_anggota`, bukan secara langsung oleh `no_pinjam`. Demikian juga, `nama_petugas` ditentukan oleh `kode_petugas`.

Hubungan tersebut dapat dituliskan sebagai berikut:

- `no_pinjam → no_anggota`
- `no_anggota → nama_anggota`
- `no_pinjam → kode_petugas`
- `kode_petugas → nama_petugas`

Jika nama anggota dan nama petugas disimpan berulang di tabel Peminjaman, perubahan nama perlu dilakukan pada banyak baris. Hal tersebut dapat menyebabkan anomali pembaruan.

Data buku juga perlu dipisahkan dari data eksemplar karena satu judul buku dapat memiliki beberapa eksemplar fisik.

Oleh karena itu, skema 3NF dirancang menjadi tabel berikut.

### 6.1 Tabel ANGGOTA

`ANGGOTA(no_anggota, nim_nip_anggota, nama_anggota, status_anggota)`

- Primary key: `no_anggota`
- Menyimpan identitas dan status anggota.
- Informasi anggota tidak perlu disalin ke setiap transaksi peminjaman.

### 6.2 Tabel BUKU

`BUKU(isbn_buku, judul_buku, pengarang_buku, penerbit_buku)`

- Primary key: `isbn_buku`
- Menyimpan informasi judul buku.
- Satu buku dapat memiliki beberapa eksemplar fisik.

### 6.3 Tabel EKSEMPLAR

`EKSEMPLAR(kode_eksemplar, isbn_buku, status_eksemplar)`

- Primary key: `kode_eksemplar`
- Foreign key: `isbn_buku` mengacu pada `BUKU`.
- Menyimpan identitas dan status setiap eksemplar fisik.

### 6.4 Tabel PETUGAS

`PETUGAS(kode_petugas, nama_petugas, peran_petugas)`

- Primary key: `kode_petugas`
- Menyimpan identitas serta peran petugas.

### 6.5 Tabel PEMINJAMAN

`PEMINJAMAN(no_pinjam, tgl_pinjam, tgl_harus_kembali, no_anggota, kode_petugas, tarif_denda_harian)`

- Primary key: `no_pinjam`
- Foreign key: `no_anggota` mengacu pada `ANGGOTA`.
- Foreign key: `kode_petugas` mengacu pada `PETUGAS`.
- Menyimpan informasi utama transaksi peminjaman.

### 6.6 Tabel DETAIL_PEMINJAMAN

`DETAIL_PEMINJAMAN(kode_detail_peminjaman, no_pinjam, kode_eksemplar, tgl_kembali_fisik, kondisi_eksemplar, status_pengembalian)`

- Primary key: `kode_detail_peminjaman`
- Foreign key: `no_pinjam` mengacu pada `PEMINJAMAN`.
- Foreign key: `kode_eksemplar` mengacu pada `EKSEMPLAR`.
- Setiap baris mencatat satu eksemplar pada suatu transaksi peminjaman.

### 6.7 Tabel PEMBAYARAN_DENDA

`PEMBAYARAN_DENDA(no_pembayaran, no_pinjam, tanggal_pembayaran, jumlah_dibayar)`

- Primary key: `no_pembayaran`
- Foreign key: `no_pinjam` mengacu pada `PEMINJAMAN`.
- Menyimpan setiap pembayaran yang benar-benar diterima.
- Satu transaksi peminjaman dapat memiliki beberapa pembayaran jika denda dibayar secara bertahap.

**Hasil 3NF:** data anggota, buku, eksemplar, petugas, peminjaman, detail peminjaman, dan pembayaran denda dipisahkan sesuai fungsinya. Pemisahan tersebut mengurangi pengulangan data serta mendukung konsistensi informasi.

## 7. Pemeriksaan BCNF

BCNF mengharuskan setiap determinan pada dependensi fungsional nontrivial merupakan superkey.

| Tabel | Determinan utama | Hasil pemeriksaan awal |
|---|---|---|
| ANGGOTA | `no_anggota` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |
| BUKU | `isbn_buku` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |
| EKSEMPLAR | `kode_eksemplar` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |
| PETUGAS | `kode_petugas` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |
| PEMINJAMAN | `no_pinjam` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |
| DETAIL_PEMINJAMAN | `kode_detail_peminjaman` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |
| PEMBAYARAN_DENDA | `no_pembayaran` | Memenuhi BCNF berdasarkan FD yang ditetapkan. |

Kesimpulan tersebut berlaku berdasarkan dependensi fungsional yang telah ditetapkan dalam rancangan. Jika ditemukan aturan tambahan atau kunci alternatif yang mengubah dependensi, setiap tabel perlu diperiksa kembali.

## 8. Data yang Disimpan dan Data yang Dihitung

Tidak semua informasi pada bukti transaksi harus disimpan sebagai atribut permanen. Beberapa informasi merupakan hasil perhitungan dari data transaksi.

| Elemen data | Keputusan | Alasan |
|---|---|---|
| Nomor anggota | Disimpan | Identitas unik anggota. |
| Nomor peminjaman | Disimpan | Identitas unik transaksi. |
| Tanggal peminjaman | Disimpan | Bukti waktu transaksi. |
| Tanggal harus kembali | Disimpan | Batas pengembalian yang berlaku pada transaksi. |
| Tarif denda harian | Disimpan | Agar tarif historis dapat ditelusuri jika aturan berubah. |
| Tanggal pengembalian fisik | Disimpan | Bukti kapan eksemplar dikembalikan. |
| Kondisi eksemplar saat dikembalikan | Disimpan | Hasil pemeriksaan fisik saat pengembalian. |
| Jumlah eksemplar dalam transaksi | Dihitung | Diperoleh dari jumlah detail peminjaman. |
| Hari keterlambatan | Dihitung | Berdasarkan tanggal pengembalian dan batas pengembalian. |
| Total denda | Dihitung | Berdasarkan eksemplar terlambat, hari keterlambatan, dan tarif yang berlaku. |
| Total pembayaran | Dihitung | Penjumlahan seluruh pembayaran yang tercatat untuk transaksi. |
| Sisa denda | Dihitung | Total denda dikurangi seluruh pembayaran yang diterima. |
| Status pembayaran | Ditentukan dari perhitungan | Dapat ditetapkan berdasarkan apakah masih ada sisa denda. |
| Jumlah peminjaman harian/bulanan | Dihitung | Diperoleh dari data transaksi sesuai periode. |
| Sepuluh judul terpopuler | Dihitung | Diperoleh dari jumlah peminjaman setiap judul. |

Hari keterlambatan dapat dihitung menggunakan aturan:

`hari_keterlambatan = maksimum(0, tgl_kembali_fisik - tgl_harus_kembali)`

Untuk setiap eksemplar yang terlambat, denda dapat dihitung dengan:

`denda_detail = hari_keterlambatan × tarif_denda_harian`

Total denda transaksi diperoleh dari penjumlahan denda setiap detail yang terlambat. Sisa denda dihitung dengan:

`sisa_denda = total_denda - total_pembayaran`

Perhitungan tersebut harus memastikan pembayaran tidak melebihi kewajiban denda, kecuali sistem memang mengatur kelebihan pembayaran secara khusus.

## 9. Anomali Data yang Dapat Dicegah

### 9.1 Anomali Pembaruan

Jika `nama_anggota` disimpan pada setiap transaksi peminjaman, perubahan nama harus dilakukan di banyak baris. Jika salah satu baris tidak diperbarui, data menjadi tidak konsisten.

Solusi: menyimpan nama anggota pada tabel ANGGOTA dan menggunakan `no_anggota` sebagai foreign key pada PEMINJAMAN.

### 9.2 Anomali Penyisipan

Jika data judul buku hanya dapat dicatat bersama transaksi peminjaman, buku baru yang belum pernah dipinjam akan sulit dicatat secara mandiri.

Solusi: memisahkan tabel BUKU dari PEMINJAMAN.

### 9.3 Anomali Penghapusan

Jika informasi buku hanya disimpan bersama detail peminjaman, penghapusan detail transaksi terakhir berpotensi menghilangkan informasi buku.

Solusi: menyimpan informasi buku pada tabel BUKU dan informasi salinan fisik pada EKSEMPLAR.

## 10. Skema Relasional Akhir

Skema relasional hasil normalisasi yang diusulkan adalah:

1. `ANGGOTA(no_anggota PK, nim_nip_anggota, nama_anggota, status_anggota)`
2. `BUKU(isbn_buku PK, judul_buku, pengarang_buku, penerbit_buku)`
3. `EKSEMPLAR(kode_eksemplar PK, isbn_buku FK, status_eksemplar)`
4. `PETUGAS(kode_petugas PK, nama_petugas, peran_petugas)`
5. `PEMINJAMAN(no_pinjam PK, tgl_pinjam, tgl_harus_kembali, no_anggota FK, kode_petugas FK, tarif_denda_harian)`
6. `DETAIL_PEMINJAMAN(kode_detail_peminjaman PK, no_pinjam FK, kode_eksemplar FK, tgl_kembali_fisik, kondisi_eksemplar, status_pengembalian)`
7. `PEMBAYARAN_DENDA(no_pembayaran PK, no_pinjam FK, tanggal_pembayaran, jumlah_dibayar)`

Keterangan:
- PK = Primary Key.
- FK = Foreign Key.
- Atribut pengembalian pada DETAIL_PEMINJAMAN dapat bernilai kosong sebelum pengembalian terjadi.
- `tarif_denda_harian` tetap disimpan pada PEMINJAMAN agar tarif transaksi lama dapat ditelusuri.
- `no_pinjam` pada PEMBAYARAN_DENDA memungkinkan satu transaksi memiliki beberapa pembayaran.

## 11. Evaluasi terhadap ERD Modul 3

ERD Modul 3 tetap menjadi acuan awal. Hasil normalisasi ini mengonfirmasi perlunya memisahkan entitas Buku dan Eksemplar, serta memisahkan Pembayaran Denda dari Peminjaman karena pembayaran dapat dilakukan lebih dari sekali.

Hubungan yang diharapkan adalah:

- ANGGOTA memiliki banyak PEMINJAMAN.
- PETUGAS melayani banyak PEMINJAMAN.
- BUKU memiliki banyak EKSEMPLAR.
- PEMINJAMAN memiliki banyak DETAIL_PEMINJAMAN.
- EKSEMPLAR dapat muncul pada detail peminjaman yang berbeda pada waktu yang berbeda.
- PEMINJAMAN dapat memiliki banyak PEMBAYARAN_DENDA.

ERD Modul 3 perlu dibandingkan dengan skema tersebut. Jika entitas, atribut, atau hubungan yang sudah ada sesuai, tidak perlu dibuat ulang. Perubahan hanya dilakukan apabila struktur ERD sebelumnya belum mencerminkan hasil normalisasi.

## 12. Kesimpulan

Berdasarkan proses normalisasi, struktur data awal yang memiliki kelompok data berulang diubah menjadi relasi dengan atribut atomik pada 1NF. Pemisahan data transaksi dan detail mengatasi dependensi parsial pada ilustrasi 2NF. Selanjutnya, pemisahan anggota, buku, eksemplar, dan petugas mengurangi dependensi transitif pada 3NF.

Skema akhir terdiri atas tujuh tabel, yaitu ANGGOTA, BUKU, EKSEMPLAR, PETUGAS, PEMINJAMAN, DETAIL_PEMINJAMAN, dan PEMBAYARAN_DENDA. Pemeriksaan awal menunjukkan bahwa tabel-tabel tersebut memenuhi BCNF berdasarkan dependensi fungsional yang telah dirumuskan.

Data turunan seperti hari keterlambatan, total denda, total pembayaran, dan sisa denda dihitung dari data sumber yang disimpan. Hasil normalisasi selanjutnya digunakan untuk mengevaluasi kesesuaian ERD Modul 3 dan menjadi dasar pengembangan basis data perpustakaan.