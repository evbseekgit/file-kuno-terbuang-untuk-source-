#include <stdio.h>
#include <stdlib.h>

int main() {
    int rows, cols;

    // Meminta ukuran matriks
    printf("Masukkan jumlah baris matriks: ");
    scanf("%d", &rows);
    printf("Masukkan jumlah kolom matriks: ");
    scanf("%d", &cols);

    // Mengalokasikan memori untuk matriks A, B, dan C
    int *a = (int *)malloc(rows * cols * sizeof(int));
    int *b = (int *)malloc(rows * cols * sizeof(int));
    int *c = (int *)malloc(rows * cols * sizeof(int));

    // Memastikan alokasi memori berhasil
    if (a == NULL || b == NULL || c == NULL) {
        printf("Memori tidak cukup.\n");
        return 1;
    }

    // Input untuk matriks A
    printf("Masukkan elemen-elemen matriks A (%d x %d):\n", rows, cols);
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("A[%d][%d]: ", i, j);
            scanf("%d", &a[i * cols + j]);
        }
    }

    // Input untuk matriks B
    printf("Masukkan elemen-elemen matriks B (%d x %d):\n", rows, cols);
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("B[%d][%d]: ", i, j);
            scanf("%d", &b[i * cols + j]);
        }
    }

    // Menjumlahkan matriks A dan B menjadi matriks C
    for (int i = 0; i < rows * cols; i++) {
        c[i] = a[i] + b[i];
    }

    // Menampilkan hasil matriks C
    printf("\nHasil penjumlahan matriks A dan B adalah matriks C:\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%d ", c[i * cols + j]);
        }
        printf("\n");
    }

    // Membebaskan memori
    free(a);
    free(b);
    free(c);

    return 0;
}
