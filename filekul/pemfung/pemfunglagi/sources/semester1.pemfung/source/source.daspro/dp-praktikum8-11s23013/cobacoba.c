#include <stdio.h> 
#include <stdbool.h> 
#include <string.h>

int main () 
  {
    char nama[50];
    // scanf(" %[^\n]", nama);
    fgets(nama, 50, stdin);
    nama[strlen(nama)-1]= '\0';
    
    int umur;
    scanf("%d", &umur);

    char hobi[50];
    // scanf(" %[^\n]", hobi); 
    fgets(hobi, 50, stdin);
    hobi[strlen(hobi)-1]= '\0';

    int kondisi_input;
    scanf("%d", &kondisi_input);
    bool kondisi = (kondisi_input != 0);

    printf("Hay %s, kamu telah berusia %d tahun.\n", nama, umur); 
    printf("Kamu memiliki hobi %s dan %s kamu seorang pelajar.\n", hobi, kondisi ? "benar" : "salah"); 
    
  return 0; 
  }