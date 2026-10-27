#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TODO 3
#define MAX_LENGTH 50

typedef struct {
    char todos[MAX_TODO][MAX_LENGTH];
    int count;
} TodoList;

void displayMenu() {
    printf("\nMenu:\n");
    printf("1. Tambah Data\n");
    printf("2. Ubah Data\n");
    printf("3. Hapus Data\n");
    printf("0. Keluar\n");
    printf("Pilih: ");
}

void displayTodoList(TodoList *list) {
    printf("\nDaftar Todo [%d/%d]:\n", list->count, MAX_TODO);
    if (list->count == 0) {
        printf("- belum terdapat data yang tersedia!\n");
    } else {
        for (int i = 0; i < list->count; i++) {
            printf("%d. %s\n", i + 1, list->todos[i]);
        }
    }
}

void addTodo(TodoList *list, char *todo) {
    if (list->count < MAX_TODO) {
        strcpy(list->todos[list->count], todo);
        list->count++;
        printf("Berhasil melakukan tindakan.\n");
        printf("Todo baru yang ditambahkan '%s'.\n", todo);
    } else {
        printf("Gagal melakukan tindakan.\n");
        printf("Kapasitas penyimpanan telah penuh.\n");
        printf("Silahkan menghapus todo lama terlebih dahulu!\n");
    }
}

void deleteTodoByIndex(TodoList *list, int index) {
    if (index >= 0 && index < list->count) {
        printf("Berhasil melakukan tindakan.\n");
        printf("Todo '%s' telah dihapus.\n", list->todos[index]);
        for (int i = index; i < list->count - 1; i++) {
            strcpy(list->todos[i], list->todos[i + 1]);
        }
        list->count--;
    } else {
        printf("Gagal melakukan tindakan.\n");
        printf("No todo ini belum tersedia.\n");
    }
}

void updateTodoByIndex(TodoList *list, int index, char *todo) {
    if (index >= 0 && index < list->count) {
        printf("Berhasil melakukan tindakan.\n");
        printf("Todo '%s' telah diubah menjadi '%s'.\n", list->todos[index], todo);
        strcpy(list->todos[index], todo);
    } else {
        printf("Gagal melakukan tindakan.\n");
        printf("No todo ini belum tersedia.\n");
    }
}

int main() {
    TodoList todoList;
    todoList.count = 0;
    int choice, todoIndex;
    char todo[MAX_LENGTH];

    do {
        displayTodoList(&todoList);
        displayMenu();
        scanf("%d", &choice);
        getchar(); // Clearing input buffer

        switch (choice) {
            case 1:
                printf("\nMenambah Todo: ");
                fgets(todo, MAX_LENGTH, stdin);
                todo[strcspn(todo, "\n")] = '\0'; // Removing trailing newline
                addTodo(&todoList, todo);
                break;
            case 2:
                printf("\nMengubah Todo\nNo todo: ");
                scanf("%d", &todoIndex);
                getchar(); // Clearing input buffer
                printf("Ubah todo menjadi: ");
                fgets(todo, MAX_LENGTH, stdin);
                todo[strcspn(todo, "\n")] = '\0'; // Removing trailing newline
                updateTodoByIndex(&todoList, todoIndex - 1, todo);
                break;
            case 3:
                printf("\nMenghapus Todo\nNo todo: ");
                scanf("%d", &todoIndex);
                getchar(); // Clearing input buffer
                deleteTodoByIndex(&todoList, todoIndex - 1);
                break;
            case 0:
                printf("\nMenutup aplikasi!\n");
                break;
            default:
                printf("\nPilihan tidak valid!\n");
        }
    } while (choice != 0);

    return 0;
}
