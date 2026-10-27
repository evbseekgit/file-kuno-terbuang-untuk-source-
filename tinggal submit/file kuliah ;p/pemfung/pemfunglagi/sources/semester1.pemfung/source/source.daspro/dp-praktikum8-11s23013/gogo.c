#include <stdio.h>

void ridho (char nama[20], int umur )
{
  printf("nama saya %s\n",nama);
  printf("umur saya %d",umur);
}

int main ()
{
  char nama[20];
  // scanf("%s",&nama);
  fgets(nama, 20, stdin);
  nama[strlen(nama)-1]= '\0';

  int umur;
  scanf("%d",&umur);

  ridho(nama, umur);

  return 0;
}