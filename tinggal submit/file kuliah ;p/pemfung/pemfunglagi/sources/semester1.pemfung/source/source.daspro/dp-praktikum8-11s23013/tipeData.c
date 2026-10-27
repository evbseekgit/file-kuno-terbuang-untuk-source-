#include <stdio.h> 
#include <stdbool.h> 

int main ()
  { 
  // Tipe data integer 
  int angka = 42; 
 
  // Tipe data floating-point 
  float angkaDesimal = 3.14; 
 
  // Tipe data double 
  double angkaDouble = 3.141592653589793; 
 
  // Tipe data karakter 
  char karakter = 'A'; 
 
  // Tipe data string 
  char kata[] = "Abdullah Ubaid"; 
 
  // Tipe data boolean 
  bool kondisi = true; 
 
  // Menampilkan nilai dari setiap variabel 
  printf("Tipe data integer: %d\n", angka); 
  printf("Tipe data floating-point: %f\n", angkaDesimal); 
  printf("Tipe data double: %lf\n", angkaDouble); 
  printf("Tipe data karakter: %c\n", karakter); 
  printf("Tipe data string: %s\n", kata); 
  printf("Tipe data boolean: %s\n", kondisi ? "benar" : "salah"); 
 
  return 0; 
} 

//%d: Digunakan untuk mencetak nilai bilangan bulat (integer). Contoh: int x = 10; printf("Nilai x = %d\n", x); akan mencetak "Nilai x = 10".

//%f: Digunakan untuk mencetak nilai floating point (bilangan pecahan) dengan presisi enam digit di belakang koma desimal secara default. Contoh: float y = 3.14; printf("Nilai y = %f\n", y); akan mencetak "Nilai y = 3.140000".

//%lf: Digunakan untuk mencetak nilai floating point (bilangan pecahan) dengan presisi enam digit di belakang koma desimal secara default, namun format specifier ini secara khusus digunakan untuk tipe data double. Contoh: double z = 2.718; printf("Nilai z = %lf\n", z); akan mencetak "Nilai z = 2.718000".

//%c: Digunakan untuk mencetak karakter tunggal. Contoh: char ch = 'A'; printf("Karakter: %c\n", ch); akan mencetak "Karakter: A".

//%s: Digunakan untuk mencetak string (array karakter). Contoh: char str[] = "Hello"; printf("String: %s\n", str); akan mencetak "String: Hello".