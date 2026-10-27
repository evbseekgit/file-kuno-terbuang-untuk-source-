#include <stdio.h> 
#define PI 3.14159

int main() 
{ 

double angkaInputan;
scanf("%lf", &angkaInputan);

double hasilPerkalianPI = PI * angkaInputan * angkaInputan;
// float hasilBulat = round(hasilPerkalianPI * 100000) / 100000; 
// printf("%.5f\n", hasilBulat);
printf("%.6f\n", hasilPerkalianPI);

return 0; 
} 