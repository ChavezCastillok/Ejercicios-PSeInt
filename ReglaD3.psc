Algoritmo ReglaD3
	//Calcula la proporcion de un numero respecto a otro 
	// Ejemplo: si 200 es el 100%, 100 es el 50% de 200.
	
	definir num, num2 como entero;
	definir result como real;
	
	escribir "Regla de tres simple. Ej: ¿qué porcentaje de 200 (base) es 135 (proporcion)?"
	
	escribir "Ingrese numero base de la proporcion: ";
	leer num1;
	escribir "Ingrese la proporcion: ";
	leer num2;
	
	result = (num2*100)/num1;
	
	escribir num2, " es el ", result, "% de ", num1;
	
FinAlgoritmo
