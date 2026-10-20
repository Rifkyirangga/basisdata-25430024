-- =========================================================
-- PROYEK BASIS DATA
-- Perpustakaan Digital Raharsa Inspirasi
-- NIM: 25430024
-- Modul 5: Membuat Struktur Tabel dengan DDL
-- DBMS: MariaDB
-- =========================================================

CREATE DATABASE IF NOT EXISTS perpus_024;
USE perpus_024;

-- ---------------------------------------------------------
-- 1. Hapus tabel lama agar skrip dapat dijalankan ulang.
-- Urutan penghapusan dimulai dari tabel anak.
-- ---------------------------------------------------------

DROP TABLE IF EXISTS PEMBAYARAN_DENDA;
DROP TABLE IF EXISTS DETAIL_PEMINJAMAN;
DROP TABLE IF EXISTS PEMINJAMAN;
DROP TABLE IF EXISTS EKSEMPLAR;
DROP TABLE IF EXISTS PETUGAS;
DROP TABLE IF EXISTS BUKU;
DROP TABLE IF EXISTS ANGGOTA;

-- ---------------------------------------------------------
-- 2. Tabel ANGGOTA
-- ---------------------------------------------------------

CREATE TABLE ANGGOTA (
    no_anggota VARCHAR(20) NOT NULL,
    nim_nip_anggota VARCHAR(30) NOT NULL,
    nama_anggota VARCHAR(100) NOT NULL,
    status_anggota VARCHAR(15) NOT NULL DEFAULT 'aktif',

    CONSTRAINT pk_anggota
        PRIMARY KEY (no_anggota),

    CONSTRAINT uq_anggota_nim_nip
        UNIQUE (nim_nip_anggota),

    CONSTRAINT ck_anggota_status
        CHECK (status_anggota IN ('aktif', 'nonaktif'))
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 3. Tabel BUKU
-- ---------------------------------------------------------

CREATE TABLE BUKU (
    isbn_buku VARCHAR(20) NOT NULL,
    judul_buku VARCHAR(200) NOT NULL,
    pengarang_buku VARCHAR(100) NOT NULL,
    penerbit_buku VARCHAR(100) NOT NULL,

    CONSTRAINT pk_buku
        PRIMARY KEY (isbn_buku)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 4. Tabel PETUGAS
-- ---------------------------------------------------------

CREATE TABLE PETUGAS (
    kode_petugas VARCHAR(20) NOT NULL,
    nama_petugas VARCHAR(100) NOT NULL,
    peran_petugas VARCHAR(30) NOT NULL,

    CONSTRAINT pk_petugas
        PRIMARY KEY (kode_petugas)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 5. Tabel EKSEMPLAR
-- Satu judul buku dapat memiliki beberapa eksemplar fisik.
-- ---------------------------------------------------------

CREATE TABLE EKSEMPLAR (
    kode_eksemplar VARCHAR(20) NOT NULL,
    isbn_buku VARCHAR(20) NOT NULL,
    status_eksemplar VARCHAR(15) NOT NULL DEFAULT 'tersedia',

    CONSTRAINT pk_eksemplar
        PRIMARY KEY (kode_eksemplar),

    CONSTRAINT fk_eksemplar_buku
        FOREIGN KEY (isbn_buku)
        REFERENCES BUKU (isbn_buku)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT ck_eksemplar_status
        CHECK (
            status_eksemplar IN
            ('tersedia', 'dipinjam', 'rusak', 'hilang')
        )
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 6. Tabel PEMINJAMAN
-- ---------------------------------------------------------

CREATE TABLE PEMINJAMAN (
    no_pinjam VARCHAR(20) NOT NULL,
    tgl_pinjam DATE NOT NULL,
    tgl_harus_kembali DATE NOT NULL,
    no_anggota VARCHAR(20) NOT NULL,
    kode_petugas VARCHAR(20) NOT NULL,
    tarif_denda_harian DECIMAL(12,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT pk_peminjaman
        PRIMARY KEY (no_pinjam),

    CONSTRAINT fk_peminjaman_anggota
        FOREIGN KEY (no_anggota)
        REFERENCES ANGGOTA (no_anggota)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_peminjaman_petugas
        FOREIGN KEY (kode_petugas)
        REFERENCES PETUGAS (kode_petugas)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT ck_peminjaman_tanggal
        CHECK (tgl_harus_kembali >= tgl_pinjam),

    CONSTRAINT ck_peminjaman_tarif_denda
        CHECK (tarif_denda_harian >= 0)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 7. Tabel DETAIL_PEMINJAMAN
-- ---------------------------------------------------------

CREATE TABLE DETAIL_PEMINJAMAN (
    kode_detail_peminjaman VARCHAR(20) NOT NULL,
    no_pinjam VARCHAR(20) NOT NULL,
    kode_eksemplar VARCHAR(20) NOT NULL,
    tgl_kembali_fisik DATE NULL,
    kondisi_eksemplar VARCHAR(15) NOT NULL DEFAULT 'baik',
    status_pengembalian VARCHAR(15) NOT NULL DEFAULT 'dipinjam',

    CONSTRAINT pk_detail_peminjaman
        PRIMARY KEY (kode_detail_peminjaman),

    CONSTRAINT fk_detail_peminjaman_peminjaman
        FOREIGN KEY (no_pinjam)
        REFERENCES PEMINJAMAN (no_pinjam)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_detail_peminjaman_eksemplar
        FOREIGN KEY (kode_eksemplar)
        REFERENCES EKSEMPLAR (kode_eksemplar)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_detail_pinjam_eksemplar
        UNIQUE (no_pinjam, kode_eksemplar),

    CONSTRAINT ck_detail_kondisi
        CHECK (
            kondisi_eksemplar IN
            ('baik', 'rusak', 'hilang')
        ),

    CONSTRAINT ck_detail_status_pengembalian
        CHECK (
            status_pengembalian IN
            ('dipinjam', 'kembali')
        )
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 8. Tabel PEMBAYARAN_DENDA
-- ---------------------------------------------------------

CREATE TABLE PEMBAYARAN_DENDA (
    no_pembayaran VARCHAR(20) NOT NULL,
    no_pinjam VARCHAR(20) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_dibayar DECIMAL(12,2) NOT NULL,

    CONSTRAINT pk_pembayaran_denda
        PRIMARY KEY (no_pembayaran),

    CONSTRAINT fk_pembayaran_denda_peminjaman
        FOREIGN KEY (no_pinjam)
        REFERENCES PEMINJAMAN (no_pinjam)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT ck_pembayaran_jumlah
        CHECK (jumlah_dibayar > 0)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- 9. Verifikasi struktur tabel
-- ---------------------------------------------------------

SHOW TABLES;

DESCRIBE ANGGOTA;
DESCRIBE BUKU;
DESCRIBE EKSEMPLAR;
DESCRIBE PETUGAS;
DESCRIBE PEMINJAMAN;
DESCRIBE DETAIL_PEMINJAMAN;
DESCRIBE PEMBAYARAN_DENDA;