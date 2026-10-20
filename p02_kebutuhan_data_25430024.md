
# Dokumen Kebutuhan Data - Perpustakaan Digital Raharsa Inspirasi

## 1. Latar belakang dan aktivitas organisasi

Perpustakaan Digital Raharsa Inspirasi merupakan perpustakaan akademik yang menyediakan layanan peminjaman dan pengembalian buku fisik bagi mahasiswa dan dosen. Dalam menjalankan kegiatan sehari-hari, perpustakaan membutuhkan pencatatan data anggota, koleksi buku, eksemplar fisik, petugas, serta transaksi peminjaman dan pengembalian.

Proses operasional perpustakaan dilaksanakan oleh pustakawan dan staf administrasi. Staf Administrasi bertugas melakukan pendaftaran dan pengelolaan data anggota. Pustakawan bertugas mengelola koleksi buku, mencatat peminjaman, melayani pengembalian, serta memeriksa keterlambatan dan denda. Kepala Perpustakaan bertanggung jawab mengawasi kegiatan perpustakaan, mengelola data petugas, dan memeriksa laporan sirkulasi.

Beberapa permasalahan yang perlu diperhatikan adalah antrean saat peminjaman, informasi denda yang belum transparan, dan kesulitan mengetahui ketersediaan setiap eksemplar buku. Oleh karena itu, kebutuhan data perlu dirancang agar pencatatan lebih teratur, informasi mudah ditemukan, dan riwayat transaksi dapat diperiksa kembali.

Dokumen ini membahas kebutuhan data awal berdasarkan proses bisnis, aturan operasional, kebutuhan informasi, serta risiko kualitas data yang mungkin terjadi.


## 2. Aktor dan Proses Bisnis

Bagian ini menjelaskan pihak-pihak yang terlibat dalam kegiatan Perpustakaan Digital Raharsa Inspirasi dan proses yang mereka lakukan. Setiap aktor memiliki tugas masing-masing agar kegiatan pendaftaran anggota, peminjaman, pengembalian, pengelolaan koleksi, dan pelaporan dapat berjalan dengan baik.

### 2.1 Aktor yang Terlibat

| No. | Aktor | Tugas dan Tanggung Jawab |
|---|---|---|
| 1 | Staf Administrasi | Mendaftarkan anggota, memperbarui data anggota, dan mencatat pembayaran denda yang diterima. |
| 2 | Pustakawan | Mengelola koleksi dan eksemplar buku, mencatat peminjaman, melayani pengembalian, serta memeriksa keterlambatan dan denda. |
| 3 | Kepala Perpustakaan | Mengawasi kegiatan perpustakaan, mengelola data petugas dan perannya, serta memeriksa laporan sirkulasi. |

### 2.2 Daftar Proses Bisnis

| Kode Proses | Nama Proses Bisnis | Aktor yang Bertanggung Jawab | Pemicu |
|---|---|---|---|
| PB-01 | Pendaftaran dan pengelolaan anggota | Staf Administrasi | Ada calon anggota yang mendaftar atau ada data anggota yang perlu diperbarui |
| PB-02 | Pencatatan peminjaman | Pustakawan | Anggota mengajukan peminjaman buku |
| PB-03 | Pengembalian dan pemeriksaan denda | Pustakawan | Anggota mengembalikan buku yang dipinjam |
| PB-04 | Pengelolaan koleksi dan eksemplar | Pustakawan | Ada buku atau eksemplar baru, perubahan data koleksi, atau perubahan kondisi eksemplar |
| PB-05 | Penyusunan laporan sirkulasi | Kepala Perpustakaan | Ada kebutuhan untuk memeriksa atau mengevaluasi laporan kegiatan peminjaman dan pengembalian, baik secara harian maupun bulanan.|
| PB-06 | Pengelolaan data petugas | Kepala Perpustakaan | Ada petugas baru atau perubahan data dan peran petugas |
| PB-07 | Pencatatan pembayaran denda | Staf Administrasi | Anggota membayar denda |

PB-07 dipisahkan dari proses pengembalian karena penghitungan denda dan pencatatan pembayaran merupakan dua kegiatan yang berbeda. Denda dapat dihitung ketika buku dikembalikan, sedangkan pembayaran dicatat ketika uang benar-benar diterima. Pemisahan ini membantu perpustakaan mengetahui jumlah denda yang harus dibayar dan jumlah yang sudah dibayarkan.


## 3. Dokumen sumber yang dianalisis

Bagian ini menjelaskan data yang diperlukan dalam setiap kegiatan perpustakaan. Data tersebut digunakan untuk mencatat transaksi, memeriksa keterlambatan, menghitung denda, dan menghasilkan informasi yang dibutuhkan oleh pengelola perpustakaan.

### 3.1 Contoh Bukti Transaksi Peminjaman

Berikut contoh bukti peminjaman buku yang digunakan untuk mencatat transaksi anggota.

```text
PERPUSTAKAAN DIGITAL RAHARSA INSPIRASI
BUKTI PEMINJAMAN BUKU

No. Peminjaman : P-202610-001
No. Anggota    : M-2026-001
Nama Anggota   : Udin
Tanggal Pinjam : 17 Oktober 2026
Batas Kembali  : 24 Oktober 2026
Petugas        : Siti Aminah
Jumlah Eksemplar : 2

**Analisis Isian Dokumen Peminjaman**

| Isian | Disimpan / dihitung | Alasan |
|---|---|---|
| Nomor peminjaman | Disimpan | Sebagai identitas unik untuk setiap transaksi peminjaman |
| Nomor anggota | Disimpan | Untuk mengetahui anggota yang melakukan peminjaman |
| Nama anggota | Diambil dari data anggota | Agar nama sesuai dengan data anggota yang terdaftar |
| Tanggal peminjaman | Disimpan | Untuk mencatat kapan transaksi peminjaman dilakukan |
| Tanggal harus kembali | Disimpan | Sebagai batas waktu pengembalian buku |
| Nama petugas | Diambil dari data petugas | Untuk mengetahui petugas yang melayani transaksi |
| Kode eksemplar | Disimpan pada detail peminjaman | Untuk mengetahui buku fisik yang dipinjam |
| Jumlah eksemplar | Dihitung | Diperoleh dari jumlah eksemplar yang tercatat dalam transaksi |
| Tarif denda harian | Disimpan | Agar tarif yang berlaku pada transaksi dapat diketahui kembali |
| Lama peminjaman | Dihitung | Diperoleh dari tanggal peminjaman dan tanggal harus kembali |

Daftar Eksemplar:
1. BK-001 - Dasar-Dasar Basis Data
2. BK-002 - Dasar-Dasar Basis Data

Maksimal peminjaman : 9 eksemplar
Lama peminjaman     : 7 hari
Tarif denda         : Rp7.000 per eksemplar per hari
```

Bukti peminjaman memuat identitas anggota, nomor transaksi, tanggal peminjaman, batas pengembalian, dan daftar eksemplar yang dipinjam. Tarif denda juga dicantumkan sebagai informasi bagi anggota. Total denda belum dihitung pada tahap ini karena keterlambatan belum diketahui.

### 3.2 Contoh Bukti Transaksi Pengembalian

Berikut contoh bukti pengembalian buku yang digunakan untuk mencatat tanggal pengembalian dan hasil pemeriksaan denda.

```text
PERPUSTAKAAN DIGITAL RAHARSA INSPIRASI
BUKTI PENGEMBALIAN BUKU

No. Peminjaman : P-202610-001
No. Anggota    : M-2026-001
Nama Anggota   : Udin
Batas Kembali  : 24 Oktober 2026
Tanggal Kembali: 26 Oktober 2026
Tanggal Pinjam : 17 Oktober 2026
Petugas        : Siti Aminah

Daftar Eksemplar Dikembalikan:
1. BK-001 - Dasar-Dasar Basis Data (kondisi: baik)
2. BK-002 - Dasar-Dasar Basis Data (kondisi: baik)

**Analisis Isian Dokumen Pengembalian**

| Isian | Disimpan / dihitung | Alasan |
|---|---|---|
| Nomor peminjaman | Disimpan sebagai referensi | Untuk menghubungkan pengembalian dengan transaksi peminjaman yang sesuai |
| Nomor anggota | Diambil dari data peminjaman | Untuk mengetahui anggota yang melakukan pengembalian |
| Nama anggota | Diambil dari data anggota | Agar identitas anggota sesuai dengan data yang terdaftar |
| Tanggal peminjaman | Diambil dari data peminjaman | Untuk mengetahui kapan buku mulai dipinjam |
| Tanggal harus kembali | Diambil dari data peminjaman | Sebagai dasar untuk menentukan keterlambatan |
| Tanggal pengembalian fisik | Disimpan | Untuk mencatat tanggal buku benar-benar dikembalikan |
| Kode eksemplar | Disimpan pada detail peminjaman | Untuk mengetahui buku fisik yang dikembalikan |
| Kondisi eksemplar | Disimpan | Untuk mencatat kondisi buku saat dikembalikan |
| Hari keterlambatan | Dihitung | Berdasarkan selisih tanggal pengembalian dan tanggal harus kembali, dengan nilai minimum nol hari |
| Tarif denda harian | Diambil dari data peminjaman | Agar perhitungan menggunakan tarif yang berlaku pada transaksi |
| Total denda | Dihitung | Berdasarkan jumlah eksemplar yang terlambat, hari keterlambatan, dan tarif denda |
| Status pengembalian | Disimpan atau diperbarui | Untuk menunjukkan bahwa proses pengembalian sudah dicatat |

Jumlah eksemplar terlambat : 2
Hari keterlambatan         : 2 hari
Tarif denda                : Rp7.000 per eksemplar per hari
Total denda                : Rp28.000

Status pengembalian: Selesai
```

Contoh tersebut menggunakan asumsi dua eksemplar terlambat selama dua hari. Perhitungan denda adalah:

2 eksemplar × 2 hari × Rp7.000 = Rp28.000.

Bukti pengembalian digunakan untuk menunjukkan hasil pemeriksaan keterlambatan dan jumlah denda yang harus dibayar. Status pengembalian Selesai tidak otomatis berarti denda sudah lunas, karena pembayaran perlu dicatat secara terpisah.

### 3.3 Contoh Pencatatan Pembayaran Denda

Pembayaran denda dicatat ketika anggota benar-benar melakukan pembayaran. Contoh berikut menggunakan transaksi yang sama.

```text
PERPUSTAKAAN DIGITAL RAHARSA INSPIRASI
BUKTI PEMBAYARAN DENDA
No. Pembayaran : BY-202610-001
Nama Anggota   : Udin
Petugas        : Siti Aminah
No. Peminjaman : P-202610-001
No. Anggota    : M-2026-001
Tanggal Bayar  : 26 Oktober 2026
Total Denda    : Rp28.000
Jumlah Dibayar : Rp28.000
Sisa Denda     : Rp0
Status Bayar   : Lunas
```

**Analisis Isian Dokumen Pembayaran Denda**

| Isian | Disimpan / dihitung | Alasan |
|---|---|---|
| Nomor pembayaran | Disimpan | Sebagai identitas unik untuk setiap transaksi pembayaran denda |
| Nomor peminjaman | Disimpan sebagai referensi | Untuk menghubungkan pembayaran dengan transaksi peminjaman yang memiliki denda |
| Nomor anggota | Diambil dari data peminjaman | Untuk mengetahui anggota yang membayar denda |
| Nama anggota | Diambil dari data anggota | Agar identitas anggota sesuai dengan data yang terdaftar |
| Tanggal pembayaran | Disimpan | Untuk mencatat kapan pembayaran denda dilakukan |
| Total denda | Dihitung atau diambil dari hasil perhitungan denda | Untuk mengetahui jumlah denda yang harus dibayar |
| Jumlah yang dibayar | Disimpan | Untuk mencatat jumlah uang yang benar-benar diterima |
| Sisa denda | Dihitung | Diperoleh dari total denda dikurangi jumlah pembayaran yang sudah diterima |
| Status pembayaran | Dihitung atau ditentukan berdasarkan sisa denda | Untuk menunjukkan apakah denda sudah lunas atau masih memiliki sisa |
| Nama petugas | Diambil dari data petugas | Untuk mengetahui petugas yang mencatat pembayaran |

Contoh ini mengasumsikan anggota membayar seluruh denda pada tanggal 26 Oktober 2026. Jika anggota baru membayar sebagian, jumlah yang sudah dibayar dan sisa dendanya perlu dicatat sesuai transaksi sebenarnya.

### 3.4 Pembedaan Data yang Disimpan dan Dihitung

| Kode Proses | Elemen Data | Disimpan atau Dihitung | Alasan |
|---|---|---|---|
| PB-01 | no_anggota | Disimpan | Mengenali anggota secara konsisten |
| PB-01 | nim_nip_anggota | Disimpan | Memeriksa identitas anggota |
| PB-01 | status_anggota | Disimpan | Menentukan kelayakan anggota untuk meminjam |
| PB-02 | no_pinjam | Disimpan | Mengidentifikasi transaksi peminjaman |
| PB-02 | tgl_pinjam | Disimpan | Menjadi bukti tanggal transaksi |
| PB-02 | tgl_harus_kembali | Disimpan | Mencatat batas pengembalian |
| PB-02 | jumlah_eksemplar | Dihitung | Diperoleh dari jumlah eksemplar dalam transaksi |
| PB-02 | kode_detail_peminjaman | Disimpan | Mengidentifikasi setiap catatan detail peminjaman secara unik |
| PB-03 | tgl_kembali_fisik | Disimpan | Menunjukkan tanggal pengembalian sebenarnya |
| PB-03 | hari_keterlambatan | Dihitung | Diperoleh dari tanggal pengembalian dan batas pengembalian |
| PB-03 | tarif_denda_harian | Disimpan | Menelusuri tarif yang berlaku pada transaksi |
| PB-03 | total_denda | Dihitung | Berdasarkan jumlah eksemplar terlambat, hari keterlambatan, dan tarif |
| PB-04 | status_eksemplar | Disimpan | Menunjukkan ketersediaan eksemplar |
| PB-05 | jumlah_peminjaman_harian | Dihitung | Diperoleh dari transaksi pada tanggal tertentu |
| PB-05 | jumlah_peminjaman_bulanan | Dihitung | Diperoleh dari transaksi selama satu bulan |
| PB-05 | sepuluh_judul_terpopuler | Dihitung | Diperoleh dari jumlah peminjaman setiap judul |
| PB-07 | tanggal_pembayaran | Disimpan | Mengetahui kapan pembayaran diterima |
| PB-07 | no_pembayaran | Disimpan | Mengidentifikasi setiap catatan pembayaran secara unik |
| PB-07 | no_pinjam_pembayaran | Disimpan | Menghubungkan pembayaran dengan transaksi peminjaman yang sesuai |
| PB-07 | jumlah_dibayar | Disimpan | Mencatat jumlah uang yang benar-benar diterima |
| PB-07 | total_pembayaran_denda | Dihitung | Diperoleh dari penjumlahan pembayaran yang terkait dengan denda |
| sisa_denda | Jumlah denda yang belum dibayar | Rp0 | Dihitung dari total denda dikurangi seluruh pembayaran yang tercatat | Staf Administrasi |

Pemisahan data yang disimpan dan dihitung diperlukan agar pencatatan lebih konsisten. Data transaksi seperti tanggal peminjaman, tanggal pengembalian, tarif yang berlaku, dan jumlah pembayaran harus bisa ditelusuri kembali. Sementara itu, keterlambatan, total denda, dan sisa denda dapat diperoleh dari data transaksi tersebut.


## 4. Entitas kandidat dan elemen data

Entitas merupakan kelompok data utama yang dibutuhkan untuk mendukung kegiatan Perpustakaan Digital Raharsa Inspirasi. Setiap entitas memiliki fungsi yang berbeda, tetapi saling berhubungan untuk mendukung pencatatan anggota, koleksi, peminjaman, pengembalian, dan pembayaran denda.

### 4.1 Daftar Entitas dan Sumber Data

| No. | Entitas | Data yang Dicatat | Sumber Data | Kegunaan |
|---|---|---|---|---|
| 1 | Anggota | Nomor anggota, NIM/NIP, nama, nomor HP, status | Formulir pendaftaran anggota | Menyimpan identitas dan status anggota |
| 2 | Buku | ISBN, judul, pengarang, penerbit | Daftar koleksi buku | Menyimpan informasi setiap judul buku |
| 3 | Eksemplar | Kode eksemplar, buku terkait, kondisi, status | Daftar eksemplar fisik dan catatan sirkulasi | Membedakan setiap salinan fisik dan mengetahui ketersediaannya |
| 4 | Petugas | Kode petugas, nama, peran | Data petugas | Menyimpan identitas dan peran petugas |
| 5 | Peminjaman | Nomor peminjaman, tanggal peminjaman, tanggal harus kembali, tarif denda harian, nomor anggota, kode petugas | Bukti peminjaman | Menyimpan informasi utama setiap transaksi peminjaman buku oleh anggota |
| 6 | Detail Peminjaman | Kode detail peminjaman, nomor peminjaman, kode eksemplar, tanggal pengembalian fisik, kondisi eksemplar, status pengembalian | Bukti peminjaman dan bukti pengembalian |
| 7 | Pembayaran Denda | Nomor pembayaran, nomor peminjaman, tanggal pembayaran, jumlah dibayar | Bukti pembayaran dan catatan setiap pembayaran yang diterima | Mencatat setiap pembayaran denda, termasuk pembayaran bertahap, agar jumlah yang sudah dibayar dan sisa denda dapat ditelusuri |

### 4.2 Hubungan Antarentitas

Entitas Anggota berhubungan dengan Peminjaman karena setiap transaksi peminjaman dilakukan oleh anggota yang terdaftar. Entitas Petugas juga berhubungan dengan Peminjaman karena transaksi dicatat oleh petugas yang bertanggung jawab.

Entitas Buku berhubungan dengan Eksemplar. Satu judul buku dapat mempunyai beberapa eksemplar fisik, dan setiap eksemplar harus memiliki kode yang berbeda agar tidak tertukar.

Entitas Peminjaman berhubungan dengan Detail Peminjaman. Satu transaksi dapat berisi beberapa eksemplar, sehingga setiap eksemplar dicatat pada detail transaksi masing-masing.

Entitas Pembayaran Denda berhubungan dengan transaksi peminjaman yang menimbulkan denda. Satu transaksi dapat memiliki satu atau beberapa catatan pembayaran jika anggota membayar secara bertahap. Dengan demikian, jumlah yang sudah dibayar dan sisa denda dapat diketahui.

### 4.3 Catatan Perancangan Entitas

Data buku dan data eksemplar harus dipisahkan karena satu judul buku dapat memiliki beberapa salinan fisik dengan kondisi dan status yang berbeda.

Tanggal pengembalian, tarif denda yang berlaku, dan jumlah pembayaran perlu dicatat agar informasi transaksi dapat diperiksa kembali. Hari keterlambatan, total denda, dan sisa denda dapat dihitung berdasarkan data yang tersimpan.

Nomor pembayaran perlu dibuat unik untuk setiap catatan pembayaran. Data pembayaran juga harus dihubungkan dengan transaksi peminjaman yang sesuai agar tidak terjadi kesalahan pencatatan.

## 5. Aturan Bisnis

| Kode | Aturan bisnis |
|---|---|
| AB-01 | Setiap anggota dapat meminjam maksimal 9 eksemplar dalam satu transaksi. |
| AB-02 | Denda keterlambatan sebesar Rp7.000 untuk setiap eksemplar per hari keterlambatan. |
| AB-03 | Satu judul buku dapat memiliki beberapa eksemplar fisik dengan kode berbeda. |
| AB-04 | Hanya anggota berstatus Aktif yang diperbolehkan melakukan peminjaman. |
| AB-05 | Eksemplar yang sedang dipinjam berstatus Tidak Tersedia dan baru dapat dinyatakan Tersedia setelah pengembaliannya dicatat serta kondisinya diperiksa. |
| AB-06 | Setiap transaksi peminjaman harus mempunyai nomor unik yang tidak digunakan kembali. |
| AB-07 | Pencarian anggota dapat dilakukan menggunakan nomor anggota atau NIM/NIP. |
| AB-08 | Tarif denda yang berlaku pada suatu transaksi harus dapat ditelusuri apabila aturan berubah. |
| AB-09 | Masa peminjaman adalah 7 hari sejak tanggal peminjaman. Batas pengembalian dicatat pada transaksi. |
| AB-10 | Kepala Perpustakaan bertanggung jawab menambah, memperbarui, dan menonaktifkan data petugas serta menetapkan peran petugas berdasarkan kebutuhan operasional. |
| AB-11 | Setiap pembayaran denda harus dicatat berdasarkan transaksi peminjaman yang sesuai, termasuk tanggal pembayaran dan jumlah yang dibayarkan. Jika pembayaran dilakukan secara bertahap, sisa denda harus dapat diketahui. |


Aturan bisnis menjadi dasar dalam menentukan data yang disimpan, proses yang didukung, serta informasi yang harus tersedia bagi pihak perpustakaan.

## 6. Kebutuhan Informasi

| Kode | Informasi yang dibutuhkan | Pengguna | Kegunaan |
|---|---|---|---|
| KI-01 | Laporan jumlah peminjaman harian dan bulanan | Kepala Perpustakaan | Memantau aktivitas sirkulasi |
| KI-02 | Daftar eksemplar terlambat beserta perhitungan denda | Pustakawan dan Kepala Perpustakaan | Menindaklanjuti keterlambatan dan menjelaskan denda |
| KI-03 | Sepuluh judul buku yang paling sering dipinjam setiap bulan | Kepala Perpustakaan | Mengetahui koleksi yang diminati |
| KI-04 | Daftar anggota dengan denda belum dibayar | Staf Administrasi dan Kepala Perpustakaan | Memeriksa pembayaran denda |
| KI-05 | Ketersediaan eksemplar berdasarkan judul buku | Pustakawan | Mempermudah pencarian buku yang dapat dipinjam |
| KI-06 | Daftar petugas beserta perannya | Kepala Perpustakaan | Memantau pembagian tugas |
| KI-07 | Daftar pembayaran denda, jumlah yang sudah dibayar, dan sisa denda | Staf Administrasi dan Kepala Perpustakaan | Memantau pembayaran denda dan mengetahui tunggakan anggota |


Informasi tersebut diharapkan membantu mengurangi kesulitan pencarian eksemplar dan membuat informasi keterlambatan serta denda lebih mudah dijelaskan.


## 7. Matriks CRUD 

Matriks CRUD digunakan untuk menunjukkan hubungan antara proses bisnis dan entitas data yang digunakan. Matriks ini membantu memastikan bahwa setiap proses memiliki akses yang sesuai untuk membuat, membaca, memperbarui, atau menghapus data.

### 7.1 Keterangan CRUD

- **C (Create):** membuat atau menambahkan data baru.
- **R (Read):** membaca atau melihat data.
- **U (Update):** memperbarui data.
- **D (Delete):** menghapus data.
- **–:** tidak ada kegiatan CRUD utama pada entitas tersebut.

### 7.2 Matriks CRUD

| Proses Bisnis | Anggota | Buku | Eksemplar | Petugas | Peminjaman | Detail Peminjaman | Pembayaran Denda |
|---|---|---|---|---|---|---|---|
| PB-01 Pendaftaran dan pengelolaan anggota | C, R, U | – | – | R | – | – | – |
| PB-02 Pencatatan peminjaman | R | R | R, U | R | C, R | C, R | – |
| PB-03 Pengembalian dan pemeriksaan denda | R | R | R, U | R | R | R, U | R |
| PB-04 Pengelolaan koleksi dan eksemplar | – | C, R, U | C, R, U | R | – | – | – |
| PB-05 Penyusunan laporan sirkulasi | R | R | R | R | R | R | R |
| PB-06 Pengelolaan data petugas | – | – | – | C, R, U | – | – | – |
| PB-07 Pencatatan pembayaran denda | R | – | – | R | R, U | R | C, R |

### 7.3 Penjelasan Matriks CRUD

1. **PB-01 Pendaftaran dan pengelolaan anggota** digunakan untuk membuat, membaca, dan memperbarui data anggota. Data petugas dibaca untuk mengetahui siapa yang menjalankan proses tersebut.

2. **PB-02 Pencatatan peminjaman** digunakan untuk memeriksa data anggota, buku, eksemplar, dan petugas sebelum transaksi dicatat. Data peminjaman dan detail peminjaman dibuat sesuai eksemplar yang dipinjam.

3. **PB-03 Pengembalian dan pemeriksaan denda** digunakan untuk mencatat pengembalian, memperbarui status eksemplar, serta memperbarui informasi pengembalian pada transaksi terkait. Data pembayaran dapat dibaca untuk memeriksa apakah denda sudah dibayar.

4. **PB-04 Pengelolaan koleksi dan eksemplar** digunakan untuk menambah, membaca, dan memperbarui data buku serta eksemplar fisik yang dimiliki perpustakaan.

5. **PB-05 Penyusunan laporan sirkulasi** membaca data dari berbagai entitas untuk menghasilkan laporan peminjaman, pengembalian, ketersediaan eksemplar, dan pembayaran denda. Proses ini tidak mengubah transaksi sumber.

6. **PB-06 Pengelolaan data petugas** digunakan untuk membuat, membaca, dan memperbarui data petugas beserta perannya.

7. **PB-07 Pencatatan pembayaran denda** digunakan untuk membaca data anggota dan transaksi terkait, kemudian membuat catatan pembayaran yang benar-benar diterima. Setiap pembayaran dihubungkan dengan transaksi peminjaman yang sesuai agar jumlah yang sudah dibayar dan sisa denda dapat ditelusuri.

Penghapusan data tidak dicantumkan sebagai kegiatan utama karena data transaksi dan pembayaran perlu tetap tersimpan agar riwayatnya dapat diperiksa kembali.


## 8. Kamus Data Awal

Kamus data awal berisi daftar elemen data yang diperlukan dalam sistem perpustakaan, lengkap dengan arti, contoh nilai, aturan, dan penanggung jawab.

| Elemen | Arti | Contoh | Aturan | Penanggung jawab |
|---|---|---|---|---|
| no_anggota | Nomor identitas anggota | M-2026-001 | Wajib diisi, unik, dan tidak boleh digunakan anggota lain | Staf Administrasi |
| nim_nip_anggota | Nomor induk mahasiswa atau pegawai | 25430024 | Dicatat sesuai identitas dan diperiksa agar tidak terjadi duplikasi | Staf Administrasi |
| nama_anggota | Nama lengkap anggota | Budi Santoso | Wajib diisi sesuai identitas | Staf Administrasi |
| status_anggota | Status keanggotaan | Aktif | Diisi Aktif atau Nonaktif. Hanya anggota Aktif yang boleh meminjam | Staf Administrasi |
| isbn_buku | Nomor ISBN buku | 9786021234567 | Dicatat sesuai buku dan bukan pembeda setiap eksemplar fisik | Pustakawan |
| judul_buku | Judul buku | Dasar-Dasar Basis Data | Dicatat sesuai judul pada buku | Pustakawan |
| pengarang_buku | Nama penulis buku | Andi Pratama | Dicatat sesuai informasi pada buku | Pustakawan |
| penerbit_buku | Nama penerbit buku | Penerbit Pendidikan | Dicatat sesuai informasi pada buku | Pustakawan |
| kode_eksemplar | Kode pembeda setiap buku fisik | BK-001 | Unik untuk setiap eksemplar | Pustakawan |
| status_eksemplar | Status ketersediaan eksemplar | Tersedia | Diperbarui saat peminjaman atau pengembalian | Pustakawan |
| kondisi_eksemplar | Kondisi fisik buku | Baik | Dicatat berdasarkan pemeriksaan fisik | Pustakawan |
| kode_petugas | Kode identitas petugas | PTG-01 | Wajib diisi dan unik | Kepala Perpustakaan |
| nama_petugas | Nama lengkap petugas | Siti Aminah | Dicatat sesuai identitas | Kepala Perpustakaan |
| peran_petugas | Tugas atau jabatan petugas | Pustakawan | Dicatat sesuai pembagian tugas yang ditetapkan Kepala Perpustakaan | Kepala Perpustakaan |
| no_pinjam | Nomor transaksi peminjaman | P-202610-001 | Wajib diisi, unik, dan tidak digunakan kembali | Pustakawan |
| kode_detail_peminjaman | Kode unik untuk setiap detail eksemplar dalam transaksi peminjaman | DP-202610-001 | Wajib diisi dan unik untuk setiap detail peminjaman; setiap detail mengacu pada satu eksemplar dalam satu transaksi | Pustakawan |
| kode_eksemplar_detail | Kode eksemplar fisik yang tercatat pada detail peminjaman | BK-001 | Harus mengacu pada eksemplar yang terdaftar | Pustakawan |
| tgl_pinjam | Tanggal peminjaman | 2026-10-17 | Dicatat sesuai tanggal transaksi sebenarnya | Pustakawan |
| tgl_harus_kembali | Batas pengembalian eksemplar | 2026-10-24 | Ditetapkan tujuh hari setelah tanggal peminjaman dan dicatat agar dapat diperiksa kembali | Pustakawan |
| tarif_denda_harian | Denda per eksemplar per hari | Rp7.000 | Tarif yang berlaku pada transaksi harus dapat ditelusuri jika aturan berubah | Pustakawan |
| tgl_kembali_fisik | Tanggal eksemplar dikembalikan | 2026-10-26 | Dicatat saat pengembalian; sebelum itu belum memiliki nilai | Pustakawan |
| hari_keterlambatan | Jumlah hari keterlambatan pengembalian buku | 2 hari | Dihitung dari tanggal pengembalian fisik dikurangi tanggal harus kembali; minimum 0 hari | Pustakawan |
| no_pembayaran | Nomor unik untuk setiap catatan pembayaran denda | BY-202610-001 | Wajib diisi dan tidak boleh sama dengan nomor pembayaran lain | Staf Administrasi |
| no_pinjam_pembayaran | Nomor peminjaman yang terkait dengan pembayaran denda | P-202610-001 | Harus mengacu pada transaksi peminjaman yang sesuai | Staf Administrasi |
| tanggal_pembayaran | Tanggal ketika pembayaran denda diterima | 26 Oktober 2026 | Wajib dicatat sesuai tanggal pembayaran sebenarnya | Staf Administrasi |
| jumlah_dibayar | Jumlah uang yang benar-benar diterima untuk pembayaran denda | Rp14.000 | Tidak boleh bernilai negatif dan harus sesuai jumlah yang diterima | Staf Administrasi |
| total_denda | Jumlah denda yang dikenakan berdasarkan keterlambatan | Rp14.000 | Dihitung berdasarkan jumlah eksemplar terlambat, jumlah hari keterlambatan, dan tarif denda | Pustakawan |

**Catatan:** Contoh nilai merupakan ilustrasi dan perlu disesuaikan dengan data nyata proyek. `hari_keterlambatan`, `total_denda`, dan `sisa_denda` merupakan hasil perhitungan, bukan nilai yang harus diisi secara manual. Hari keterlambatan dihitung dari tanggal pengembalian dan batas pengembalian. Total denda dihitung berdasarkan jumlah eksemplar yang terlambat, jumlah hari keterlambatan, dan tarif denda yang berlaku. Sisa denda dihitung dari total denda dikurangi seluruh pembayaran yang tercatat.

Setiap pembayaran dicatat melalui `no_pembayaran`, `no_pinjam_pembayaran`, `tanggal_pembayaran`, dan `jumlah_dibayar`. Jika anggota membayar secara bertahap, setiap pembayaran dicatat sebagai catatan terpisah. Elemen `tgl_harus_kembali` dicatat agar batas pengembalian pada saat transaksi dapat ditelusuri. Nomor HP anggota merupakan data yang perlu dilindungi dan hanya boleh diakses pihak yang berkepentingan.

## 9. Kebutuhan Non-Fungsional Data

Kebutuhan non-fungsional data menjelaskan kebutuhan terkait volume, ketepatan, keamanan, dan pemeliharaan data. Perhitungan berikut menggunakan dua digit terakhir NIM, yaitu 24.

### 9.1 Perhitungan Parameter P

Rumus:

P = (dua digit terakhir NIM mod 9) + 1

Perhitungan:

P = (24 mod 9) + 1

P = 6 + 1

**P = 7**

### 9.2 Perkiraan Volume Data

Perkiraan transaksi peminjaman per hari ditentukan dengan rumus:

40 + 5P transaksi per hari

Dengan P = 7:

40 + (5 × 7) = 40 + 35 = **75 transaksi per hari**.

Jika diasumsikan 30 hari operasional dalam satu bulan:

75 × 30 = **2.250 transaksi per bulan**.

Angka tersebut merupakan perkiraan perencanaan awal, bukan jumlah transaksi nyata.

### 9.3 Ketepatan dan Konsistensi Data

Data anggota, buku, eksemplar, petugas, dan transaksi harus dicatat secara konsisten. Nomor anggota, kode eksemplar, kode petugas, nomor peminjaman, dan nomor pembayaran harus dapat membedakan setiap data yang bersangkutan.

Status eksemplar harus mengikuti transaksi peminjaman dan pengembalian. Eksemplar yang sedang dipinjam tidak boleh ditampilkan sebagai tersedia. Perhitungan denda harus menggunakan tanggal pengembalian, batas pengembalian, dan tarif denda yang sesuai dengan transaksi.

Pembayaran denda harus dicatat berdasarkan transaksi peminjaman yang sesuai. Jika anggota membayar denda secara bertahap, setiap pembayaran harus dicatat sesuai jumlah dan tanggal pembayaran yang sebenarnya. Jumlah pembayaran yang sudah diterima harus sesuai dengan catatan transaksi, sedangkan sisa denda dihitung dari total denda dikurangi seluruh pembayaran yang tercatat.

### 9.4 Keamanan dan Privasi Data

Nomor HP dan informasi identitas anggota hanya digunakan untuk kepentingan pelayanan perpustakaan. Akses terhadap data tersebut dibatasi berdasarkan tugas dan tanggung jawab masing-masing petugas. Staf Administrasi dapat mengakses nomor HP dan informasi identitas anggota untuk keperluan pendaftaran, pembaruan data, serta pelayanan administrasi. Kepala Perpustakaan dapat mengakses data tersebut untuk keperluan pengawasan dan pengelolaan perpustakaan. Sementara itu, Pustakawan hanya dapat melihat informasi anggota yang diperlukan untuk proses peminjaman, pengembalian, dan pemeriksaan denda.

Data transaksi peminjaman, pengembalian, dan pembayaran denda juga harus dilindungi agar tidak diubah oleh pihak yang tidak berwenang. Setiap petugas hanya boleh mengakses dan mengubah data sesuai dengan tugasnya. Laporan perpustakaan cukup menampilkan informasi yang dibutuhkan untuk keperluan operasional dan evaluasi, tanpa menampilkan informasi pribadi anggota yang tidak berkaitan dengan tujuan laporan.

### 9.5 Retensi dan Pemeliharaan Data

Untuk rancangan awal proyek ini, data transaksi peminjaman, pengembalian, dan pembayaran denda direncanakan disimpan selama **3 tahun**. Jangka waktu ini merupakan keputusan rancangan awal untuk mendukung pemeriksaan riwayat sirkulasi, pemantauan pembayaran denda, evaluasi pelayanan, dan penelusuran transaksi sebelumnya. Jangka waktu tersebut bukan ketentuan minimum tugas.

Data anggota dan petugas perlu diperbarui ketika terjadi perubahan informasi atau status. Data pembayaran denda juga perlu dipelihara agar jumlah yang telah dibayar dan sisa denda dapat ditelusuri dengan jelas.

Sebelum data historis dihapus, pengelola perlu mempertimbangkan kebutuhan pelaporan dan penelusuran transaksi. Penerapan retensi pada sistem nyata harus disesuaikan dengan kebijakan organisasi yang berlaku.

## 10. Isu Kualitas Data yang Diantisipasi

| No. | Isu kualitas data | Dampak | Aturan terkait | Upaya pencegahan |
|---|---|---|---|---|
| 1 | Data anggota tercatat lebih dari satu kali | Identitas anggota menjadi ganda | Kamus Data (no_anggota dan nim_nip_anggota) | Memeriksa nomor anggota dan NIM/NIP sebelum membuat data baru |
| 2 | Status anggota tidak diperbarui | Anggota nonaktif masih dapat meminjam | AB-04 | Memperbarui status setelah informasi diverifikasi |
| 3 | Kode eksemplar digunakan berulang | Salinan fisik sulit dibedakan | AB-03 | Memberikan kode berbeda pada setiap eksemplar |
| 4 | Status eksemplar tidak sesuai kondisi sebenarnya | Eksemplar yang dipinjam dianggap tersedia | AB-05 | Memperbarui status pada peminjaman dan pengembalian |
| 5 | Jumlah eksemplar melebihi batas transaksi | Peminjaman melanggar ketentuan | AB-01 | Memeriksa jumlah eksemplar sebelum transaksi diselesaikan |
| 6 | Nomor peminjaman digunakan berulang | Riwayat transaksi sulit ditelusuri | AB-06 | Memastikan nomor setiap transaksi unik |
| 7 | Batas pengembalian salah dicatat | Pemeriksaan keterlambatan tidak akurat | AB-09 | Mencatat dan memeriksa tanggal batas pengembalian |
| 8 | Tarif transaksi lama berubah mengikuti tarif baru | Perhitungan denda historis keliru | AB-02, AB-08 | Menelusuri tarif yang berlaku pada transaksi |
| 9 | Denda dihitung tanpa memperhatikan jumlah eksemplar dan hari keterlambatan | Informasi denda tidak tepat | AB-02 | Memeriksa jumlah eksemplar, hari keterlambatan, dan tarif |
| 10 | Nomor HP diakses pihak tidak berkepentingan | Privasi anggota terganggu | Bagian 9.4 | Membatasi akses dan penggunaan data pribadi |
| 11 | Pengembalian tidak dicatat setelah buku diterima | Status eksemplar dan laporan tidak akurat | AB-05, AB-09 | Mencatat tanggal pengembalian dan memperbarui status |
| 12 | Data petugas dan perannya tidak diperbarui | Pembagian tugas tidak sesuai kondisi terbaru | AB-10 | Memperbarui data petugas dan peran saat terjadi perubahan |
| 13 | Pembayaran denda tidak dicatat setelah uang diterima | Riwayat pembayaran dan sisa denda tidak akurat | AB-11 | Mencatat setiap pembayaran yang benar-benar diterima beserta tanggal dan jumlahnya |
| 14 | Pembayaran denda dicatat lebih dari satu kali atau jumlahnya tidak sesuai | Total pembayaran dan sisa denda menjadi keliru | AB-11 | Memeriksa nomor pembayaran, transaksi peminjaman, tanggal, dan jumlah pembayaran sebelum menyimpan data |

Antrean saat peminjaman dapat berkaitan dengan pemeriksaan status anggota, pencarian eksemplar, dan pencatatan transaksi. Penerapan AB-04 membantu petugas memeriksa kelayakan anggota, sedangkan AB-05 mengatur status dan ketersediaan eksemplar. AB-07 mendukung pencarian data anggota menggunakan nomor anggota atau NIM/NIP.

Keluhan mengenai denda yang kurang transparan dapat ditangani dengan mencatat batas pengembalian, tanggal pengembalian sebenarnya, tarif denda yang berlaku, dan pembayaran yang telah diterima. Perhitungan denda perlu memperhatikan jumlah eksemplar yang terlambat dan jumlah hari keterlambatan. Pencatatan pembayaran denda dilakukan melalui PB-07 sesuai AB-11, termasuk jika anggota melakukan pembayaran secara bertahap. KI-02 mendukung penyediaan daftar keterlambatan, sedangkan KI-07 membantu Staf Administrasi dan Kepala Perpustakaan memantau pembayaran serta mengetahui sisa denda anggota.

Kesulitan melacak buku fisik dapat dikurangi dengan membedakan data judul buku dari data eksemplar, menggunakan kode eksemplar yang berbeda, dan memperbarui status setiap kali terjadi peminjaman atau pengembalian.

Dengan demikian, kebutuhan data yang dirancang diharapkan membantu meningkatkan ketepatan pencatatan anggota, koleksi, dan transaksi perpustakaan. Penerapan aturan bisnis serta pencatatan pembayaran denda melalui PB-07 juga diharapkan mempermudah penelusuran riwayat transaksi, meningkatkan transparansi perhitungan denda, dan membantu petugas memantau sisa pembayaran anggota.