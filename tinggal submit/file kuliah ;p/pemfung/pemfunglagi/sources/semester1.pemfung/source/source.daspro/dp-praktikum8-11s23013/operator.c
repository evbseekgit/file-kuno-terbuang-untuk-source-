#include <stdio.h> 
#include <stdbool.h> 
 
int main() 
{ 
  // Operator Aritmatika 
  int angka1 = 10, angka2 = 5; 
  int hasilPenjumlahan = angka1 + angka2; 
  int hasilPengurangan = angka1 - angka2; 
  int hasilPerkalian = angka1 * angka2; 
  int hasilPembagian = angka1 / angka2; 
  int sisaBagi = angka1 % angka2;

   printf("Penjumlahan: %d\n", hasilPenjumlahan); 
  printf("Pengurangan: %d\n", hasilPengurangan); 
  printf("Perkalian: %d\n", hasilPerkalian); 
  printf("Pembagian: %d\n", hasilPembagian); 
  printf("Sisa bagi: %d\n", sisaBagi); 
 
  // Operator Relasional 
  int nilai1 = 5, nilai2 = 10; 
  bool relasional1 = nilai1 > nilai2; 
  bool relasional2 = nilai1 < nilai2; 
  bool relasional3 = nilai1 == nilai2; 
  bool relasional4 = nilai1 != nilai2; 
 
  printf("%d > %d is %s\n", nilai1, nilai2, relasional1 ? "benar" : "salah"); 
  printf("%d < %d is %s\n", nilai1, nilai2, relasional2 ? "benar" : "salah"); 
  printf("%d == %d is %s\n", nilai1, nilai2, relasional3 ? "benar" : "salah"); 
  printf("%d != %d is %s\n", nilai1, nilai2, relasional4 ? "benar" : "salah"); 
 
  // Operator Logika 
  bool kondisi1 = true, kondisi2 = false; 
  bool logika1 = kondisi1 && kondisi2; 
  bool logika2 = kondisi1 || kondisi2; 
  bool logika3 = !kondisi1; 
 
  printf("%d && %d is %s\n", kondisi1, kondisi2, logika1 ? "benar" : "salah"); 
  printf("%d || %d is %s\n", kondisi1, kondisi2, logika2 ? "benar" : "salah"); 
  printf("!%d is %s\n", kondisi1, logika3 ? "benar" : "salah"); 
 
  // Operator Ternary 
  int angka = 42; 
  bool genap = (angka % 2 == 0); 
  printf("Nilai %d adalah %s\n", angka, genap ? "genap" : "ganjil"); 
 
  // Operator Bitwise 
  int a = 60; // 60 = 0011 1100 (dalam biner) 
  int b = 13; // 13 = 0000 1101 (dalam biner) 
 
  int hasilAnd = a & b;         // 12 = 0000 1100 
  int hasilOr = a | b;          // 61 = 0011 1101 
  int hasilXor = a ^ b;         // 49 = 0011 0001 
  int hasilLeftShift = a << 2;  // 240 = 1111 0000 (geser kiri 2 bit) 
  int hasilRightShift = a >> 2; // 15 = 0000 1111 (geser kanan 2 bit) 
  int hasilNotA = ~a;           // -61 = 1100 0011 (not dari 0011 1100) 
 
  printf("Hasil AND: %d\n", hasilAnd); 
  printf("Hasil OR: %d\n", hasilOr); 
  printf("Hasil XOR: %d\n", hasilXor); 
  printf("Hasil Left Shift: %d\n", hasilLeftShift); 
  printf("Hasil Right Shift: %d\n", hasilRightShift);

   printf("Hasil NOT dari a: %d\n", hasilNotA); 
 
  return 0; 
} 