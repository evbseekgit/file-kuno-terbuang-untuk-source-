#include <stdio.h>

int main() 
{ 
  int angkaAwal, angkaAkhir;

  // Input dua angka dari pengguna
  printf("Masukkan angka awal: ");
  scanf("%d", &angkaAwal);

  printf("Masukkan angka akhir: ");
  scanf("%d", &angkaAkhir);

  // Looping menggunakan for
  for (int i = angkaAwal; i <= angkaAkhir; i++) 
  { 
    // Periksa apakah angka i adalah kelipatan dari 3
    if (i % 3 == 0)
    {
      printf("I"); 
      angkaAwal++; // Menambahkan angkaAwal
      printf("angkaAwal setelah diincrement: %d\n", angkaAwal); // Cetak angkaAwal setelah diincrement
    } 
  } 

  return 0;
}
