Algoritmo SerieFibonaci
	
	definir a, b, c, m, n Como Entero;
	
	Escribir "Ingrese cantidad de numeros a generar: ";
	leer n;
	
	a = 0;
	b = 1;
	
	Escribir "1 - ", a;
	escribir "2 - ", b;
	
	m = 1; // contador.
	
	Mientras (m <= (n-2))
		c = a + b;
		Escribir m+2, " - ",c;
		a = b;
		b = c;
		m = m+1;
	FinMientras
	
FinAlgoritmo
