#include <stdio.h>

// Deklarasi variabel global
int target = 51;

int tebakan(int n) 
{ 
  if (n == target) 
  { 
    return 1; 
  } 
  else 
  { 
    return 0; 
  } 
}

int main() 
{ 
  int myGuess, totalGuess = 0; 

  printf("Silahkan tebak angka antara 1 sampai 100:\n");
  do {
    scanf("%d", &myGuess);
    totalGuess++; // Menambahkan jumlah tebakan

    if (tebakan(myGuess)) {
      printf("Hore, kamu berhasil menebak angka dengan benar.\n");
      break;
    } else if (myGuess < target) {
      printf("Angka lebih besar!\n");
    } else {
      printf("Angka lebih kecil!\n");
    }
  } while(1);

  printf("Jumlah looping yang terjadi: %d\n", totalGuess);
  return 0; 
} 
