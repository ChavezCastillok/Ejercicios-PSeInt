Proceso GasolineraCCK
			
	//Variables
	definir dia, genero, carTipo, otroCar como entero;
	definir litros como real;
	// Contadoras y acumuladoras
	definir litrosDia, litrosSinPlomoDia, litrosPlomoDia, litrosDieselDia como real;
	definir litrosSinPlomoSem, litrosPlomoSem, litrosDieselSem como real;
	definir ingresoSinPlomoSem, ingresoPlomoSem, ingresoDieselSem como real;
	definir carsDia, particularesDia, taxisDia, busesDia como entero;
	definir carsSem, particularesSem, taxisSem, busesSem como entero;
	definir X100taxis como real;
	
	escribir " ";
	escribir " GASOLINERA CCK ";
	escribir " ";
	escribir "Ingrese los datos que se solicitan para surtir el combustible.";
	escribir " ";
	
	// Inicializacion de los contadores y acumuladores de la semana.
	litrosSinPlomoSem=0;
	litrosPlomoSem=0;
	litrosDieselSem=0;
	
	ingresoSinPlomoSem = 0;
	ingresoPlomoSem = 0;
	ingresoDieselSem = 0;
	
	carsSem = 0;
	particularesSem=0;
	taxisSem=0;
	busesSem=0;
	
	para dia = 1 hasta 5 con paso 1 hacer
		
		// Se inicializan a 0 los contadores y acumuladores cada dia.
		carsDia=0;
		
		litrosDia=0;
		litrosSinPlomoDia=0;
		litrosPlomoDia=0
		litrosDieselDia=0;
		
		particularesDia=0;
		taxisDia=0;
		busesDia=0;
		
		Repetir
			
			escribir " ";
			escribir "[ DIA ", dia, " ] -> Vehiculo Nº",carsDia+1;
			escribir " ";
			
			escribir "Genero del conductor: ";
			escribir "	1.- Masculino.";
			escribir "	2.- Femenina.";
			leer genero;
			
			escribir " ";
			escribir "Tipo de vehiculo: ";
			escribir "	1.- Particular.";
			escribir "	2.- Taxi.";
			escribir "	3.- Bus.";
			leer carTipo;
			
			escribir " ";
			escribir "Tipo de combustible -> precio ";
			escribir " 	1.- Con plomo. 	->1.2 BsS";
			escribir " 	2.- Sin plomo. 	->1.5 BsS";
			escribir " 	3.- Diesel.    	->0.8 BsS";
			leer combustibleTipo;
			
			escribir " ";
			escribir "Litros a surtir: ";
			leer litros;
			
			// Cuenta todos los vehiculos atendidos del dia
			carsDia = carsDia + 1;
			// Acumula el total de litros surtidos por dia.
			litrosDia = litrosDia + litros;
			
			// Cuenta por tipo los vehiculos surtidos durante el dia.
			si (carTipo == 1)
				particularesDia = particularesDia + 1;
			sino si (carTipo == 2)
					taxisDia = taxisDia + 1;
				sino si (carTipo == 3)
						busesDia = busesDia + 1;
					FinSi
				finsi
			FinSi
			
			// Acumula los litros vendidos por tipo.
			si (combustibleTipo == 3)
				litrosDieselDia = litrosDieselDia + litros;
			sino si (combustibleTipo == 2)
					litrosSinPlomoDia = litrosSinPlomoDia + litros;
				sino si (combustibleTipo == 1)
						litrosPlomoDia = litrosPlomoDia + litros;
					finSi
				FinSi
			FinSi
			
			escribir " ";
			escribir "¿Surtir otro vehiculo?";
			escribir " 	1.- Si.";
			escribir " 	2.- No.";
			leer otroCar;
			Limpiar Pantalla;
			
		Hasta Que (otroCar == 2);
		
		/*
		Segun dia Hacer
			1:
				secuencia_de_acciones_1
			2:
				secuencia_de_acciones_2
			3:
				secuencia_de_acciones_3
			4:
				
			5:
		Fin Segun
		*/
		
		// Se muestran por pantalla algunos datos del dia.
		escribir " ";
		escribir "[ DIA ", dia, " ]";
		escribir " ";
		escribir "Litros vendidos: ", litrosDia, " litros.";
		escribir "Tipo Diesel: ", litrosDieselDia, " litros.";
		escribir " ";
		escribir "Vehiculos particulares surtidos: ", particularesDia;
		escribir " ";
		
		// Acumula los vehiculos atendidos durante la semana
		carsSem = carsSem + carsDia;
		
		// Acumula el total por tipo de vehiculo atendidos en la semana
		particularesSem = particularesSem + particularesDia;
		taxisSem = taxisSem + taxisDia;
		busesSem = busesSem + busesDia;
		
		// Acumula el total de litros vendidos por cada tipo de combustible
		litrosPlomoSem = litrosPlomoSem + litrosPlomoDia;
		litrosSinPlomoSem = litrosSinPlomoSem + litrosSinPlomoDia;
		litrosDieselSem = litrosDieselSem + litrosDieselDia;
		
		// Calcula los ingresos de la semana por combustible
		ingresoPlomoSem = litrosPlomoSem * 1.2;
		ingresoSinPlomoSem = litrosSinPlomoSem * 1.5;
		ingresoDieselSem = litrosDieselSem * 0.8;
		
		//calcula el porcentaje de taxis de la semana
		X100taxis = (taxisSem*100)/carsSem;
		
	FinPara
	
	// Se muestran por pantalla algunos datos recabados durante la semana.
	escribir " ";
	escribir "	Ventas de la semana (5 dias)"
	escribir " ";
	escribir "Con plomo: ", litrosPlomoSem,   " litros. Por: ", ingresoPlomoSem,    " BsS";
	escribir "Sin plomo: ", litrosSinPlomoSem," litros. Por: ", ingresoSinPlomoSem, " BsS";
	escribir "***Diesel: ", litrosDieselSem,  " litros. Por: ", ingresoDieselSem,   " BsS";
	escribir " ";
	escribir "Los taxis atendidos representan el ", X100taxis, "% de los vehiculos surtidos.";
	
FinProceso
