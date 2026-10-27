#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TODO 3
#define MAX_TODO_LENGTH 50

void tambahTodo(char todos[][MAX_TODO_LENGTH], int *count) {
    if (*count >= MAX_TODO) {
        printf("\nMenambah Todo: Gagal melakukan tindakan.\nKapasitas penyimpanan telah penuh.\nSilahkan menghapus todo lama terlebih dahulu!\n");
        return;
    }

    char todo[MAX_TODO_LENGTH];
    printf("\nMenambah Todo: ");
    fgets(todo, MAX_TODO_LENGTH, stdin);
    todo[strcspn(todo, "\n")] = 0; // Menghapus karakter newline yang diambil oleh fgets

    strcpy(todos[*count], todo);
    (*count)++;

    printf("Berhasil melakukan tindakan.\nTodo baru yang ditambahkan '%s'.\n", todo);
}

void tampilkanTodos(char todos[][MAX_TODO_LENGTH], int count) {
    if (count == 0) {
        printf("\nDaftar Todo [0/%d]:\n", MAX_TODO);
        printf("- belum terdapat data yang tersedia!\n");
        return;
    }

    printf("\nDaftar Todo [%d/%d]:\n", count, MAX_TODO);
    for (int i = 0; i < count; i++) {
        printf("%d. %s\n", i + 1, todos[i]);
    }
}

void ubahTodo(char todos[][MAX_TODO_LENGTH], int count) {
    if (count == 0) {
        printf("\nTidak ada data yang tersedia untuk diubah!\n");
        return;
    }

    int index;
    printf("\nMasukkan nomor todo yang ingin diubah: ");
    scanf("%d", &index);
    getchar(); // Membersihkan newline karakter dari buffer stdin

    if (index < 1 || index > count) {
        printf("\nNomor todo tidak valid!\n");
        return;
    }

    char newTodo[MAX_TODO_LENGTH];
    printf("Masukkan todo baru: ");
    getchar(); // Membersihkan newline karakter yang masih ada di buffer stdin setelah scanf sebelumnya
    fgets(newTodo, MAX_TODO_LENGTH, stdin);
    newTodo[strcspn(newTodo, "\n")] = 0; // Menghapus karakter newline yang diambil oleh fgets

    strcpy(todos[index - 1], newTodo);
    printf("\nTodo berhasil diubah!\n");
}

void hapusTodo(char todos[][MAX_TODO_LENGTH], int *count) {
    if (*count == 0) {
        printf("\nTidak ada data yang dapat dihapus!\n");
        return;
    }

    int index;
    printf("\nMasukkan nomor todo yang ingin dihapus: ");
    scanf("%d", &index);
    getchar(); // Membersihkan newline karakter dari buffer stdin

    if (index < 1 || index > *count) {
        printf("\nNomor todo tidak valid!\n");
        return;
    }

    // Menggeser elemen-elemen setelah data yang dihapus
    for (int i = index - 1; i < *count - 1; i++) {
        strcpy(todos[i], todos[i + 1]);
    }

    (*count)--;
    printf("\nTodo berhasil dihapus!\n");
}

int main() {
    char todos[MAX_TODO][MAX_TODO_LENGTH];
    int count = 0;
    int pilihan;

    while (1) {
        tampilkanTodos(todos, count);
        printf("\nMenu:\n");
        printf("1. Tambah Data\n");
        printf("2. Ubah Data\n");
        printf("3. Hapus Data\n");
        printf("0. Keluar\n");
        printf("Pilih: ");
        scanf("%d", &pilihan);
        getchar(); // Membersihkan newline karakter dari buffer stdin

        switch (pilihan) {
            case 1:
                tambahTodo(todos, &count);
                break;
            case 2:
                ubahTodo(todos, count);
                break;
            case 3:
                hapusTodo(todos, &count);
                break;
            case 0:
                printf("\nMenutup aplikasi!\n");
                exit(0);
            default:
                printf("\nPilihan tidak valid!\n");
        }
    }

    return 0;
}
  