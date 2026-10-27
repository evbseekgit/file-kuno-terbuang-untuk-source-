#include <stdio.h>
#include <string.h>

typedef struct {
  char nama[50];
  int nim;
  double nilai;
  char gender[10];
}mahasiswa;

int main (){

  mahasiswa data;
  char status[10];

  printf("masukkan nama : ");
  scanf("%49s", &data.nama);
  printf("masukkan nim : ");
  scanf("%d", &data.nim);
  printf("masukkan nilai : ");
  scanf("%lf", &data.nilai);
  printf("masukkan gender (Laki-Laki / Perempuan): ");
  scanf("%s", &data.gender);

  if(data.nilai < 75){
    strcpy(status, "Tidak Lulus");
  }

  else {
    strcpy(status, "Lulus");
  }

  printf("Mahasiswa bernama %s dengan nim %d bergender %s dinyatakan %s dengan nilai %.2lf", data.nama, data.nim, data.gender, status, data.nilai);

  return 0;
}