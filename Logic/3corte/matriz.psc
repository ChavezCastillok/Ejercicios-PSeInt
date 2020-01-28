Proceso sin_titulo
	definir matriz Como Entero;
	definir i, j Como Entero;
	dimension matriz[5,5];
	
	// inicializa la matriz
	para i=0 hasta 4 con paso 1 hacer
		para j=0 hasta 4 con paso 1 hacer
			matriz[i,j]=i+j;
		FinPara
	FinPara
	
	escribir " ";
	// mostrar la matriz inicializada
	para i=0 hasta 4 con paso 1 hacer
		escribir "";
		para j=0 hasta 4 con paso 1 hacer
			escribir Sin Saltar matriz[i,j], " ";
		FinPara
	FinPara
	
	escribir "";
FinProceso
