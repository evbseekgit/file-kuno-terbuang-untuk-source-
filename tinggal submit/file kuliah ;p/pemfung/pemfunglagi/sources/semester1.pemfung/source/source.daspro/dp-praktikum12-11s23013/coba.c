#include <stdio.h>

void tambahData() {
    // Fungsi untuk menambahkan data
    printf("Tambahkan data disini\n");
}

void ubahData() {
    // Fungsi untuk mengubah data
    printf("Ubah data disini\n");
}

void ubahStatus() {
    // Fungsi untuk mengubah status data
    printf("Ubah status data disini\n");
}

void filterData() {
    // Fungsi untuk memfilter data
    printf("Filter data disini\n");
}

void cariData() {
    // Fungsi untuk mencari data
    printf("Cari data disini\n");
}

void hapusData() {
    // Fungsi untuk menghapus data
    printf("Hapus data disini\n");
}

int main() {
    int pilihan;
    
    do {
        printf("\nMenu:\n");
        printf("1. Tambah Data\n");
        printf("2. Ubah Data\n");
        printf("3. Ubah Status\n");
        printf("4. Filter Data\n");
        printf("5. Cari Data\n");
        printf("6. Hapus Data\n");
        printf("0. Keluar\n");
        printf("Pilih: ");
        scanf("%d", &pilihan);
        
        switch (pilihan) {
            case 1:
                tambahData();
                break;
            case 2:
                ubahData();
                break;
            case 3:
                ubahStatus();
                break;
            case 4:
                filterData();
                break;
            case 5:
                cariData();
                break;
            case 6:
                hapusData();
                break;
            case 0:
                printf("Menutup aplikasi!\n");
                break;
            default:
                printf("Pilihan tidak valid. Silakan pilih kembali.\n");
        }
    } while (pilihan != 0);
    
    return 0;
}
