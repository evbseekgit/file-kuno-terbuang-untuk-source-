#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Prototype Fungsi
void printDaftarTodo(char todos[][100], int angka, int capacity);
void tambah(char todos[][100], int *angka, int *capacity);
void ubah(char todos[][100], int angka);
void hapus(char todos[][100], int* angka, int pilih);

int main() {
    char todos[16][100]; // Kapasitas awal penyimpanan todo
    int angka = 0; // Jumlah todo yang sudah dimasukkan
    int capacity = 2; // Kapasitas awal penyimpanan
    int respond;
    int pilih;

    // Loop utama program
    do {
        printDaftarTodo(todos, angka, capacity); // Tampilkan daftar todo

        printf("\nMenu:\n");
        printf("1. Tambah Data\n");
        printf("2. Ubah Data\n");
        printf("3. Hapus Data\n");
        printf("0. Keluar\n");
        printf("Pilih: ");
        scanf("%d", &respond);

        // Membersihkan buffer stdin
        getchar();

        if (respond == 1) {
            tambah(todos, &angka, &capacity);
        } else if (respond == 2) {
            printf("\nMengubah Todo\n");
            printf("No todo: ");
            scanf("%d", &pilih);
            getchar(); // Membersihkan buffer stdin
            ubah(todos, angka);
        } else if (respond == 3) {
            printf("\nMenghapus Todo\n");
            printf("No todo: ");
            scanf("%d", &pilih);
            getchar(); // Membersihkan buffer stdin
            hapus(todos, &angka, pilih);
        } 
    } while (respond != 0);
    
    printf("\nMenutup aplikasi!");
    return 0;
}

void tambah(char todos[][100], int *angka, int *capacity) {
    char todo[100];

    // Memeriksa apakah kapasitas sudah penuh
    if (*angka >= *capacity) {
        // Perpanjang ukuran penyimpanan menjadi dua kali dari ukuran sebelumnya
        *capacity *= 2;
        printf("Kapasitas penyimpanan diperpanjang menjadi %d.\n", *capacity);
    }

    // Meminta pengguna untuk memasukkan todo
    printf("\nMenambah Todo: ");
    fgets(todo, 100, stdin);

    // Menghapus karakter newline ('\n') dari string jika ada
    size_t length = strlen(todo);
    if (todo[length - 1] == '\n') {
        todo[length - 1] = '\0';
    }

    // Validasi panjang todo
    if (strlen(todo) < 6) {
        printf("Gagal melakukan tindakan.\n");
        printf("Todo harus terdiri dari minimal 6 karakter.\n\n");
        return;
    }

    // Menyimpan todo ke dalam array
    strcpy(todos[*angka], todo);
    (*angka)++;

    printf("Berhasil melakukan tindakan.\n");
    printf("Todo baru yang ditambahkan '%s'.\n\n", todo);
}

void ubah(char todos[][100], int angka) {
    int pilih;

    printf("No todo: ");
    scanf("%d", &pilih);
    getchar(); // Membersihkan buffer stdin

    // Memeriksa apakah nomor todo valid
    if (pilih < 1 || pilih > angka) {
        printf("Gagal melakukan tindakan.\n");
        printf("No todo yang tersedia berada pada rentang 1 sampai %d.\n\n", angka);
        return;
    }

    // Meminta pengguna untuk memasukkan todo baru
    char todo_baru[100];
    printf("Ubah todo menjadi: ");
    fgets(todo_baru, 100, stdin);

    // Menghapus karakter newline ('\n') dari string jika ada
    size_t length = strlen(todo_baru);
    if (todo_baru[length - 1] == '\n') {
        todo_baru[length - 1] = '\0';
    }

    // Validasi panjang todo
    if (strlen(todo_baru) < 6) {
        printf("Gagal melakukan tindakan.\n");
        printf("Todo harus terdiri dari minimal 6 karakter.\n\n");
        return;
    }

    // Menyimpan todo sebelumnya
    char todo_sebelumnya[100];
    strcpy(todo_sebelumnya, todos[pilih - 1]);

    // Mengubah todo
    strcpy(todos[pilih - 1], todo_baru);

    printf("Berhasil melakukan tindakan.\n");
    printf("Todo '%s' telah diubah menjadi '%s'.\n\n", todo_sebelumnya, todo_baru);
}

void hapus(char todos[][100], int* angka, int pilih) {
    // Memeriksa apakah nomor todo valid
    if (pilih < 1 || pilih > *angka) {
        printf("Gagal melakukan tindakan.\n");
        printf("No todo yang tersedia berada pada rentang 1 sampai %d.\n\n", *angka);
        return;
    }

    // Menyimpan todo yang akan dihapus
    char todo_sebelumnya[100];
    strcpy(todo_sebelumnya, todos[pilih - 1]);

    // Menggeser todos ke kiri untuk menimpa todo yang dihapus
    for (int i = pilih - 1; i < *angka - 1; ++i) {
        strcpy(todos[i], todos[i + 1]);
    }

    // Mengurangi jumlah todo
    (*angka)--;

    printf("Berhasil melakukan tindakan.\n");
    printf("Todo '%s' telah dihapus.\n\n", todo_sebelumnya);
}

void printDaftarTodo(char todos[][100], int angka, int capacity) {
    printf("Daftar Todo [%d/%d]:\n", angka, capacity);
    if (angka == 0) {
        printf("- belum terdapat data yang tersedia!\n");
    } else {
        for (int i = 0; i < angka; ++i) {
            printf("%d. %s\n", i + 1, todos[i]);
        }
    }
}
