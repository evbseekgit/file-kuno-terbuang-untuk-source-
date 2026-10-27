#include <stdio.h>

int main() {
    int baris, kolom, penyebaran;

    // printf("Masukkan jumlah baris matriks, jumlah kolom matriks, dan jumlah penyebaran (dalam format 'baris kolom penyebaran'): ");
    scanf("%d %d %d", &baris, &kolom, &penyebaran);

    int matrix[baris][kolom];

    // Menginisialisasi semua elemen matriks dengan nilai 0
    for (int i = 0; i < baris; i++) {
        for (int j = 0; j < kolom; j++) {
            matrix[i][j] = 0;
        }
    }

    // Memproses penyebaran data
    for (int k = 0; k < penyebaran; k++) {
        int awal_baris, akhir_baris, awal_kolom, akhir_kolom;

       
        scanf("%d %d %d %d", &awal_baris, &akhir_baris, &awal_kolom, &akhir_kolom);

        // Memperbarui elemen-elemen matriks sesuai dengan rentang baris dan kolom yang ditentukan
        for (int i = awal_baris - 1; i < akhir_baris; i++) {
            for (int j = awal_kolom - 1; j < akhir_kolom; j++) {
                matrix[i][j] += 1;
            }
        }
    }

    // Menampilkan matriks setelah semua penyebaran data dilakukan
    printf("Visual penyebaran data:\n");
    for (int i = 0; i < baris; i++) {
        for (int j = 0; j < kolom; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
    

    return 0;
}
