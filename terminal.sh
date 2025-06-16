clear_screen() {
    clear
}

get_uptime() {
    uptime=$(cat /proc/uptime | cut -d'.' -f1)
    hours=$((uptime / 3600))
    minutes=$(((uptime % 3600) / 60))
    seconds=$(((uptime % 3600) % 60))
    echo "Sistem sedang berjalan: $hours jam, $minutes menit, $seconds detik"
}

get_install_time() {
    # Aproksimasi waktu instalasi berdasarkan ctime root
    install_time=$(stat -c %y / | cut -d' ' -f1)
    echo "Waktu Install: $install_time"
}

display_menu() {
    clear_screen
    echo "==================================="
    echo "         SYSTEM TERMINAL           "
    echo "==================================="
    echo "1. Tampilkan Kehidupan Saat Ini"
    echo "2. Informasi Jaringan"
    echo "3. Tampilkan Detail OS"
    echo "4. Tampilkan Waktu Install Pertama OS"
    echo "5. Informasi User"
    echo "6. Keluar"
    echo "==================================="
}

option_1() {
    get_uptime
}

option_2() {
    hostname=$(hostname)
    ip=$(hostname -I | awk '{print $1}')
    echo "Hostname: $hostname"
    echo "IP Address: $ip"
}

option_3() {
    os=$(lsb_release -d | cut -f2)
    release=$(lsb_release -r | cut -f2)
    echo "Sistem Operasi: $os"
    echo "Release: $release"
}

option_4() {
    get_install_time
}

option_5() {
    user=$(whoami)
    echo "User saat ini: $user"
}

while true; do
    display_menu
    read -p "Pilih opsi [1-6]: " choice
    clear_screen
    case $choice in
        1) option_1 ;;
        2) option_2 ;;
        3) option_3 ;;
        4) option_4 ;;
        5) option_5 ;;
        6) echo "Keluar dari terminal..."; break ;;
        *) echo "Pilihan tidak valid, coba lagi." ;;
    esac
    read -p "Tekan Enter untuk kembali ke menu..."
done
