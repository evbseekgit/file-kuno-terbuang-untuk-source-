#include <stdio.h> 
 
int main() 
{ 
  // Input dari pengguna 
  printf("Masukkan sebuah angka: "); 
  int angka; 
  scanf("%d", &angka); 
 
  // Output nilai yang dimasukkan 
  printf("Anda memasukkan angka: %d\n", angka); 
 
  // Operasi sederhana 
  int hasilKuadrat = angka * angka; 
 
  // Menampilkan hasil operasi 
  printf("Hasil kuadrat: %d\n", hasilKuadrat); 
 
  return 0; 
}