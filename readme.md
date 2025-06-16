# Tugas Akhir Sisop

## Deskripsi

Proyek ini merupakan tugas akhir mata kuliah Sistem Operasi (Sisop) yang mengimplementasikan sebuah terminal sederhana berbasis Bash untuk Ubuntu. Terminal ini dirancang untuk menampilkan berbagai informasi sistem, seperti uptime, detail jaringan, informasi OS, waktu instalasi, dan data pengguna, dengan antarmuka yang rapi dan fungsional.

## Cara Instalasi dan Penggunaan

### Prasyarat

- **Sistem Operasi**: Ubuntu
- **Bash**: Sudah tersedia secara default di Ubuntu (verifikasi dengan `bash --version`)

### Langkah-langkah Instalasi

1. Buka terminal.
2. Pastikan sistem diperbarui (opsional, tetapi disarankan):
  
  ```
  sudo apt update
  ```
  
3. Buat file script menggunakan editor `nano`:
  
  ```
  nano terminal.sh
  ```
  
4. Salin dan tempel kode Bash dari file `terminal.sh` yang disediakan, lalu simpan dengan `Ctrl+O`, tekan Enter, dan keluar dengan `Ctrl+X`.
5. Berikan izin eksekusi pada file:
  
  ```
  chmod +x terminal.sh
  ```
  
6. Jalankan script:
  
  ```
  ./terminal.sh
  ```
  ![image](https://github.com/user-attachments/assets/c64f455b-214b-4295-b5df-013d19425200)

## Fitur

- **Tampilkan Kehidupan Saat Ini**: Menampilkan durasi sistem telah berjalan sejak boot terakhir.
- **Informasi Jaringan**: Menampilkan hostname dan alamat IP perangkat.
- **Tampilkan Detail OS**: Menampilkan nama dan versi sistem operasi yang digunakan.
- **Tampilkan Waktu Install Pertama OS**: Menampilkan perkiraan waktu instalasi sistem.
- **Informasi User**: Menampilkan nama pengguna yang sedang login.
- **Keluar**: Menutup terminal dengan rapi.

## Penjelasan tentang Perubahan Permission

### Mengapa Harus Mengubah Permission?

Perintah `chmod +x terminal.sh` diperlukan agar file Bash dapat dijalankan langsung sebagai skrip eksekusi (misalnya dengan `./terminal.sh`). Tanpa izin eksekusi, sistem operasi tidak akan mengizinkan file tersebut dieksekusi sebagai program karena izin ini menunjukkan hak pengguna untuk menjalankan file.

### Izin Akses Sebelum Diubah

Sebelum `chmod +x`, izin default file biasanya `-rw-r--r--` (notasi oktal: `644`), yang berarti:

- Pemilik file memiliki izin **read (r)** dan **write (w)**, tetapi tidak **execute (x)**.
- Grup dan pengguna lain hanya memiliki izin **read (r)**, tanpa **write** atau **execute**.
- File tampak berwarna putih saat diperiksa dengan `ls`, menandakan file biasa tanpa izin eksekusi.

### Izin Akses Setelah Diubah

Setelah `chmod +x`, izin berubah menjadi `-rwxr-xr-x` (notasi oktal: `755`), yang berarti:

- Pemilik file memiliki izin **read (r)**, **write (w)**, dan **execute (x)**.
- Grup dan pengguna lain memiliki izin **read (r)** dan **execute (x)**, tetapi tidak **write**.
- File tampak berwarna hijau saat diperiksa dengan `ls`, menandakan file eksekusi.

## Penjelasan Fungsi-Fungsi dalam Kode

- **clear_screen()**
  - **Fungsi**: Membersihkan layar terminal sebelum menampilkan menu baru.
  - **Cara Kerja**: Menggunakan perintah `clear` untuk menyediakan tampilan yang rapi.
- **get_uptime()**
  - **Fungsi**: Menampilkan waktu aktif sistem sejak boot terakhir.
  - **Cara Kerja**: Membaca `/proc/uptime`, mengonversi detik ke jam, menit, dan detik menggunakan perhitungan Bash, lalu menampilkan hasilnya.
- **get_install_time()**
  - **Fungsi**: Menampilkan perkiraan waktu instalasi sistem operasi.
  - **Cara Kerja**: Menggunakan `stat -c %y /` untuk mendapatkan waktu pembuatan direktori root sebagai aproksimasi, kemudian memformatnya.
- **display_menu()**
  - **Fungsi**: Menampilkan menu utama dengan opsi-opsi yang tersedia.
  - **Cara Kerja**: Membersihkan layar dan mencetak header serta daftar opsi (1-6) dalam format terstruktur menggunakan `echo`.
- **option_1()**
  - **Fungsi**: Menjalankan opsi 1 untuk menampilkan uptime.
  - **Cara Kerja**: Memanggil `get_uptime()` dan mencetak hasilnya.
    
    ![image](https://github.com/user-attachments/assets/e70c1334-13fe-45d2-b9a0-78c81c1b40ee)
    
- **option_2()**
  - **Fungsi**: Menampilkan informasi jaringan (hostname dan IP address).
  - **Cara Kerja**: Menggunakan `socket.gethostname()` dan `socket.gethostbyname()` untuk data jaringan.
 
    ![image](https://github.com/user-attachments/assets/2cc55533-56b4-4aab-ac2c-20d1a674eff0)

- **option_3()**
  - **Fungsi**: Menampilkan detail sistem operasi.
  - **Cara Kerja**: Menggunakan `platform.platform()` dan `platform.release()` untuk nama dan versi OS.
 
    ![image](https://github.com/user-attachments/assets/4f29baf6-ef14-4b46-b2ce-41b48ab92ebc)

- **option_4()**
  - **Fungsi**: Menjalankan opsi 4 untuk menampilkan waktu instalasi.
  - **Cara Kerja**: Memanggil `get_install_time()` dan mencetak hasilnya.
 
    ![image](https://github.com/user-attachments/assets/bd586773-f368-4d5a-894f-7e3d5c8398a4)

- **option_5()**
  - **Fungsi**: Menampilkan informasi pengguna saat ini.
  - **Cara Kerja**: Menggunakan `getpass.getuser()` untuk nama pengguna yang login.

    ![image](https://github.com/user-attachments/assets/67692f3d-bde4-42a2-bb99-4d82bad0b49c)
    
- **Loop Utama (while true)**
  - **Fungsi**: Mengelola alur program dengan menampilkan menu dan menangani input pengguna.
  - **Cara Kerja**: Mengulang `display_menu`, membaca input dengan `read`, dan menggunakan `case` untuk memanggil fungsi sesuai pilihan (1-6), dengan opsi keluar atau pesan error untuk input tidak valid.
