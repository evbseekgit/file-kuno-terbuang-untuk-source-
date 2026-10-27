#include <stdio.h>

int isLeapYear(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        return 1;
    else
        return 0;
}

int main() {
    int day, month, year;
    printf("Enter the current date (DD MM YYYY): ");
    scanf("%d %d %d", &day, &month, &year);

    // Array to store the number of days in each month
    int daysInMonth[] = {31, 28 + isLeapYear(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    // Check if the input date is valid
    if (month < 1 || month > 12 || day < 1 || day > daysInMonth[month - 1] || year < 1) {
        printf("Invalid date input!\n");
        return 1;
    }

    // Increment the day
    day++;

    // Check if the day exceeds the number of days in the current month
    if (day > daysInMonth[month - 1]) {
        // Move to the next month
        day = 1;
        month++;
        // Check if we need to move to the next year
        if (month > 12) {
            month = 1;
            year++;
        }
    }

    printf("Next date: %02d %02d %04d\n", day, month, year);

    return 0;
}