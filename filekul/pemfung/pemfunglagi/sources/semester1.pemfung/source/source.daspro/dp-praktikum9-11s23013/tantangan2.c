#include <stdio.h> 
int main() 
{ 

  int angkaAwal, angkaAkhir ;

  // looping dengan for 
  scanf("%d", &angkaAwal);
  scanf("%d", &angkaAkhir);
  for (int i = angkaAwal; i <= angkaAkhir; i++) 
  { 
    if (i % 2 == 0 && i % 3 == 0 && i % 5 == 0 && i % 7 == 0)
    {
      printf("ABC\n");
    } 

    else if (i % 3 == 0 && i % 5 == 0 && i % 7 == 0)
    {
      printf("CBA\n");
    }

    else if (i % 3 == 0 && i % 5 == 0 )
    {
      printf("IU\n");
    }

    else if (i % 3 == 0 && i % 7 == 0 )
    {
      printf("IE\n");
    }

    else if (i % 3 == 0)
    {
      printf("I\n");
    }

    else if (i % 5 == 0)
    {
      printf("U\n");
    }

    else if (i % 7 == 0)
    {
      printf("E\n");
    }

    else 
    {
      printf("%d\n", i);
    }

  } 

  return 0;
}
