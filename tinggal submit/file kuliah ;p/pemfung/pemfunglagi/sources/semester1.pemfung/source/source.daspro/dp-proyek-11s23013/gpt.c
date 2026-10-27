#include <stdio.h>
#include<stdlib.h>

struct mahasiswa {
  char nama[50];
  int nim;
  double nilai;
  char gender[10];
};

void print(struct mahasiswa *data, int jumlah){
  printf("\nMasukkan Data Mahasiswa\n");
  for(int i = 0 ; i < jumlah; i++){
    printf("Mahasiswa %d : Nama : %s, NIM: %d, Nilai %.2lf, Gender: %s",i+1, data[i].nama, data[i].nim, data[i].nilai, data[i].gender);
  }
}

int main (){

int jumlah;
printf("Masukkan jumlah mahasiswa : ");
scanf("%d", &jumlah);

// printf("\n")

struct mahasiswa *data = (struct mahasiswa *)malloc(jumlah * sizeof(struct mahasiswa));

for(int i = 0 ; i < jumlah; i++){
printf("Masukkan data mahasiswa ke-%d\n",i+1);
printf("Nama :");
scanf("%s", &data[i].nama);
printf("NIM :");
scanf("%d", &data[i].nim);
printf("Nilai :");
scanf("%.2lf", &data[i].nilai);
printf("Gender :");
scanf("%s", &data[i].gender);
}

print(data, jumlah);


free(data);

  return 0;
}