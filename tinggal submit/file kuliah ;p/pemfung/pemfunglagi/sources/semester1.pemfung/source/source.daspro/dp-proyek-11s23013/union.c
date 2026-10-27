#include <stdio.h>
#include <stdlib.h>

struct store {
  double price;
  union{
    struct {
      char *title;
      char *author;
      int num_pages;
    }book;

    struct {
      int color;
      int size;
      char *design;
    }shirt;
  }item;
};

int main (){

scanf("%s", s.item.book.title);
printf("%s",s.item.book.title);

  return 0;
}