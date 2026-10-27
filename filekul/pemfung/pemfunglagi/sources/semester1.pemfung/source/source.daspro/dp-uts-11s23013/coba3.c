#include <stdio.h>

void faktorial(int masukan, int *hasil);

int main() {
    int masukan;
    int hasil = 1;

    printf("Masukkan angka = ");
    scanf("%d", &masukan);
    faktorial(masukan, &hasil);
    printf("Hasil faktorial = %d", hasil);

    return 0;
}

void faktorial(int masukan, int *hasil) {
    if (masukan == 0 || masukan == 1) {
        *hasil = 1;
    } else {
        *hasil *= masukan;
        faktorial(masukan - 1, hasil); // Perbarui nilai masukan, bukan hasil
    }
}