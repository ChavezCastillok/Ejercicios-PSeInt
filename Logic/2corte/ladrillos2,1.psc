// Autor: Kevin Chavez Castillo
// @ChavezCastillok
// Fecha: 15-ene-2019

Algoritmo LadrillosABC
	definir dia, loteA, loteB, loteC, loteDia Como Entero;
	definir tipoladrillo, resp como caracter;
	definir lta, ltb, ltc, ltd, ltad, ltbd, ltcd como entero;
	definir dañadosSem, loteSem, ladrillosbuenos como entero;
	
	dañadosSem = 0;
	loteSem = 0;
	
	para dia=1 hasta 5 con paso 1 Hacer
		
		lta = 0; ltb = 0; ltc = 0; ltd = 0;
		ltad = 0; ltbd = 0; ltcd = 0;
		
		escribir "";
		escribir "Produccion de ladrillos dia ", dia;
		escribir "";
		escribir "Indique la cantidad producida de tipo A: ";
		leer lta;
		escribir "Indique la cantidad producida de tipo B: ";
		leer ltb;
		escribir "Indique la cantidad producida de tipo C: ";
		leer ltc;
		escribir "";
		escribir "Indique si de la produccion indicada hay ladrillos dañados: S/N";
		leer resp;
		si (resp == 'S' || resp == 's') entonces
			escribir "indique la cantidad del tipo A dañados: ";
			leer ltad;
			escribir "indique la cantidad del tipo B dañados: ";
			leer ltbd;
			escribir "indique la cantidad del tipo C dañados: ";
			leer ltcd;
		FinSi
		
		loteA = (lta - ltad) * 5;
		loteB = (ltb - ltbd) * 10;
		lotec = (ltc - ltcd) * 15;
		loteDia = loteA + loteB + loteC;
		
		dañadosSem = dañadosSem + ltd;
		loteSem = loteSem + loteDia;
		ladrillosbuenos = (lta-ltad)+(ltb-ltbd)+(ltc-ltcd);
		
		escribir "";
		escribir "Produccion de ladrillos del dia ", dia;
		escribir "Tipo A: ", lta, " de los cuales hay: ", ltad, " dañados.";
		escribir "Tipo B: ", ltb, " de los cuales hay: ", ltbd, " dañados.";
		escribir "Tipo C: ", ltc, " de los cuales hay: ", ltcd, " dañados.";
		escribir "";
		escribir "Precio del lote (",ladrillosbuenos, " ladrillos buenos): ", loteDia, " BsS";
		escribir "";
		
		si (dia == 2)
			si (lta > ltb && lta > ltc)
				escribir "Hoy se produjo más del tipo A";
			FinSi
			si (ltb > lta && ltb > ltc)
				escribir "Hoy se produjo más del tipo B";
			FinSi
			si (ltc > ltb && ltc > lta)
				escribir "Hoy se produjo más del tipo C";
			FinSi
		FinSi
		
	FinPara
	
	escribir "";
	escribir "El total de ladrillos dañados de la semana fue: ", dañadosSem;
	escribir "Las produccion tiene un costo de: ", loteSem, " BsS";
	
FinAlgoritmo
