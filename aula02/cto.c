// tradução de um programa c para asm
#include <stdio.h>

int main() {
    int x = 42; 
 	int y = 10;
    float f; 
 	float pi = 3.1415;
    int *p;
    int v[10];
    int v2[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

 	printf("Digite um int: ");
 	scanf("%d", &y);

 	printf("A soma de 42 + %d eh: %d\n", y, (x+y));
 	printf("A mult. de pi * %d eh: %f\n", y, (pi*y));

 	return 0;
}