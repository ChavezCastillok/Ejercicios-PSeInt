Algoritmo BonoPanaderia
	
	definir nombre Como Caracter;
	definir sueldo Como Entero;
	definir bono Como Real;
	
	escribir "Por favor, ingrese nombre del empleado: ";
	leer nombre;
	escribir "Ahora, ingrese el sueldo mensual de ", nombre;
	leer sueldo;
	
	si(sueldo==2000 || sueldo==2500 || sueldo==3000) entonces
		bono=(sueldo/30)*55;
		escribir "El bono de aguinaldo para: ",nombre,", es: ",bono;
	sino 
		escribir "Sueldo invalido. Debe ser 2000, 2500 o 3000.";
	FinSi
	
	
FinAlgoritmo
