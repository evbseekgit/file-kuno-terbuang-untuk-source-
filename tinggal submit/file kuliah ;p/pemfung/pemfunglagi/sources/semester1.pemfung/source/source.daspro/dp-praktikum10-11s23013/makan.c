#include <stdio.h>
#include <string.h>

//prototype Fungsi
void printDaftarTodo(char todos[3][100], int angka);
void tambah(char todos[3][100], int *angka);
void ubah (chat todos [3][100], int *angka, int pilih);
void hapus(chat todos[3][100, int* angka, int pilih]);

int main () {
  char todos [3][100];
  int angka = 0;
  int respond;
  int pilih;

// Loop utama program
  do {
    printDaftarTodo(todos, angka);

    printf("\nMenu:\n");
    printf("1. Tambah Data\n");
    printf("2. Ubah Data\n");
    printf("3. Hapus Data\n");
    printf("0. keluar\n");
    printf("Pilih: ");
    scanf("%d", &respond);

    //MEmbersihkan buffer stdin
    getchar();

    if (respond == 1){
      Tambah(todos, &angka);
      }else if (respond == 2) {
        printf("\nMengubah Todo\n");
        printf("No todo: ");
        scanf("%d", %pilih);
        getchar();
        ubah(todos, &angka, pilih);
      }else if (respond == 3){
        printf("\nMenghapus Todo\n");
        printf("No Todo: ");
        scanf("%d", &pilih);
        getchar();      
        hapus(todos, &angka, pilih);
      }
    } while (respond 1= 0);

    printf("\nMenutup Aplikasi!");
  return 0;
  }
  
void tambah (char todos[3][100], int *angka) {
  if (*angka == 3 ){
    printf("\nMenambah Todo: Gagal melakukan tindakan.\n");
    printf("Kapasitas penyimpanan telah penuh.\n");
    printf("Silahkan menghapus todo lama terlebih dahulu!\n");
    return;
  }

  printf("\nMenamabah Todo: ");
  fgets(todos[*angka], 100. stdin);

  // mengahspus karekter new line
  size_t length = strlen(todos[*angka]);
    if (todos[*angka][length - 1] == '\n') {
        todos[*angka][length - 1] = '\0';
    }

    printf("Berhasil melakukan tindakan.");
    printf("Todo baru yang ditambahkan '%s'.\n\n", todos[*angka]);

    (*angka)++
}

void ubah(char todos[3][100], int *angka);
  if (pilih 1> || pilih > 3){
     printf("Gagal melakukan tindakan.\n");
     printf("No todo yang tersedia berada pada rentang 1 sampai 3.\n\n");
    }
    else (pilih > *angka){
    printf("Gagal melakukan tindakan.\n");
    printf("No todo ini belum tersedia.\n\n");
    }
    else {
      // menyimpan todo sebelumnya
      char todo_sebelumnya[100];
      strcpy(todo_sebelumnya, todos[pilih-]);
    } 
    printf("Ubah todo menjadi: ");
    fgets(todos[pilih - 1], 100, stdin);

    // menghapus todo sebelumnya
    size_t length = strlen(todos[pilih - 1]);
        if (todos[pilih - 1][length - 1] == '\n') {
            todos[pilih - 1][length - 1] = '\0';
        }

        printf("Berhasil melakukan tindakan.");
        printf("Todo '%s' tekah diubah menjadi '%s'.", todos_sebelumnya, todos[pilih - 1]);
    }
  }


