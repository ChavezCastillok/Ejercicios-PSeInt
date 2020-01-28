// Autor: Kevin Chavez
// @ChavezCastillok
// Fecha de creacióm: 05-feb-2019
// Finalizado: 06-02-2019

Algoritmo IUFRONT_airlines
	definir n como entero;
	n = 185; // n indica el numero de clientes max
	
	definir i, j, menores, mayores, t1, t2, t3 como entero;
	definir masjoven, masviejo, ij, iv como entero;
	definir gananciatotal como real;
	Definir otroreg Como Caracter;
	
	// arrays
	definir nombre, apellido, genero Como Caracter;
	definir cedula, edad, tpasaje, pagoequipaje como entero;
	definir pesoequipaje, preciopasaje como real;
	Dimension nombre[n], apellido[n], genero[n], cedula[n], edad[n], tpasaje[n], pesoequipaje[n], preciopasaje[n], pagoequipaje[n];
	
	// inicializacion de variables.
	t1 = 0; t2 = 0; t3 = 0;
	menores = 0; mayores = 0;
	masjoven = 1000; masviejo = 1;
	gananciatotal = 0;
	i=0;
	
	Repetir
		
		Escribir "";
		Escribir " -.-  -.-  -.-  -.- IUFRONT AIRLINES -.-  -.-  -.-  -.- ";
		Escribir "          .......Registro de pasajeros........ ";
		Escribir "";
		Escribir " - Cliente Nº" i+1;
		escribir "Nombre: "; leer Sin Saltar nombre[i];
		Escribir "Apellido: "; leer sin saltar apellido[i];
		Escribir "Cedula: "; leer sin saltar cedula[i];
		Escribir "Genero (m/f): "; leer sin saltar genero[i];
		Escribir "Edad: "; leer sin saltar edad[i];
		Escribir "Peso equipaje (en kg): "; leer sin saltar pesoequipaje[i];
		Escribir "# Tipo de pasaje: "; 
		Escribir "(1) clase. Quedan ", 40-t1, " de 40.";
		Escribir "(2) clase. Quedan ", 60-t2, " de 60."; 
		Escribir "(3) Popular. Quedan ", 85-t3, " de 85."; 
		repetir
			leer tpasaje[i];
			si tpasaje[i] < 1 || tpasaje[i] > 3
				Escribir " Ingrese una opcion valida 1, 2 o 3...";
			FinSi
		Hasta Que (tpasaje[i] >= 1 && tpasaje[i] <= 3)
		
		si tpasaje[i] == 3 && t3 == 85
			Escribir " Ya no hay más cupos disponibles para esa clase.";
			Escribir " Seleccione otra...";
			Leer tpasaje[i];
		sino si tpasaje[i] == 2 && t2 == 60
				Escribir " Ya no hay más cupos disponibles para esa clase.";
				Escribir " Seleccione otra...";
				Leer tpasaje[i];
			sino si tpasaje[i] == 1 && t1 == 40
					Escribir " Ya no hay más cupos disponibles para esa clase.";
					Escribir " Seleccione otra...";
					Leer tpasaje[i];
				FinSi
			FinSi
		FinSi
		
		Limpiar Pantalla;
		
		// cuenta la cantidad de pasajes vendidos por clase
		// calcula el monto del boleto por clase.
		
		si ( tpasaje[i] == 3 ) // clase popular
			t3 = t3 + 1;
			preciopasaje[i] = (120*1.16);
		sino si ( tpasaje[i] == 2 )  // segunda clase
				t2 = t2 + 1;
				preciopasaje[i] = (175*1.16);
			sino si ( tpasaje[i] == 1 )  // primera clase
					t1 = t1 + 1;
					preciopasaje[i] = (200*1.16);
				FinSi
			FinSi
		FinSi
		
		// total pasajeros menores de 24 y mayores de 60
		Si edad[i] < 24 
			menores = menores + 1;
		sino si edad[i] >= 60 
				mayores = mayores + 1;
			FinSi
		FinSi
		
		// calculo del precio del pasaje
		// premera clase
		si (pesoequipaje[i] < 8)
			pagoequipaje[i] = 25;
		sino si (pesoequipaje[i] >= 8)
				pagoequipaje[i] = 35;
			FinSi
		FinSi
		
		// calculo del menor y mayor pasajero en el vuelo
		si edad[i] < masjoven 
			masjoven = edad[i];
			ij = i;
		FinSi
		si edad[i] > masviejo 
			masviejo = edad[i];
			iv = i;
		FinSi
		
		// calculo de la ganancia total
		gananciatotal = gananciatotal + (preciopasaje[i]+pagoequipaje[i]);
		
		i = i + 1;
		
		si i < 185
			Escribir " ¿Registrar otro pasajero?";
			Escribir " s = si / n = no    // Quedan ", 185-i, " cupos disponibles";
			leer otroreg;
			Limpiar Pantalla;
		SiNo
			Escribir " Vuelo lleno. Ya no hay más cupos disponibles.";
			otroreg = 'n';
			Escribir "";
			Escribir " pulse una tecla para continuar...";
			Esperar Tecla;
			Limpiar Pantalla;
		FinSi
		
	Mientras Que (otroreg == 's' || otroreg == 'S'); 
	
	// Fuera de ciclo. Muestra los datos solicitados luego del registro de pasajeros.
	Limpiar Pantalla;
	Escribir "";
	Escribir " --.--  --.-- INFORME POST REGISTRO --.-- --.-- ";
	Escribir "";
	Escribir " Se vendierón: ";
	Escribir " #", t1, " boleto(s) en primera clase.";
	Escribir " #", t2, " boleto(s) en segunda clase.";
	Escribir " #", t3, " boleto(s) en clase popular.";
	si (t1+t2+t3)<185
		escribir " Quedaron ", 185-(t1+t2+t3), " boletos disponibles.";
		Escribir "";
	FinSi
	Escribir " El más joven es: ", nombre[ij], " ", apellido[ij], " de ", edad[ij], " años.";
	Escribir " El más viejo es: ", nombre[iv], " ", apellido[iv], " de ", edad[iv], " años.";
	Escribir "";
	Escribir " ", menores, " menores de 24 años.";
	Escribir " ", mayores, " mayores de 60 años.";
	Escribir "";
	Escribir " El total recaudado por el vuelo es: ";
	Escribir " ", gananciatotal, " dolares.";
	// Mostrar la lista de pasajeros registrados:
	Escribir "";
	Escribir " Lista de pasajeros: ";
	Escribir "";
	escribir " # [ Cedula - Monto a pagar] ";
	para j=0 hasta i-1 con paso 1 hacer
		Escribir j+1, ".- ", cedula[j], " -     ", preciopasaje[j], "$";
	FinPara
	
FinAlgoritmo

// Fin....