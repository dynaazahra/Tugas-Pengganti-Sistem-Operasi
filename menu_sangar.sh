#!/bin/bash

# Warna
pink='\033[1;35m'
ungu='\033[1;95m'
biru='\033[1;94m'
hijau='\033[1;32m'
kuning='\033[1;33m'
normal='\033[0m'

# Fungsi untuk membersihkan layar dan menampilkan menu
tampilkan_menu() {
    clear
    echo -e "${pink}_________________________________________${normal}"
    echo -e "${ungu}    ♡ MENU INFORMASI JARINGAN ♡ ${normal}"
    echo -e "${pink}_________________________________________${normal}"
    echo -e "${biru}1.${normal} Menampilkan tanggal dan waktu saat ini  ⏰"
    echo -e "${biru}2.${normal} Menampilkan isi direktori saat ini 📁"
    echo -e "${biru}3.${normal} Menampilkan informasi jaringan 🌐"
    echo -e "${biru}4.${normal} Menampilkan detail OS dan kernel 🖥️"
    echo -e "${biru}5.${normal} Menampilkan waktu install pertama kali ⏳"
    echo -e "${biru}6.${normal} Info pengguna saat ini 👤"
    echo -e "${biru}7.${normal} Keluar dari program ✋"
    echo -e "${pink}_________________________________________${normal}"
    echo -n "Pilih menu (1-7): "
}

# Fungsi untuk menampilkan tanggal dan waktu saat ini
tampilkan_waktu() {
    echo -e "${hijau}Tanggal dan waktu saat ini: ${normal}$(date)"
    read -p "Tekan Enter untuk kembali ke menu..." anykey
}

# Fungsi untuk menampilkan isi direktori saat ini
tampilkan_direktori() {
    echo -e "${hijau}Isi direktori saat ini:${normal}"
    ls --color=auto
    read -p "Tekan Enter untuk kembali ke menu..." anykey
}

# Fungsi untuk menampilkan informasi jaringan
tampilkan_jaringan() {
    echo -e "${hijau}Informasi Jaringan:${normal}"
    echo -e "IP Address:"
    ip a | grep -E "inet"
    echo -e "\nNetworkManager:"
    nmcli device show
    read -p "Tekan Enter untuk kembali ke menu..." anykey
}

# Fungsi untuk menampilkan detail OS dan kernel
tampilkan_os_kernel() {
    echo -e "${hijau}Detail OS dan Kernel:${normal}"
    uname -a
    read -p "Tekan Enter untuk kembali ke menu..." anykey
}

# Fungsi untuk menampilkan waktu install pertama kali
waktu_install() {
    echo -e "${hijau}Waktu Install Pertama Kali:${normal}"
    sudo tune2fs -l /dev/sda1 | grep "Filesystem created"
    read -p "Tekan Enter untuk kembali ke menu..." anykey
}

# Fungsi untuk menampilkan info pengguna saat ini
info_pengguna() {
    echo -e "${hijau}Info Pengguna Saat Ini:${normal}"
    whoami
    echo -e "UID: $(id -u)"
    echo -e "GID: $(id -g)"
    read -p "Tekan Enter untuk kembali ke menu..." anykey
}

# Fungsi untuk keluar dari program
keluar_program() {
    echo -e "${ungu}Terima kasih telah menggunakan program ini! 😘${normal}"
    sleep 1
    echo -e "${kuning}Sampai jumpa lagi! 👋${normal}"
    sleep 1
    exit 0
}

# Fungsi untuk efek animasi loading (opsional)
loading_efek() {
    echo -e "${pink}Sedang memuat...${normal}"
    for i in {1..5}; do
        echo -n "."
        sleep 0.5
    done
    echo
}

# Program utama
while true; do
    tampilkan_menu
    read pilihan
    case $pilihan in
        1) tampilkan_waktu;;
        2) tampilkan_direktori;;
        3) tampilkan_jaringan;;
        4) tampilkan_os_kernel;;
        5) waktu_install;;
        6) info_pengguna;;
        7) keluar_program;;
        *) echo -e "${pink}Pilihan tidak valid! Silakan pilih antara 1-7.${normal}"; sleep 1; loading_efek;;
    esac
done
