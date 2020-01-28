//   Autor: Kevin Chavez Castillo
// 	    CI: V-22.677.632
// Sección: I1MB
// Evaluación de 4to corte - LÓGICA - 1er semestre Informática IUFRONT.
// Fecha de creacion: 30-01-2019
// Actualizado al: 09-02-2019

Algoritmo LaGranVuelta
	
	definir cant como entero;
	cant = 52; // Establece la cantidad max de ciclistas a registrar durante toda la semana. (a considerar previo a la ejecución)
	
	// declaracion de variables
	Definir dia, i, j, k, regs, vuelta Como Entero;
	Definir tvuelta, acumtv, bestimem, bestimef, badtimem, badtimef, auxt como real;
	Definir otroreg, orden, auxn, auxa, opmod Como Caracter;
	
	Definir scedula, index, im, if Como Entero;
	Definir registro, esta Como Logico;
	
	Definir hombresdia, mujeresdia como Entero;
	Definir hombresem, mujeresem como Entero;
	Definir x100hombres, x100mujeres como Real;
	
	Definir jovenes, mayores Como Entero;
	
	// Declaracion de vectores
	Definir nombre, apellido, sexo como caracter;
	Definir cedula, edad, cc como entero;
	Definir promvueltas, bestime, badtime como real;
	
	// vectores copia para ordenar y mostrar lista de pocisiones para la salida.
	Definir pt Como Real;
	Definir name, apell Como Caracter;
	
	Dimension nombre[cant], apellido[cant], sexo[cant], edad[cant], cedula[cant], promvueltas[cant], bestime[cant], badtime[cant];
	Dimension pt[cant], name[cant], apell[cant], cc[cant];
	
	// inicialización de variables
	regs = 0;
	hombresem = 0;
	mujeresem = 0;
	jovenes = 0; // entre 23 y 27 años
	mayores = 0; // entre 30 y 40 años
	
	registro = falso;
	
	// Begin
	para i=1 hasta 3 Hacer
		Escribir "";
		Escribir "              EVENTO LA GRAN VUELTA ";
		Escribir "";
		Escribir " Carga completa en ", 4-i;
		Esperar 1 segundo;
		Limpiar Pantalla;
	FinPara
	
	Repetir
		Limpiar Pantalla;
		// Menu
		Escribir "";
		Escribir "              EVENTO LA GRAN VUELTA ";
		Escribir "";
		Escribir "";
		si (registro == verdadero)
			Escribir "1- Registro de ciclistas *FINALIZADO*";
		sino si (registro == falso)
				Escribir "1- Registro de ciclistas ";
				Escribir "** ( No se ha realizado el proceso de inscripciones ) **";
				Escribir "** (se iniciará automaticamente con cualquier opción) **";
			FinSi
		FinSi
		Escribir "2- Retirar ciclista";
		Escribir "3- Consultar ciclista";
		Escribir "4- Consultar el mejor corredor";
		Escribir "5- Consultar el peor corredor";
		Escribir "6- Consultar lista de posiciones";
		Escribir "7- Consultar lista de retirados";
		Escribir "8- Modificar datos de ciclista";
		Escribir "X- Salir.";
		Escribir "";
		Escribir "Indique su opcion y presione enter: ";
		leer orden;
		
		Limpiar Pantalla;
		
		si (registro == Verdadero && orden=='1')
			Escribir " ";
			Escribir "El proceso de registro ya fue realizado.";
			Escribir "";
			Escribir "Pulse una tecla para volver al menú...";
			orden = ' ';
			Esperar Tecla;
			Limpiar Pantalla;
		siNo si ((orden != 'x' || orden != 'X') && (registro == Falso))
				orden = '1';
				registro = Verdadero;
			FinSi
		FinSi
		
		esta = falso;
		
		Segun orden Hacer
			opcion '1':
				i=0;
				para dia=1 hasta 5 con paso 1 hacer
					
					hombresdia = 0;
					mujeresdia = 0;
					
					Repetir
						
						Escribir "       Registrar ciclistas Día ", dia;
						Escribir "";
						escribir " Registrar ciclista Nº", i+1;
						
						Repetir
							Escribir Sin Saltar "      Cedula: "; leer cedula[i];
							// Verificar que no este registrado el numero de cedula indicado.
							si regs > 0
								para k=0 hasta regs-1 Con Paso 1 Hacer
									si cedula[i] == cedula[k]
										esta = Verdadero;
										index = k;
									FinSi
								FinPara
							FinSi
							si ( esta ) 
								Escribir " Ciclista con cedula #", cedula[i], " ya registrado. Ingrese otra..."; 
							FinSi
							
						Hasta Que esta == falso;
						
						Escribir Sin Saltar "      nombre: "; leer nombre[i];
						Escribir Sin Saltar "    apellido: "; leer apellido[i];
						
						Repetir // valida que la edad se encuentre dentro del rango 18-40
							Escribir Sin Saltar "edad (18-40): "; leer edad[i];
						Hasta Que ( edad[i] >= 18 && edad[i] <= 40 );
						
						Repetir // valida que se ingrese el sexo adecuado masculino o femenino unicamente
							Escribir Sin Saltar "  sexo (m/f): "; leer sexo[i];
						Hasta Que (sexo[i] == 'M' || sexo[i] == 'm' || sexo[i] == 'F' || sexo[i] == 'f');
						
						// Area de calculos durante el registro diario. 
						
						// Registro promedio y mejor tiempo de 3vueltas en clasificatorias
						bestime[i] = 1000;
						badtime[i] = 0;
						acumtv = 0;
						para vuelta=1 hasta 3 con paso 1 Hacer
							Escribir Sin Saltar " Tiempo (en seg) vuelta ", vuelta, ": "; leer tvuelta;
							acumtv = acumtv + tvuelta;
							// Define el mejor tiempo (el menor) de las 3 vueltas
							si (tvuelta <= bestime[i]) 
								bestime[i] = tvuelta;
							FinSi
							// Define el peor tiempo (el mayor) de las 3 vueltas
							si (tvuelta >= badtime[i])
								badtime[i] = tvuelta;
							FinSi
						FinPara
						promvueltas[i] = acumtv/3;
						
						si (edad[i] >= 23 && edad[i] <=27) // cuenta las personas entre 23 y 27 años
							jovenes = jovenes + 1;
						sino si (edad[i] >= 30 && edad[i] <=40) // cuenta las personas entre 30 y 40 años
								mayores = mayores + 1;
							FinSi
						FinSi
						
						// Cuenta cuantos hombres y mujeres se regs
						Si (sexo[i] == 'M' || sexo[i] == 'm')
							hombresdia = hombresdia + 1;
						sino si (sexo[i] == 'F' || sexo[i] == 'f')
								mujeresdia = mujeresdia + 1;
							FinSi
						FinSi
						
						Limpiar Pantalla;
						
						i=i+1;
						si i == cant-1 
							Escribir " Ya no hay más cupos disponibles.";
							Escribir " Registro finalizado.";
							Esperar 3 segundos;
							otroreg = '0';
							dia = 5;
						SiNo
							Escribir "";
							Escribir " Marque 1 si desea registrar otro ciclista";
							Escribir " Marque otra tecla para finalizar el registro del día ", dia;
							leer otroreg;
							Limpiar Pantalla;
						FinSi
						
						regs = i; // var control del total registrados.
						
					Hasta Que otroreg != '1';
					
					Escribir "";
					Escribir " ___o-´o___ Informe dia ", dia;
					Escribir "";
					Escribir " ", hombresdia, " Hombre(s).";
					Escribir " ", mujeresdia, " Mujer(es).";
					Escribir "";
					Escribir " ", hombresdia+mujeresdia, " en total.";
					
					// total de hombres y mujeres en la semana
					hombresem = hombresem + hombresdia;
					mujeresem = mujeresem + mujeresdia;
					// porcentaje de cada uno
					x100hombres = (hombresem*100)/regs;
					x100mujeres = (mujeresem*100)/regs;
					
					Escribir "";
					Escribir " Pulse una tecla para volver al menú...";
					
					Esperar Tecla;
					Limpiar Pantalla;
				FinPara
				
				// Resultados de las inscripciones
				Escribir "";
				Escribir " El proceso de inscripción a finalizado. ";
				Escribir "";
				Escribir " El total de ciclistas registrados es: ", hombresem+mujeresem;
				Escribir "";
				Escribir " ", x100hombres, "% Hombres.";
				Escribir " ", x100mujeres, "% Mujeres.";
				Escribir "";
				Escribir " ", jovenes, " entre 23 y 27 años.";
				Escribir " ", mayores, " entre 30 y 40 años.";
				Escribir "";
				Escribir " Presione una tecla para continuar...";
				Esperar Tecla;
				
			opcion '2': // Retirar ciclista
				Escribir "";
				Escribir " Indique el numero de cedula del ciclista a retirar: ";
				leer scedula;
				// Busca el num cedula indicado en la list
				para i=0 hasta regs-1 con paso 1 hacer
					si ( scedula == cedula[i] ) 
						esta = Verdadero;
						index = i;
					FinSi
				FinPara
				// Muestra el result de la busqueda
				si ( esta ) entonces
					bestime[index] = 0; badtime[index] = 0; promvueltas[index] = 0;
					Escribir " Los datos del ciclista ", nombre[index], " ", apellido[index], " fueron removidos.";
					Escribir "";
					Escribir " Pulse una tecla para volver al menu.";
					Esperar Tecla;
				SiNo 
					Escribir " No hay ciclista registrado con ese numero de cedula.";
					Escribir "";
					Escribir " Pulse una tecla para volver al menu.";
					Esperar Tecla;
				FinSi
				
			opcion '3': // Consultar ciclista
				Escribir "";
				Escribir " Para buscar ciclista indique el numero de cedula: ";
				leer scedula;
				
				// Busca en la lista de cedulas si esta registrada
				para i=0 hasta regs-1 con paso 1 hacer
					si ( scedula == cedula[i] )
						esta = Verdadero;
						index = i;
					FinSi
				FinPara
				
				// Muestra el resultado de la busqueda
				si ( esta ) 
					Escribir "";
					Escribir " Ciclista ", index+1, " de ", regs;
					Escribir "";
					Escribir "  Nombre: ", nombre[index];
					Escribir "apellido: ", apellido[index];
					Escribir "  cedula: ", cedula[index];
					Escribir "    edad: ", edad[index];
					Escribir "    sexo: ", sexo[index];
					Escribir "";
					Escribir "Vueltas clasificatorias: 3";
					Escribir "Mejor tiempo: ", bestime[index], " seg";
					Escribir "Peor tiempo : ", badtime[index], " seg";
					Escribir "Promedio    : ", promvueltas[index], " seg";
					Escribir "";
					Escribir " Pulse una tecla para volver al menu.";
					Esperar Tecla;
				SiNo
					Escribir " No hay ciclista registrado con ese numero de cedula.";
					Escribir "";
					Escribir " Pulse una tecla para volver al menu.";
					Esperar Tecla;
				FinSi
				
			opcion '4': // Consultar el mejor corredor
				
				bestimem = 1000; bestimef = 1000;
				// Encuentra el mejor tiempo de cada sexo
				para i=0 hasta regs-1 con paso 1 Hacer
					si ((bestime[i] <= bestimem) && (sexo[i] == 'M' || sexo[i] == 'm')) Entonces
						bestimem = bestime[i];
						im = i;
					FinSi
					si ((bestime[i] <= bestimef) && (sexo[i] == 'F' || sexo[i] == 'f')) Entonces
						bestimef = bestime[i];
						if = i;
					FinSi
				FinPara
				// mostrar el resultado de la busqueda
				Escribir "";
				Escribir " Mejores tiempos en la clasificatoria: ";
				Escribir "";
				si ( (bestime[im] != 0) && (bestime[if] != 0)) 
					Escribir " Hombre: ", nombre[im], " ", apellido[im], " - ", bestime[im], " seg.";
					Escribir " Mujer: ", nombre[if], " ", apellido[if], " - ", bestime[if], " seg.";
				FinSi
				
				Escribir "";
				Escribir " Pulse una tecla para volver al menu.";
				Esperar Tecla;
				
			opcion '5': // Consultar al peor corredor
				
				badtimem = 0; badtimef = 0;
				// Encuentra el peor tiempo de cada sexo
				para i=0 hasta regs-1 con paso 1 Hacer
					si ((badtime[i] >= badtimem) && (sexo[i] == 'M' || sexo[i] == 'm')) Entonces
						badtimem = bestime[i];
						im = i;
					FinSi
					si ((bestime[i] >= badtimef) && (sexo[i] == 'F' || sexo[i] == 'f')) Entonces
						badtimef = badtime[i];
						if = i;
					FinSi
				FinPara
				// mostrar el resultado de la busqueda
				Escribir "";
				Escribir " Peores tiempos en la clasificatoria: ";
				Escribir "";
				Escribir " Hombre: ", nombre[im], " ", apellido[im], " - ", badtime[im], " seg.";
				Escribir "  Mujer: ", nombre[if], " ", apellido[if], " - ", badtime[if], " seg.";
				
				Escribir "";
				Escribir " Pulse una tecla para volver al menu.";
				Esperar Tecla;
				
			opcion '6': // Consultar lista de pocisiones para la gran vuelta
				Escribir "";
				Escribir " Pocisión de salida de los corredores: ";
				Escribir "";
				// Copio los vectores originales a ordenar para no afectar list original
				para i=0 hasta regs-1 con paso 1 Hacer
						pt[i] = promvueltas[i];
						name[i] = nombre[i];
						apell[i] = apellido[i];
				FinPara
				// Ordenacion con el metodo de la burbuja de 2+ arreglos
				para i=0 hasta regs-2 con paso 1 Hacer
					para j=i+1 hasta regs-1 con paso 1 Hacer
						si ( pt[i] >= pt[j] )
							auxt = pt[i];
							pt[i] = pt[j];
							pt[j] = auxt;
							auxn = name[i];
							name[i] = name[j];
							name[j] = auxn;
							auxa = apell[i];
							apell[i] = apell[j];
							apell[j] = auxa;
						FinSi
					FinPara
				FinPara
				Para i=0 hasta regs-1 con paso 1 Hacer
					si ( pt[i] != 0 ) Entonces
						Escribir " P.", i+1, " ", name[i], " ", apell[i], " ", pt[i], " seg";
					FinSi
				FinPara
				Escribir "";
				Escribir " Pulse una tecla para volver al menu.";
				Esperar Tecla;
				
			opcion '7': // Consultar lista de corredores retirados
				Escribir "";
				Escribir " Lista de corredores retirados: ";
				Escribir "";
				j = 1;
				para i=0 hasta regs-1 con paso 1 Hacer
					Si ( bestime[i] == 0 ) 
						Escribir "R.", j, ") ", nombre[i], " ", apellido[i], " - Retirado";
						j = j + 1;
					FinSi
				FinPara
				
				Escribir "";
				Escribir " Pulse una tecla para volver al menu.";
				Esperar Tecla;
			opcion '8':
				Escribir "";
				Escribir " Indique el numero de cedula del ciclista que desea modificar: ";
				leer scedula;
				// Busca en la lista de cedulas si esta registrado
				para i=0 hasta regs-1 con paso 1 hacer
					si ( scedula == cedula[i] )
						esta = Verdadero;
						index = i;
					FinSi
				FinPara
				si esta
					repetir 
						Limpiar Pantalla;
						Escribir " Indique lo que desea modificar: Ciclista ", nombre[index], " ", apellido[index];
						Escribir " a- nombre y apellido";
						Escribir " b- edad";
						Escribir " c- sexo (si es m cambia a f y viceversa)";
						Escribir " d- tiempo en vueltas clasificatorias";
						Escribir " e- Ninguno, volver al menu principal.";
						Escribir Sin Saltar "___o-´o___ Indique su opcion: (a,b,c,d o e)"; leer opmod; 
						Limpiar Pantalla;
						// opciones del sub-menu
						si opmod == 'a'
							Escribir "";
							Escribir " Modificar nombre y apellido de: ", nombre[index], " ", apellido[index];
							Escribir "";
							Escribir sin saltar " Nuevo nombre: "; leer nombre[index];
							Escribir Sin Saltar " Nuevo apelido:"; leer apellido[index];
							Escribir "";
							Escribir " Datos modificados con exito!";
							Escribir "";
							Escribir " Pulse una tecla para volver al menu...";
							Esperar Tecla;
						sino si opmod == 'b'
							Escribir "";
							Escribir " Modificar edad de: ", nombre[index], " ", apellido[index];
							Escribir "";
							Escribir sin saltar " Nueva edad: "; leer edad[index];
							Escribir "";
							Escribir " Edad modificada con exito!";
							Escribir "";
							Escribir " Pulse una tecla para volver al menu...";
							Esperar Tecla;
						sino si opmod == 'c'
							si sexo[index] == 'm' || sexo[index] == 'M'
								sexo[index] = 'f';
								Escribir " Sexo cambiado a femenino.";
							sino si sexo[index] == 'f' || sexo[index] == 'F'
									sexo[index] = 'm';
									Escribir " Sexo cambiado a masculino.";
								FinSi
							FinSi
							Escribir "";
							Escribir " Pulse una tecla para volver al menu...";
							Esperar Tecla;
						sino si opmod == 'd'
							Escribir "";
							Escribir " Modificar tiempos en vueltas clasificatorias: ";	
							bestime[index] = 1000;
							badtime[index] = 0;
							acumtv = 0;
							para vuelta=1 hasta 3 con paso 1 Hacer
								Escribir Sin Saltar " Vuelta ", vuelta, ". Tiempo (en seg): "; leer tvuelta;
								acumtv = acumtv + tvuelta;
								// Define el mejor tiempo (el menor) de las 3 vueltas
								si (tvuelta <= bestime[index]) 
									bestime[index] = tvuelta;
								FinSi
								// Define el peor tiempo (el mayor) de las 3 vueltas
								si (tvuelta >= badtime[index])
									badtime[index] = tvuelta;
								FinSi
							FinPara
							promvueltas[i] = acumtv/3;
							Escribir "";
							Escribir " Se han modificado los tiempos de las vueltas clasificatorias con exito!";
							Escribir "";
							Escribir " Pulse una tecla para volver al menu...";
							Esperar Tecla;
						sino si opmod == 'e'
							Escribir "";
							Escribir " Ha decidido no modificar ningún dato.";
							Escribir "";
							Escribir "";
							Escribir " Pulse una tecla para volver al menu principal...";
							Esperar Tecla;
						FinSi
						FinSi
						FinSi 
						FinSi
						FinSi
					Hasta Que opmod == 'e';
				SiNo
					Escribir "";
					Escribir " El numero de cedula indicado no esta egistrado.";
					Escribir "";
					Escribir " Pulse una tecla para volver al menú...";
					Esperar Tecla;
				FinSi
		FinSegun
	Hasta Que ( orden == 'x' || orden == 'X' );
	
FinAlgoritmo 