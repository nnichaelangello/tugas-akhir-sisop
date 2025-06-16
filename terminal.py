import os
import platform
import time
import getpass
import socket
import datetime

def clear_screen():
    os.system('clear')

def get_uptime():
    with open('/proc/uptime', 'r') as f:
        uptime_seconds = float(f.readline().split()[0])
    return str(datetime.timedelta(seconds=uptime_seconds))

def get_install_time():
    return time.ctime(os.path.getctime('/'))

def display_menu():
    clear_screen()
    print("===================================")
    print("         SYSTEM TERMINAL           ")
    print("===================================")
    print("1. Tampilkan Kehidupan Saat Ini")
    print("2. Informasi Jaringan")
    print("3. Tampilkan Detail OS")
    print("4. Tampilkan Waktu Install Pertama OS")
    print("5. Informasi User")
    print("6. Keluar")
    print("===================================")

def option_1():
    uptime = get_uptime()
    print(f"Sistem sedang berjalan: {uptime}")

def option_2():
    hostname = socket.gethostname()
    ip = socket.gethostbyname(hostname)
    print(f"Hostname: {hostname}")
    print(f"IP Address: {ip}")

def option_3():
    distro = platform.platform()
    release = platform.release()
    print(f"Sistem Operasi: {distro}")
    print(f"Release: {release}")

def option_4():
    install_time = get_install_time()
    print(f"Waktu Install: {install_time}")

def option_5():
    user = getpass.getuser()
    print(f"User saat ini: {user}")

while True:
    display_menu()
    choice = input("Pilih opsi [1-6]: ")
    clear_screen()
    if choice == '1':
        option_1()
    elif choice == '2':
        option_2()
    elif choice == '3':
        option_3()
    elif choice == '4':
        option_4()
    elif choice == '5':
        option_5()
    elif choice == '6':
        print("Keluar dari terminal...")
        break
    else:
        print("Pilihan tidak valid, coba lagi.")
    input("Tekan Enter untuk kembali ke menu...")
