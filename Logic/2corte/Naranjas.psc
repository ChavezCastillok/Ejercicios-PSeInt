Algoritmo NaranjasCCK
	
	// Titulo del programa.
	escribir " ";
	escribir "REGISTRO DE PRODUCCION DE NARANJAS CCK";
	escribir " ";
	
	// Declaracion de las variables
	definir dia, naranja, peso, tipoA, tipoB, tipoC Como Entero;
	definir tta, ttb, ttc como entero;
	definir resp Como Caracter;
	
	//Inicialización de las variables que van a contar la cantidad de naranjas por tipo.
	tipoA = 0; tipoB = 0; tipoC = 0;
	tta = 0; ttb = 0; ttc = 0;
	
	Para dia = 1 hasta 5 con paso 1 hacer
		Limpiar Pantalla;
		escribir "Dia ", dia; // Muestra el dia que se esta recopilando.
		escribir "Hay naranjas: S/N";
		Leer resp;
		naranja=1;
		
		Mientras (resp == 'S' O resp == 's') Hacer
			escribir "Peso de la naranja ", naranja; // pregunta el peso de la naranja
			leer peso;								// Lo guarda en peso y aumenta el contador de acuerdo a su peso
													// en las siguientes condiciones.
			si (peso <= 100) entonces
				tipoA = tipoA + 1;
			sino si (peso > 100 && peso <= 150) entonces
					tipoB = tipoB + 1;
				sino si (peso > 150) entonces
						tipoC = tipoC + 1;
					FinSi
				FinSi
			FinSi
			naranja=naranja+1;
			escribir "Desea agregar otra naranja: S/N"; leer resp;
		FinMientras
			
		// Guarda el total de naranjas por tipo de todos los dias registrados:
		tta = tta + tipoA;
		ttb = ttb + tipoB;
		ttc = ttc + tipoC;
		
		// Muestra el resultado de naranjas del dia ingresado por cada tipo:
		Escribir "El total del día ", dia, " por tipo es: ";
		escribir "Tipo A: ", tipoA;
		escribir "Tipo B: ", tipoB;
		escribir "Tipo C: ", tipoC;
		//Se vuelve poner el cero el contador de las naranjas por dia (sino se acumulan directamente).
		tipoA = 0; tipoB = 0; tipoC = 0;
		Esperar Tecla;
	FinPara
	
	//Al final de recopilar y mostrar todos los datos por dia, se muestra el total de la semana:
	Escribir "El total de naranjas en la semana por tipo es: ";
	escribir "Tipo A: ", tta;
	escribir "Tipo B: ", ttb;
	escribir "Tipo C: ", ttc;
	
FinAlgoritmo
// Autor: Kevin Chavez Castillo.