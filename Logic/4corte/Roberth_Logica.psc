Funcion opcion <- Menu()
    Limpiar Pantalla
	Escribir "    Carrera de Ciclismo"
	Escribir "       ***  MENU  ***"
	Escribir "                      "
	Escribir "   1. Registrar Ciclista"
	Escribir "   2. Retirar Ciclista"
	Escribir "   3. Consultar Registro Diario de Inscripciones"
	Escribir "   4. Consultar Registro Total"
	Escribir "   5. Consultar Datos de Ciclista"
	Escribir "   6. Consultar Mejor Ciclista"
	Escribir "   7. Consultar Peor Ciclista"
	Escribir "   8. Consultar Posiciones de Salida"
	Escribir "   9. Consultar Ciclistas Retirados"
	Escribir "   10. Salir"
	Escribir "                      "
	// ingresar una opcion
	Escribir "Escriba su opción: "
	Leer opcion
FinFuncion
//************************************************************

//***********************************************************

Algoritmo Ciclistas
	Definir OP, i, x, dia_inscripcion, cont_hombres, cont_mujeres, bandera como Entero
	definir cont_mujeres_total, cont_hombres_total, ciclistas2327, ciclistas3040, edadx como entero
	definir mayor_tiempo, menor_tiempo como entero
	definir cedula_consultar  como cadena
	definir nombre_mayor, apellido_mayor, cedula_mayor como cadena
	definir nombre_menor, apellido_menor, cedula_menor como cadena
	Definir respuesta como Caracter
	definir cedula_retirar,tempx como cadena
	
	respuesta<-"s"
	i<-1
	cont_hombres<-0
	cont_mujeres<-0
	dia_inscripcion<-0
	bandera<-0
	cont_mujeres_total<-0
	cont_hombres_total<-0
	ciclistas2327<-0
	ciclistas3040<-0
	mayor_tiempo<-0
	menor_tiempo<-99999
	
	Dimension Nombre(1000), Apellido(1000),Cedula(1000), Edad(1000), Sexo(1000), Prom_vueltas(1000);
	Dimension Status(1000), Mejor_tiempo(1000),dia_de_inscripcion(1000);
	Repetir
        // mostrar menu
        OP<-Menu();
		Limpiar Pantalla
        // procesar esa opción
        Segun OP Hacer
            1:
                Limpiar Pantalla
				
				Mientras  respuesta="s" Hacer
					Limpiar Pantalla
					Escribir "Ingrese el dia de inscripcion (1/2/3/4/5): "
					Leer dia_inscripcion
											
					
					si dia_inscripcion<=5 Entonces
						Escribir "Ingrese Edad del Ciclista ",i
						Leer edadx
						
						si edadx>=18 y edadx<=40 Entonces
							Edad(i)<-edadx						
							Escribir "Ingrese Nombre del Ciclista ",i
							Leer Nombre(i)
							Escribir "Ingrese Apellido del Ciclista ",i
							Leer Apellido(i)
							Escribir "Ingrese Cedula del Ciclista ",i
							Leer Cedula(i)
							Escribir "Ingrese Sexo del Ciclista (F/M)",i
							Leer Sexo(i)
							Escribir "Ingrese Promedio de las 3 vueltas del Ciclista ",i
							Leer Prom_vueltas(i)
							Escribir "Ingrese El menor tiempo de las 3 vueltas del Ciclista ",i
							Leer Mejor_tiempo(i)
							Status(i)<-"Activo"
							dia_de_inscripcion(i)<-dia_inscripcion;
							i=i+1;
						SiNo
							Escribir "El ciclista no puede inscribirse porque no cumple requisito de edad"
						FinSi
						
					SiNo
						Escribir "Se terminó el lapso de inscripcion"
					finSi
											
					Escribir "Desea registrar otro ciclista? (S/N):"
					leer respuesta
						
				FinMientras
				
								
            2:
                // Retirar ciclista ingresando numero de cedula
				// validad que no hayan terminado las inscripciones
				// colocar status "Retirado"
				Escribir "Ingrese el dia de inscripcion (1/2/3/4/5): "
				Leer dia_inscripcion
				respuesta<-"s"
				si dia_inscripcion<=5
					Entonces
					//Registrar datos de ciclista en vectores
					Mientras respuesta="s" Hacer
						
						Limpiar Pantalla
						Escribir "Ingrese cedula del Ciclista que desea retirar"
						Leer cedula_retirar
						
						para x<-1 hasta 1000 con paso 1 Hacer
							si Cedula(x)=cedula_retirar
								Status(x)<-"Retirado"
								bandera<-1
							FinSi
							
						FinPara
						
						si bandera=0 Entonces
							Escribir "Ciclista no encontrado"
						FinSi
						
						Escribir "Desea retirar otro ciclista? (S/N):"
						leer respuesta
												
					FinMientras
				SiNo
					Escribir "No puede retirar ciclistas, el lapso ha terminado"
				FinSi
				
				
            3:
                // Listar hombres y mujeres inscritos cada dia
				Limpiar Pantalla
				
				para x<-1 hasta 1000 con paso 1 Hacer
					si Sexo(x)="F" y dia_de_inscripcion(x)=1 y Status(x)="Activo"
						entonces
						cont_mujeres=cont_mujeres+1
					sino
						si Sexo(x)="M" y dia_de_inscripcion(x)=1
							cont_hombres=cont_hombres+1
						FinSi
						
					FinSi
				FinPara
				
				Escribir "    Dia 1 "
				Escribir " Hombres: ", cont_hombres
				Escribir " Mujeres: ", cont_mujeres
				Escribir "    "
				
				cont_hombres<-0
				cont_mujeres<-0
				
				para x<-1 hasta 1000 con paso 1 Hacer
					si Sexo(x)="F" y dia_de_inscripcion(x)=2 y Status(x)="Activo"
						entonces
						cont_mujeres=cont_mujeres+1
					sino
						si Sexo(x)="M" y dia_de_inscripcion(x)=2
							cont_hombres=cont_hombres+1
						FinSi
					FinSi
				FinPara
				
				Escribir "    Dia 2 "
				Escribir " Hombres: ", cont_hombres
				Escribir " Mujeres: ", cont_mujeres
				Escribir "    "
				
				
				cont_hombres<-0
				cont_mujeres<-0
				
				para x<-1 hasta 1000 con paso 1 Hacer
					si Sexo(x)="F" y dia_de_inscripcion(x)=3 y Status(x)="Activo"
						Entonces
						cont_mujeres=cont_mujeres+1
					sino
						si Sexo(x)="M" y dia_de_inscripcion(x)=3
							cont_hombres=cont_hombres+1
						FinSi
					FinSi
				FinPara
				
				Escribir "    Dia 3 "
				Escribir " Hombres: ", cont_hombres
				Escribir " Mujeres: ", cont_mujeres
				Escribir "    "
				
				
				cont_hombres<-0
				cont_mujeres<-0
				
				para x<-1 hasta 1000 con paso 1 Hacer
					si Sexo(x)="F" y dia_de_inscripcion(x)=4 y Status(x)="Activo"
						Entonces
						cont_mujeres=cont_mujeres+1
					sino
						si Sexo(x)="M" y dia_de_inscripcion(x)=4
							cont_hombres=cont_hombres+1
						FinSi
					FinSi
				FinPara
				
				Escribir "    Dia 4 "
				Escribir " Hombres: ", cont_hombres
				Escribir " Mujeres: ", cont_mujeres
				Escribir "    "
				
				
				cont_hombres<-0
				cont_mujeres<-0
				
				para x<-1 hasta 1000 con paso 1 Hacer
					si Sexo(x)="F" y dia_de_inscripcion(x)=5 y Status(x)="Activo"
						Entonces
						cont_mujeres=cont_mujeres+1
					sino
						si Sexo(x)="M" y dia_de_inscripcion(x)=5
							cont_hombres=cont_hombres+1
						FinSi
					FinSi
				FinPara
				
				Escribir "    Dia 5 "
				Escribir " Hombres: ", cont_hombres
				Escribir " Mujeres: ", cont_mujeres
				Escribir "    "
				
				
            4:
                // Listar el total de hombres y mujeres inscritos
				// Listar el % de hombres y mujeres inscritos
				// Cantidad de ciclistas entre 23 y 27 años
				// Cantidad de ciclistas entre 30 y 40 años
				
				para x<-1 hasta 1000 con paso 1 hacer
					si sexo(x)="F" y Status(x)="Activo" entonces
						cont_mujeres_total=cont_mujeres_total+1
					
					FinSi
					
					si sexo(x)="M" y Status(x)="Activo" entonces
						cont_hombres_total=cont_hombres_total+1
					FinSi
					
					si edad(x)>=23 y edad(x)<=27 y Status(x)="Activo" entonces
						ciclistas2327=ciclistas2327+1
					FinSi
					
					si edad(x)>=30 y edad(x)<=40 y Status(x)="Activo" entonces
						ciclistas3040=ciclistas3040+1
					FinSi
					
				FinPara
				
				Limpiar Pantalla
				Escribir "Total hombres inscritos: ", cont_hombres_total
				Escribir "Total mujeres inscritas: ", cont_mujeres_total
				Escribir " % Hombres inscritos: ", (cont_hombres_total*100)/(cont_hombres_total+cont_mujeres_total)
				Escribir " % Mujeres inscritos: ", (cont_mujeres_total*100)/(cont_hombres_total+cont_mujeres_total)
				Escribir "Cantidad de ciclistas entre 23 y 27 años: ", ciclistas2327
				Escribir "Cantidad de ciclistas entre 30 y 40 años: ", ciclistas3040
			5:
                // Consultar datos de ciclista ingresando su cedula y validando si existe
				respuesta<-"s"
				
				Mientras respuesta="s" hacer
				
					Limpiar Pantalla
					Escribir "Ingrese la cedula del ciclista que desea consultar:"
					leer cedula_consultar
					bandera<-0
					para x<-1 hasta 1000 con paso 1 hacer
						si cedula(x)=cedula_consultar entonces
							Escribir "Nombre: ", Nombre(x)
							Escribir "Apellido: ", Apellido(x)
							Escribir "Edad: ", Edad(x)
							Escribir "Sexo: ", Sexo(x)
							Escribir "Promedio de 3 vueltas: ",Prom_vueltas(x)
							Escribir "Mejor tiempo 3 vueltas: ", Mejor_tiempo(x)
							Escribir "Status: ", Status(x)
							Escribir "Dia de inscripcion: ", dia_de_inscripcion(x)
							bandera<-1
						FinSi
						
					FinPara
					
					si bandera=0 Entonces
						Escribir "Ciclista no encontrado!"
					FinSi
					
					
					
					Escribir "Desea consultar otro ciclista? (S/N)"
					Leer respuesta
					
				FinMientras
				
            6:
                //Ciclista con el tiempo mas bajo en la fase preliminar (vuelta con menor tiempo)
				para x<-1 hasta 1000 con paso 1 hacer
					si Mejor_tiempo(x)<menor_tiempo y Status(x)="Activo" entonces
						menor_tiempo<-Mejor_tiempo(x)
						nombre_menor<-Nombre(x)
						apellido_menor<-Apellido(x)
						cedula_menor<-Cedula(x)
					FinSi
					
				FinPara
				
				Escribir " Ciclista con mejor tiempo en la fase de vueltas preliminar"
				Escribir "Nombre: ", nombre_menor
				Escribir "Apellido: ",apellido_menor
				Escribir "Cedula: ",cedula_menor
				Escribir "Tiempo: ", menor_tiempo
            7:
				//Ciclista con el tiempo mas alto en la fase preliminar (vuelta con mayor tiempo)
				para x<-1 hasta 1000 con paso 1 hacer
					si Mejor_tiempo(x)>mayor_tiempo y Status(x)="Activo" entonces
						mayor_tiempo<-Mejor_tiempo(x)
						nombre_mayor<-Nombre(x)
						apellido_mayor<-Apellido(x)
						cedula_mayor<-Cedula(x)
					FinSi
					
				FinPara
				
				Escribir " Ciclista con peor tiempo en la fase de vueltas preliminar"
				Escribir "Nombre: ", nombre_mayor
				Escribir "Apellido: ",apellido_mayor
				Escribir "Cedula: ",cedula_mayor
				Escribir "Tiempo: ", mayor_tiempo
				
            8:
                // Ordenar por promedio de tiempo de menor a mayor 
				//Longitud de la lista
				lon=1000;
				l=lon;
				
				Hacer
					n=0;
					//Recorrer la lista
					Para i=2 Hasta l Con Paso 1 Hacer
						//Verificar si los dos valores estan ordenados
						Si Prom_vueltas(i-1)>Prom_vueltas(i) Entonces
							
							//Ordenar si es necesario
							temp=Prom_vueltas(i-1)
							Prom_vueltas(i-1)=Prom_vueltas(i);
							Prom_vueltas(i)=temp;
							
							tempx=Nombre(i-1)
							Nombre(i-1)=Nombre(i);
							Nombre(i)=tempx;
							
							tempx=Apellido(i-1)
							Apellido(i-1)=Apellido(i);
							Apellido(i)=tempx;
							
							n=i;
							
						FinSi
						
					FinPara
					l=n;
				Hasta Que n=0;
				x=1
				Para i=1 Hasta lon Con Paso 1 Hacer
					si Status(i)="Activo" entonces
						Escribir x,"-",Nombre(i)," ", Apellido(i), " - ",Prom_vueltas(i)
						x=x+1
					FinSi
					
				FinPara
				
            9:
                // mostrar ciclistas con status "Retirado    "
				bandera<-0
				para x<-1 hasta 1000 con paso 1 hacer
					
					si Status(x)="Retirado"  entonces
						Escribir Cedula(x),"- ", Nombre(x)," ",Apellido(x)
						bandera<-1
					FinSi
					
				FinPara
				si bandera=0 Entonces
					Escribir "No hay cicilistas retirados"
				FinSi
			10:
                Escribir "Gracias por preferirnos!"
            De otro modo:
                Escribir "Opción no válida"
        FinSegun
        Escribir "Presione enter para continuar"
        Esperar Tecla
    Hasta Que OP=10
	
	
FinAlgoritmo


