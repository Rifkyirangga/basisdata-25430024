   -- p01_lingkungan_25430024.sql
   -- Password sengaja diganti penanda. JANGAN commit password asli.
   CREATE DATABASE kopma_024
     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   CREATE USER 'mhs_024'@'localhost' IDENTIFIED BY '<password_kerja>';
   GRANT ALL PRIVILEGES ON kopma_024.* TO 'mhs_024'@'localhost';