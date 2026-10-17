# Dokumen Kebutuhan Data - Perpustakaan Utama Nusa Bangsa

## 1. Latar belakang dan aktivitas organisasi
Perpustakaan Utama Nusa Bangsa melayani peminjaman dan pengembalian buku bagi sivitas akademika. Proses peminjaman dilakukan oleh petugas perpustakaan berdasarkan kartu anggota. Keluhan operasional utama meliputi antrean panjang saat peminjaman, keterlambatan pengembalian buku tanpa perhitungan denda yang transparan, serta kesulitan melacak posisi eksemplar fisik buku. Sistem basis data ini dirancang untuk mencatat sirkulasi peminjaman, eksemplar buku, dan denda secara terstruktur.

## 2. Aktor dan proses bisnis
| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mendaftarkan anggota | Petugas | Mahasiswa/Dosen mendaftar keanggotaan perpustakaan |
| PB-02 | Mencatat peminjaman buku | Petugas | Anggota datang meminjam eksemplar buku |
| PB-03 | Mencatat pengembalian dan denda | Petugas | Anggota mengembalikan buku yang dipinjam |
| PB-04 | Mengelola katalog dan eksemplar | Petugas | Terdapat penambahan buku baru atau perubahan kondisi fisik |
| PB-05 | Menyusun laporan sirkulasi | Kepala Perpustakaan | Periode laporan bulanan tiba |

## 3. Dokumen sumber yang dianalisis
| Isian pada Slip Peminjaman | Disimpan / dihitung | Alasan |
|---|---|---|
| Nomor pinjam | Disimpan | Pengenal unik untuk tiap transaksi peminjaman |
| Tanggal pinjam | Disimpan | Mencatat batas awal waktu peminjaman |
| Tanggal harus kembali | Disimpan | Acuan perhitungan keterlambatan dan denda |
| Anggota | Disimpan | Identitas peminjam buku |
| Kode eksemplar | Disimpan | Mengidentifikasi fisik buku spesifik yang dipinjam |
| Tarif denda per hari | Disimpan | Tarif denda historis saat transaksi terjadi (Rp7.000/hari) |
| Total denda | Dihitung | Nilai turunan dari selisih hari keterlambatan x Rp7.000 |

## 4. Entitas kandidat dan elemen data
| Entitas kandidat | Elemen data utama | Sumber |
|---|---|---|
| **Anggota** | nomor anggota, NIM/NIP, nama, status aktif | Formulir pendaftaran |
| **Buku** | ISBN, judul, pengarang, penerbit | Katalog buku |
| **Eksemplar** | kode eksemplar, ISBN, status ketersediaan, kondisi | Slip pemeriksaan fisik |
| **Petugas** | kode petugas, nama petugas, peran | Data kepegawaian |
| **Peminjaman** | nomor pinjam, tanggal pinjam, tgl harus kembali, nomor anggota, kode petugas | Slip peminjaman |
| **Detail peminjaman** | nomor pinjam, kode eksemplar, tgl kembali fisik, denda harian | Slip peminjaman |

## 5. Aturan bisnis
| Kode | Aturan bisnis |
|---|---|
| **AB-01** | Setiap anggota aktif dapat meminjam maksimal 9 eksemplar buku dalam satu transaksi peminjaman (berdasarkan parameter P=7, yaitu P+2 = 9). |
| **AB-02** | Denda keterlambatan pengembalian buku ditetapkan sebesar Rp7.000 per hari untuk setiap eksemplar buku (berdasarkan parameter P=7). |
| **AB-03** | Satu judul buku (ISBN) dapat memiliki lebih dari satu kode eksemplar fisik. |
| **AB-04** | Peminjaman hanya dapat diproses apabila status keaktifan anggota bernilai aktif. |
| **AB-05** | Eksemplar buku yang sedang dipinjam tidak dapat dipinjamkan kepada anggota lain hingga statusnya kembali tersedia. |
| **AB-06** | Setiap transaksi peminjaman memiliki nomor pinjam unik dan dicatat oleh petugas yang bertugas. |
| **AB-07** | Pencarian data anggota dapat dilakukan melalui nomor anggota atau NIM/NIP. |
| **AB-08** | Tarif denda harian yang berlaku saat keterlambatan dicatat pada detail peminjaman agar nilai denda historis tidak berubah. |

## 6. Kebutuhan informasi
| Kode | Kebutuhan informasi | Data yang diperlukan |
|---|---|---|
| **KI-01** | Laporan rekapitulasi peminjaman harian dan bulanan | Peminjaman, Detail peminjaman |
| **KI-02** | Daftar eksemplar buku yang sedang terlamabat dikembalikan beserta total dendanya | Peminjaman, Detail peminjaman, Anggota, Eksemplar |
| **KI-03** | Sepuluh judul buku terpopuler paling sering dipinjam per bulan | Detail peminjaman, Eksemplar, Buku |
| **KI-04** | Daftar anggota yang memiliki tunggakan denda | Anggota, Peminjaman, Detail peminjaman |
| **KI-05** | Laporan ketersediaan stok eksemplar per judul buku | Buku, Eksemplar |

## 7. Matriks CRUD
| Proses bisnis | Anggota | Buku | Eksemplar | Petugas | Peminjaman | Detail peminjaman |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| **PB-01** Mendaftarkan anggota | C, R, U | - | - | - | - | - |
| **PB-02** Mencatat peminjaman | R | R | R, U | R | C | C |
| **PB-03** Mencatat pengembalian | R | R | R, U | R | R | U |
| **PB-04** Mengelola katalog | - | C, R, U | C, R, U | - | - | - |
| **PB-05** Laporan sirkulasi | R | R | R | R | R | R |

## 8. Kamus data awal
| Elemen | Arti | Contoh | Aturan | Penanggung jawab | Entitas |
|---|---|---|---|---|---|
| no_anggota | Nomor unik keanggotaan | M-2026-001 | Unik, format M-YYYY-3digit | Kepala Perpustakaan | Anggota |
| nim_nip_anggota | Nomor identitas mahasiswa/dosen | 25430024 | Unik, 8-18 digit | Kepala Perpustakaan | Anggota |
| nama_anggota | Nama lengkap anggota | Rifky Irangga | Wajib diisi, teks | Kepala Perpustakaan | Anggota |
| no_hp_anggota | Nomor HP anggota | 081234567890 | Data pribadi, akses terbatas | Kepala Perpustakaan | Anggota |
| status_anggota | Status keaktifan | aktif | Nilai: aktif/nonaktif | Kepala Perpustakaan | Anggota |
| isbn_buku | Nomor standar buku internasional | 978-602-8519-93-0 | Unik, format ISBN | Petugas | Buku |
| judul_buku | Judul lengkap buku | Sistem Basis Data | Wajib diisi, teks | Petugas | Buku |
| pengarang_buku | Nama pengarang buku | Fathansyah | Wajib diisi, teks | Petugas | Buku |
| kode_eksemplar | Kode unik fisik buku | EKS-978-01 | Unik per fisik buku | Petugas | Eksemplar |
| status_eksemplar | Status ketersediaan fisik | dipinjam | Nilai: tersedia/dipinjam | Petugas | Eksemplar |
| kondisi_eksemplar | Kondisi fisik buku | baik | Nilai: baik/rusak | Petugas | Eksemplar |
| kode_petugas | Kode unik petugas | PTG-01 | Unik, 6 karakter | Kepala Perpustakaan | Petugas |
| nama_petugas | Nama petugas | Dian | Wajib diisi, teks | Kepala Perpustakaan | Petugas |
| no_pinjam | Nomor unik transaksi pinjam | P-202610-001 | Unik per transaksi | Petugas | Peminjaman |
| tgl_pinjam | Tanggal transaksi peminjaman | 2026-10-16 | Format YYYY-MM-DD | Petugas | Peminjaman |
| tgl_harus_kembali | Batas tanggal pengembalian | 2026-10-23 | Format YYYY-MM-DD | Petugas | Peminjaman |
| tgl_kembali_fisik | Tanggal riil buku dikembalikan | 2026-10-25 | Format YYYY-MM-DD | Petugas | Detail peminjaman |
| tarif_denda_harian | Tarif denda per hari keterlambatan | 7000 | Bilangan bulat >= 0 (Rp7.000) | Petugas | Detail peminjaman |
| denda_dibayar | Jumlah denda yang dibayarkan | 14000 | Bilangan bulat >= 0 | Petugas | Detail peminjaman |
| peran_petugas | Peran operasional petugas | Sirkulasi | Wajib diisi, teks | Kepala Perpustakaan | Petugas |

## 9. Kebutuhan non-fungsional data
* **Perhitungan Parameter P:**
  * NIM: `25430024` $\rightarrow$ 2 digit terakhir $= 24$.
  * $P = (24 \bmod 9) + 1 = 6 + 1 = 7$.
  * Batas maks item $= P + 2 = 9$ item.
  * Tarif denda $= P \times \text{Rp1.000} = \text{Rp7.000}$ per hari.
  * Volume harian $= 40 + (5 \times P) = 40 + 35 = 75$ transaksi peminjaman/hari.
* **Retensi Data:** Data transaksi peminjaman disimpan sekurang-kurangnya 3 tahun untuk audit arsip sirkulasi.
* **Privasi dan Keamanan:** Nomor HP anggota (`no_hp_anggota`) dikategorikan sebagai data pribadi dengan akses terbatas yang hanya boleh diakses oleh Kepala Perpustakaan.

## 10. Isu kualitas data yang diantisipasi
* **Ketidaksesuaian Status Fisik Eksemplar:** Risiko fisik buku rusak/hilang tetapi di sistem masih tercatat tersedia.
  * *Mitigasi:* Verifikasi otomatis status eksemplar saat transaksi peminjaman dan pengembalian.
* **Duplikasi Data Anggota:** Risiko pendaftaran ulang anggota yang sudah terdaftar.
  * *Mitigasi:* Penerapan constraint unik pada kolom NIM/NIP (`nim_nip_anggota`).