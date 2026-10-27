#include <stdio.h>

struct Date {
    int dd;
    int mm;
    int yy;
};

typedef struct Date Date;

int isLeapYear(int year) {
    return (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0));
}

Date nextDay(Date d) {
    int days_in_month[] = {0, 31, 28 + isLeapYear(d.yy), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    d.dd++;

    if (d.dd > days_in_month[d.mm]) {
        d.dd = 1;
        d.mm++;

        if (d.mm > 12) {
            d.mm = 1;
            d.yy++;
        }
    }

    return d;
}

int main() {
    int dd, mm, yy;
    
    printf("Enter a date (dd mm yy): ");
    scanf("%d %d %d", &dd, &mm, &yy);
    
    Date d = {dd, mm, yy};
    
    printf("Current date: %d %d %d\n", d.dd, d.mm, d.yy);
    
    Date next_date = nextDay(d);
    printf("Next day: %d %d %d\n", next_date.dd, next_date.mm, next_date.yy);

    return 0;
}