#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the initial capacity for the clothing catalog
#define INITIAL_CAPACITY 10

// Define the structure for the clothing catalog
typedef struct {
    char* model;
    char* brand;
    char* size;
    char* color;
    double price;
    int stock;
} ClothingCatalogue;

// Prototype functions
void display(const ClothingCatalogue* katalog, int count, double dompet);
void tambah(ClothingCatalogue** katalog, int* count, int* capacity);
void baju_dijual(ClothingCatalogue** katalog, int* count, double* dompet);

int main() {
    double dompet = 0;
    char choice;
    int count = 0;
    int capacity = INITIAL_CAPACITY;

    // Allocate initial memory for the catalog
    ClothingCatalogue* katalog = (ClothingCatalogue*)malloc(capacity * sizeof(ClothingCatalogue));
    if (katalog == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    do {
        display(katalog, count, dompet);
        printf("\nMenu:\n");
        printf("1. Tambah Katalog\n");
        printf("2. Baju Dijual\n");
        printf("x. Keluar\n");
        printf("Pilih: ");
        scanf(" %c", &choice);  // Using space before %c to consume any leading whitespace

        switch (choice) {
            case '1':
                tambah(&katalog, &count, &capacity);
                break;
            case '2':
                baju_dijual(&katalog, &count, &dompet);
                break;
            case 'x':
                printf("\nMenutup aplikasi!\n");
                break;
            default:
                printf("Pilihan Tidak Valid.\n\n");
        }
    } while (choice != 'x');

    // Free allocated memory
    for (int i = 0; i < count; i++) {
        free(katalog[i].brand);
        free(katalog[i].model);
        free(katalog[i].size);
        free(katalog[i].color);
    }
    free(katalog);

    return 0;
}

void display(const ClothingCatalogue* katalog, int count, double dompet) {
    printf("Total Pemasukan : $%.3lf\n", dompet);
    printf("Daftar Katalog Baju :\n");
    if (count == 0) {
        printf("- Belum ada daftar katalog baju yang tersedia\n");
    } else {
        for (int i = 0; i < count; i++) {
            printf("%d. %s (%s | %s | %s | $%.3lf/item) [%d tersedia]\n", i + 1,
                   katalog[i].brand, katalog[i].model, katalog[i].color, katalog[i].size,
                   katalog[i].price, katalog[i].stock);
        }
    }
}

void tambah(ClothingCatalogue** katalog, int* count, int* capacity) {
    printf("\nMenambah Katalog Baju:\n");

    // Allocate temporary buffer for input
    char temp[100];

    // Input for brand
    printf("Brand (x Jika Batal) : ");
    getchar();  // Consume newline from previous input
    scanf(" %[^\n]", temp);
    if (strcmp(temp, "x") == 0) {
        printf("Tindakan dibatalkan\n\n");
        return;
    }
    char* brand = strdup(temp);

    // Input for model
    printf("Model : ");
    scanf(" %[^\n]", temp);
    char* model = strdup(temp);

    // Input for size
    printf("Ukuran : ");
    scanf(" %[^\n]", temp);
    char* size = strdup(temp);

    // Input for color
    printf("Warna : ");
    scanf(" %[^\n]", temp);
    char* color = strdup(temp);

    // Input for price
    double price;
    printf("Harga ($) : ");
    scanf("%lf", &price);

    // Input for stock
    int stock;
    printf("Stok Tersedia : ");
    scanf("%d", &stock);

    // Check if the item already exists in the catalog
    for (int i = 0; i < *count; i++) {
        if (strcmp((*katalog)[i].brand, brand) == 0 &&
            strcmp((*katalog)[i].model, model) == 0 &&
            strcmp((*katalog)[i].size, size) == 0 &&
            strcmp((*katalog)[i].color, color) == 0) {
            
            // Update existing item
            (*katalog)[i].price = price;
            (*katalog)[i].stock += stock;
            printf("SUKSES MEMPERBARUI HARGA DAN STOK KATALOG BAJU :  %s (%s | %s | %s)\n\n", 
                   brand, model, color, size, price, (*katalog)[i].stock);

            // Free the duplicated strings as they are not needed
            free(brand);
            free(model);
            free(size);
            free(color); 
            return;
        }
    }

    // Check if more space is needed
    if (*count == *capacity) {
        *capacity *= 2;
        *katalog = (ClothingCatalogue*)realloc(*katalog, (*capacity) * sizeof(ClothingCatalogue));
        if (*katalog == NULL) {
            printf("Memory reallocation failed.\n");
            exit(1);
        }
    }

    // Add new item to the catalog
    (*katalog)[*count].brand = brand;
    (*katalog)[*count].model = model;
    (*katalog)[*count].size = size;
    (*katalog)[*count].color = color;
    (*katalog)[*count].price = price;
    (*katalog)[*count].stock = stock;

    printf("SUKSES MENAMBAH KATALOG BAJU :  %s (%s | %s | %s)\n\n", 
           brand, model, color, size);

    (*count)++;
}

void baju_dijual(ClothingCatalogue** katalog, int* count, double* dompet) {
    int posisi, jumlahDijual;

    // Input for position
    printf("\nBaju Dijual\nNo (0 Jika Batal) : ");
    scanf("%d", &posisi);
    if (posisi == 0) {
        printf("Tindakan dibatalkan\n\n");
        return;
    }
    posisi--;  // Adjust for 0-based indexing

    if (posisi < 0 || posisi >= *count) {
        printf("Tindakan dibatalkan\n");
        printf("KATALOG BAJU dengan Posisi ke-%d tidak tersedia\n\n", posisi + 1);
        return;
    }

    printf("\nBaju Tersedia :\n%s (%s | %s | %s | $%.3lf/item) [%d tersedia]\n",
           (*katalog)[posisi].brand, (*katalog)[posisi].model, (*katalog)[posisi].color, (*katalog)[posisi].size,
           (*katalog)[posisi].price, (*katalog)[posisi].stock);

    // Input for number of items sold
    printf("Jumlah Dijual : ");
    scanf("%d", &jumlahDijual);

    if (jumlahDijual <= 0) {
        printf("\nTindakan dibatalkan\n");
        printf("GAGAL MENJUAL BAJU : Jumlah penjualan barang minimal 1\n\n");
        return;
    } else if (jumlahDijual > (*katalog)[posisi].stock) {
        printf("\nTindakan dibatalkan\n");
        printf("GAGAL MENJUAL BAJU : Stok tersedia [%d] tidak mencukupi jumlah ingin dijual [%d]\n\n", (*katalog)[posisi].stock, jumlahDijual);
        return;
    }

    // Update the stock and dompet
    (*katalog)[posisi].stock -= jumlahDijual;
    *dompet += jumlahDijual * (*katalog)[posisi].price;

    printf("\nBERHASIL MENJUAL BAJU : Pemasukan bertambah sebanyak $%.3lf\n\n", jumlahDijual * (*katalog)[posisi].price);

    // If stock is zero, remove the item from the catalog
    if ((*katalog)[posisi].stock == 0) {
        free((*katalog)[posisi].brand);
        free((*katalog)[posisi].model);
        free((*katalog)[posisi].size);
        free((*katalog)[posisi].color);
        for (int i = posisi; i < *count - 1; i++) {
            (*katalog)[i] = (*katalog)[i + 1];
        }
        (*count)--;
    }
}



