#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "Ej43_guia1_head.h"


int main(void)
{
	float km, pre, gas, lit, rend, srend = 0, prom, mrend, prend, tgas = 0,tkm = 0, tcomb = 0;
	int n, cant = 0;
	char c;
	

		printf("%s\n", KM);
		scanf("%f", &km);
		while ((c = getchar()) != '\n' && c != EOF)			
			{ 
				n = isdigit(c);
				if (n==0) 
					{
						printf("%s: %s\n",ERROR, ERROR_DEC);
						exit(EXIT_FAILURE); 
					}
			}
		if (km == -1) 
			{
				exit(EXIT_SUCCESS);
			}
		if (km <= 0) 
			{
				printf("%s: %s\n",ERROR, ERROR_RANGO);
				exit(EXIT_FAILURE); 
			}


		while (km != -1)
			{
					cant++;
					tkm = tkm + km;

					printf("%s\n", PRE);
					scanf("%f", &pre);														/* Precio de combustible por litro */
					while ((c = getchar()) != '\n' && c != EOF)			
							{ 
								n = isdigit(c);
								if (n==0) 
									{
										printf("%s: %s\n",ERROR, ERROR_DEC);
										exit(EXIT_FAILURE); 
									}
							}


					if (pre <= 0) 
						{
							printf("%s: %s\n",ERROR, ERROR_RANGO);
							exit(EXIT_FAILURE); 
						}

					printf("%s\n", GASTO);
					scanf("%f", &gas);														/* Precio de combustible por litro */
					while ((c = getchar()) != '\n' && c != EOF)			
							{ 
								n = isdigit(c);
								if (n==0) 
									{
										printf("%s: %s\n",ERROR, ERROR_DEC);
										exit(EXIT_FAILURE); 
									}
							}


					if (gas <= 0) 
						{
							printf("%s: %s\n",ERROR, ERROR_RANGO);
							exit(EXIT_FAILURE); 
						}

					tgas = tgas + gas;														/* Gasto total */

					lit = gas/pre;
					tcomb = tcomb + lit;													/* Combustible total en litros */

					rend = (100*lit)/km;													/* Rendimiento */

 					if(cant==1){
 						mrend = rend;														/* Máximo rendimiento */
 						prend = rend;														/* Mínimo rendimiento */
 						}

					if(rend <= mrend)
							{
								mrend = rend;
							}
						else
			 				{
								if (rend >= prend)
									{prend = rend;}
							}		
	

					srend = srend + rend;													/* Suma de rendimientos */

					printf("%s %f\n\n", REND,rend);

					printf("%s\n", KM);
					scanf("%f", &km);
																		/* Precio de combustible por litro */
					while ((c = getchar()) != '\n' && c != EOF)			
						{ 
								n = isdigit(c);
								if (n==0) 
									{
										printf("%s: %s\n",ERROR, ERROR_DEC);
										exit(EXIT_FAILURE); 
									}
						}

					if (km == 0 || km < -1) 
						{
							printf("%s: %s\n",ERROR, ERROR_RANGO);
							exit(EXIT_FAILURE); 
						}
			}

	

	prom = srend/cant;																		/* Promedio de rendimientos */

printf("%s %f\n",REND_PROM,prom);	

printf("%s %f\n", MEJ_REND,mrend);
printf("%s %f\n", PEOR_REND,prend);

printf("%s %f\n", DIST,tkm);
printf("%s %f\n", COMB,tcomb);
printf("%s %f\n", COST_TOT,tgas);

return 0;
}