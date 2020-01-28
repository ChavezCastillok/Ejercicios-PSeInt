Proceso Vectores1D
	definir grupo Como Caracter;
	definir i como entero;
	
	dimension grupo[6];
	
	//registra los nombres de los compañeros del grupo
	para i=0 hasta 5 con paso 1 hacer
		escribir i+1, " Ingrese el nombre del compañero: ";
		leer grupo[i];
	FinPara
	
	escribir "";
	
	escribir "Grupo presente dia 17-01-2019";
	para i=0 hasta 5 con paso 1 Hacer
		escribir i+1, " ", grupo[i];
	FinPara
	
FinProceso
