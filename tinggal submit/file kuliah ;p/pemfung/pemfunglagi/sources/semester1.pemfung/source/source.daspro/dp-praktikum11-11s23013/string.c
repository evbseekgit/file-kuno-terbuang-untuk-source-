#include <stdio.h> 
#include <string.h> 
 
int main() 
{ 
  // Deklarasi string 
  char firstName[] = "Abdullah"; 
  char lastName[20]; // Alokasi memori untuk string 
 
  // Menyalin string 
  strcpy(lastName, "Ubaid"); 
 
  // Menggabungkan string 
  strcat(firstName, " ");      // Menambahkan spasi di string "Abdullah" 
  strcat(firstName, lastName); // Menggabungkan "Abdullah " dan "Ubaid" 
 
  // Menghitung panjang string 
  int lenFirstName = strlen(firstName); 
  int lenLastName = strlen(lastName); 
 
  // Menampilkan hasil 
  printf("Nama Depan: %s\n", firstName); 
  printf("Panjang Nama Depan: %d\n", lenFirstName); 
  printf("Nama Belakang: %s\n", lastName); 
  printf("Panjang Nama Belakang: %d\n", lenLastName); 
 
  // Membandingkan string 
  int resultCompare = strcmp(firstName, lastName); 
  if (resultCompare == 0) 
  { 
    printf("Nama Depan dan Nama Belakang sama.\n"); 
  } 
  else 
  { 
    printf("Nama Depan dan Nama Belakang berbeda.\n"); 
  } 
 
  // Deklarasi string 
  char source[] = "Saya Sedang Belajar Bahasa Pemrograman C"; 
 
  // Menentukan panjang substring yang ingin diambil 
  int lenSubstring = 19; 
  char resultSubstring[lenSubstring + 1];
   
  // Menggunakan strncpy untuk memotong string 
  strncpy(resultSubstring, source, lenSubstring); 
  resultSubstring[lenSubstring] = '\0'; 
 
  // Menampilkan hasil 
  printf("String Asli   : %s\n", source); 
  printf("String Potong : %s\n", resultSubstring); 
 
  // Menggunakan strtok untuk memotong string berdasarkan spasi 
  char *token; 
  token = strtok(source, " "); 
 
  // Menampilkan setiap token hasil pemotongan 
  int counter = 0; 
  while (token != NULL) 
  { 
    counter++; 
    printf("Token ke-%d: %s\n", counter, token); 
 
    // Melanjutkan ke token berikutnya 
    token = strtok(NULL, " "); 
  } 
 
  // String array 
  char names[3][30]; 
  strcpy(names[0], "Abdullah"); 
  strcpy(names[1], "Aprialdy"); 
  strcpy(names[2], "Eduward"); 
 
  for (int i = 0; i < 3; i++) 
  { 
    printf("Nama ke-%d = %s\n", (i + 1), names[i]); 
  } 
 
  return 0; 
} 