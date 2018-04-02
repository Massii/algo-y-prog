#include <stdio.h>
#include <stdlib.h>
#include "Ej24_guia1_head.h"


int main(void)
{

	int d, p, x, n;
	char c;

	printf("%s\n", DIA);
	scanf("%d", &d);

	while ((c = getchar()) != '\n' && c != EOF)
		{

				n = isdigit(c);
				if (n==0) 
					{
						printf("%s: %s\n",ERROR, ERROR_DEC);
						exit(EXIT_FAILURE); 
					}
		}

	if(d < 1 || d > 366)
		{
			fprintf(stderr,"%s:%s\n", ERROR, ERROR_RANGO);
			return EXIT_FAILURE;
		}
	


	printf("%s\n", INICIO);
	scanf("%d", &p);
	
			
	while ((c = getchar()) != '\n' && c != EOF)
		{
			
				n = isdigit(c);
				if (n==0) 
					{
						printf("%s: %s\n",ERROR, ERROR_DEC);
						exit(EXIT_FAILURE); 
					}
		}


	if(p < 1 || p > 7)
		{
			fprintf(stderr,"%s:%s\n", ERROR, ERROR_RANGO);
			return EXIT_FAILURE;
		}


			x = d % 7; 

	switch(p) 
		{
			case 1 :
				x = x + 0;
				break;
			case 2 :
				x = x + 1;
				break;
			case 3 :
				x = x + 2;
				break;
			case 4 :
				x = x + 3;
				break;
			case 5 :
				x = x + 4;
				break;
			case 6 :
				x = x + 5;
				break;
			case 7 :
				x = x + 6;
				break;
			default :
				fprintf(stderr,"%s: %s\n", ERROR, ERROR_RANGO);
				
			return 1;
		}

	x = x % 7;


	switch(x) 
		{
			case 1 :
				printf("Domingo\n");
				break;
			case 2 :
				printf("Lunes\n");
				break;
			case 3 :
				printf("Martes\n");
				break;
			case 4 :
				printf("Miércoles\n");
				break;
			case 5 :
				printf("Jueves\n");
				break;
			case 6 :
				printf("Viernes\n");
				break;
			case 0 :
				printf("Sábado\n");
				break;
			default :
				printf("ERROR\n");
				exit(EXIT_FAILURE);
		}

		
return 0;
}