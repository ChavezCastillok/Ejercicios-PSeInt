// Autor: Kevin Chavez Castillo
// @ChavezCastillok
// Fecha: 15-ene-2019

Algoritmo LadrillosABC
	definir dia, loteA, loteB, loteC, loteDia Como Entero;
	definir tipoladrillo como caracter;
	definir lta, ltb, ltc, ltd, ltad, ltbd, ltcd como entero;
	definir dañadosSem, loteSem como entero;
	
	dañadosSem = 0;
	loteSem = 0;
	
	para dia=1 hasta 5 con paso 1 Hacer
		
		lta = 0; ltb = 0; ltc = 0; ltd = 0;
		ltad = 0; ltbd = 0; ltcd = 0;
		
		Repetir
			escribir "dime tipo de ladrillo";
			escribir "Pulse A de 20cm";
			escribir "Pulse B de 30cm";
			escribir "pulse C de 40cm";
			escribir "Pulse D si esta dañado";
			escribir "Pulse otra tecla para salir";
			leer tipoladrillo;
			si (tipoladrillo == 'A') Entonces
				lta = lta + 1;
			sino si (tipoladrillo == 'B') entonces
					ltb = ltb + 1;
				sino si (tipoladrillo == 'C') entonces
						ltc = ltc + 1;
					sino si (tipoladrillo == 'D') entonces
							ltd = ltd + 1;
							escribir "Indique el tipo de ladrillo dañado:";
							leer tipoladrilloD;
							si (tipoladrilloD == 'A') Entonces
								ltad = ltad + 1;
							sino si (tipoladrilloD == 'B') entonces
									ltbd = ltbd + 1;
								sino si (tipoladrilloD == 'C') entonces
										ltcd = ltcd + 1;
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		Hasta Que ((tipoladrillo != 'A') Y (tipoladrillo != 'B') Y (tipoladrillo != 'C') Y (tipoladrillo != 'D'))
		
		loteA = (lta - ltad) * 5;
		loteB = (ltb - ltbd) * 10;
		lotec = (ltc - ltcd) * 15;
		loteDia = loteA + loteB + loteC;
		
		dañadosSem = dañadosSem + ltd;
		loteSem = loteSem + loteDia;
		
		escribir "Produccion de ladrillos del dia ", dia;
		escribir "Tipo A: ", lta;
		escribir "Tipo B: ", ltb;
		escribir "Tipo C: ", ltc;
		escribir "Precio del lote: ", loteDia;
		
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
	
	escribir "El total de ladrillos dañados de la semana es: ", dañadosSem;
	escribir "Las produccion tiene un costo de: ", loteSem, " BsS";
	
FinAlgoritmo
