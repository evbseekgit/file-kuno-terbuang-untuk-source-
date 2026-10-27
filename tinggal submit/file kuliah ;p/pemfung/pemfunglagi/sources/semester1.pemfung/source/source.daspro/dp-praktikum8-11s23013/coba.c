#include <stdio.h> 
#include <stdbool.h> 

int main () 
  {
    char nama[50];
    scanf(" %[^\n]", nama);
    
    int umur;
    scanf("%d", &umur);

    char hobi[50];
    scanf(" %[^\n]", hobi); 

    int kondisi_input;
    scanf("%d", &kondisi_input);
    bool kondisi = (kondisi_input != 0);

    printf("Hay %s, kamu telah berusia %d tahun.\n", nama, umur); 
    printf("Kamu memiliki hobi %s dan %s kamu seorang pelajar.\n", hobi, kondisi ? "benar" : "salah"); 
    
  return 0; 
  }