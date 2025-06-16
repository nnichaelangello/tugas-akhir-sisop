#!/bin/bash

clear_screen() {
    clear  # Membersihkan layar terminal untuk tampilan yang rapi
}

get_uptime() {
    uptime=$(cat /proc/uptime | cut -d'.' -f1)  # Mengambil waktu aktif sistem dari /proc/uptime dan mengambil bagian integer
    hours=$((uptime / 3600))  # Mengkonversi detik ke jam
    minutes=$(((uptime % 3600) / 60))  # Mengkonversi sisa detik ke menit
    seconds=$(((uptime % 3600) % 60))  # Mengkonversi sisa detik ke detik
    echo "Sistem sedang berjalan: $hours jam, $minutes menit, $seconds detik"  # Menampilkan durasi uptime
}

get_install_time() {
    # Aproksimasi waktu instalasi berdasarkan ctime root
    install_time=$(stat -c %y / | cut -d' ' -f1)  # Mengambil waktu pembuatan direktori root sebagai aproksimasi instalasi
    echo "Waktu Install: $install_time"  # Menampilkan waktu instalasi
}

display_menu() {
    clear_screen  # Memanggil fungsi untuk membersihkan layar
    echo "==================================="  # Mencetak garis pembatas atas
    echo "         SYSTEM TERMINAL           "  # Mencetak judul terminal
    echo "==================================="  # Mencetak garis pembatas tengah
    echo "1. Tampilkan Kehidupan Saat Ini"  # Opsi 1 untuk uptime
    echo "2. Informasi Jaringan"  # Opsi 2 untuk informasi jaringan
    echo "3. Tampilkan Detail OS"  # Opsi 3 untuk detail OS
    echo "4. Tampilkan Waktu Install Pertama OS"  # Opsi 4 untuk waktu instalasi
    echo "5. Informasi User"  # Opsi 5 untuk informasi user
    echo "6. Keluar"  # Opsi 6 untuk keluar
    echo "==================================="  # Mencetak garis pembatas bawah
}

option_1() {
    get_uptime  # Memanggil fungsi get_uptime untuk menampilkan uptime
}

option_2() {
    hostname=$(hostname)  # Mengambil nama host
    ip=$(hostname -I | awk '{print $1}')  # Mengambil alamat IP pertama
    echo "Hostname: $hostname"  # Menampilkan nama host
    echo "IP Address: $ip"  # Menampilkan alamat IP
}

option_3() {
    os=$(lsb_release -d | cut -f2)  # Mengambil nama OS dari lsb_release
    release=$(lsb_release -r | cut -f2)  # Mengambil versi release OS
    echo "Sistem Operasi: $os"  # Menampilkan nama OS
    echo "Release: $release"  # Menampilkan versi release
}

option_4() {
    get_install_time  # Memanggil fungsi get_install_time untuk menampilkan waktu instalasi
}

option_5() {
    user=$(whoami)  # Mengambil nama pengguna saat ini
    echo "User saat ini: $user"  # Menampilkan nama pengguna
}

while true; do
    display_menu  # Menampilkan menu utama
    read -p "Pilih opsi [1-6]: " choice  # Membaca input pilihan pengguna
    clear_screen  # Membersihkan layar setelah input
    case $choice in  # Memeriksa pilihan pengguna
        1) option_1 ;;  # Menjalankan opsi 1
        2) option_2 ;;  # Menjalankan opsi 2
        3) option_3 ;;  # Menjalankan opsi 3
        4) option_4 ;;  # Menjalankan opsi 4
        5) option_5 ;;  # Menjalankan opsi 5
        6) echo "Keluar dari terminal..."; break ;;  # Menutup program untuk opsi 6
        *) echo "Pilihan tidak valid, coba lagi." ;;  # Menampilkan pesan error untuk input tidak valid
    esac
    read -p "Tekan Enter untuk kembali ke menu..."  # Menunggu pengguna menekan Enter
done
