Algoritmo sin_titulo
	
	definir cant_pasajeros, max, edad, tipo_pasaje, respuesta, band  Como Entero;
	definir clase1, clase2, clase3, max_clase1, max_clase2, max_clase3, break Como Entero;
	definir joven, viejo, boleto_clase1, boleto_clase2, boleto_clase3, equipaje_liviano Como Entero; 
	definir equipaje_pesado, i, mas_joven, mas_viejo, pos_mas_joven, pos_mas_viejo  Como Entero;
	
	definir nombre, apellido, cedula, genero Como caracter;
	Definir peso_equipaje, valor_boleto, ganancia_total Como real;
	
	max = 185;
	cant_pasajeros = 0;
	band = 0;
	clase1 = 0;
	clase2 = 0;
	clase3 = 0;
	max_clase1 = 40;
	max_clase2 = 60;
	max_clase3 = 85;
	joven = 0;
	viejo = 0;
	boleto_clase1 = 300;
	boleto_clase2 = 275;
	boleto_clase3 = 220;
	equipaje_liviano = 26;
	equipaje_pesado = 40;
	mas_joven = 999;
	mas_viejo = 0;
	ganancia_total = 0;
	
	Dimension nombre[max], apellido[max], cedula[max], edad[max], genero[max], tipo_pasaje[max], peso_equipaje[max], valor_boleto[max];
	
	Repetir
		
		escribir "Boleto #", cant_pasajeros+1, ": ";
		
		escribir "Ingrese nombre: ";
		leer nombre[cant_pasajeros];
		
		Escribir "Ingrese apellido: ";
		leer apellido[cant_pasajeros];
		
		Escribir "Ingrese cedula: ";
		leer cedula[cant_pasajeros];
		
		escribir "Ingrese la edad: ";
		leer edad[cant_pasajeros];
		
		si (edad[cant_pasajeros] < 24) entonces
			joven = joven + 1;
		FinSi
			
		si (edad[cant_pasajeros] > 60) Entonces
			viejo = viejo + 1;
		FinSi
		
		si (edad[cant_pasajeros] < mas_joven) Entonces
			mas_joven = edad[cant_pasajeros];
			pos_mas_joven = cant_pasajeros;
		FinSi
		
		si (edad[cant_pasajeros] > mas_viejo) entonces
			mas_viejo = edad[cant_pasajeros];
			pos_mas_viejo = cant_pasajeros;
		FinSi
		
		escribir "Ingrese el genero: ";
		Leer genero[cant_pasajeros];
		
		Repetir
			Escribir "Ingrese el tipo de pasaje, 1) Primera clase. 2) Segunda clase. 3) Popular. :";
			leer tipo_pasaje[cant_pasajeros];
			
			break = 0;
			
			si (tipo_pasaje[cant_pasajeros] == 1) entonces
				si (clase1 < max_clase1) entonces
					clase1 = clase1 + 1;
				SiNo
					Escribir "No hay boletos para esta clase";
					break = 1;
				FinSi
			FinSi
			
			si(tipo_pasaje[cant_pasajeros] == 2) Entonces
				si (clase2 < max_clase2) entonces
					clase2 = clase2 + 1;
				SiNo
					Escribir "No hay boletos para esta clase";
					break = 1;
				FinSi
			FinSi
			
			si(tipo_pasaje[cant_pasajeros] == 3) Entonces
				si (clase3 < max_clase3) entonces
					clase3 = clase3 + 1;
				SiNo
					Escribir "No hay boletos para esta clase";
					break = 1;
				FinSi
			FinSi
		Hasta Que ((tipo_pasaje[cant_pasajeros] == 1 || tipo_pasaje[cant_pasajeros] == 2 || tipo_pasaje[cant_pasajeros] == 3) && break == 0);
		
		Escribir "Ingrese el peso del equipaje: ";
		leer peso_equipaje[cant_pasajeros];
		
		si (tipo_pasaje[cant_pasajeros] == 1) entonces
			si(peso_equipaje[cant_pasajeros] < 9) Entonces
				valor_boleto[cant_pasajeros] = boleto_clase1 + (boleto_clase1 * 0.12) + equipaje_liviano;
			SiNo
				valor_boleto[cant_pasajeros] = boleto_clase1 + (boleto_clase1 * 0.12) + equipaje_pesado;
			FinSi
		FinSi
		
		si (tipo_pasaje[cant_pasajeros] == 2) entonces
			si(peso_equipaje[cant_pasajeros] < 9) Entonces
				valor_boleto[cant_pasajeros] = boleto_clase2 + (boleto_clase2 * 0.12) + equipaje_liviano;
			SiNo
				valor_boleto[cant_pasajeros] = boleto_clase2 + (boleto_clase2 * 0.12) + equipaje_pesado;
			FinSi
		FinSi
		
		si (tipo_pasaje[cant_pasajeros] == 3) entonces
			si(peso_equipaje[cant_pasajeros] < 9) Entonces
				valor_boleto[cant_pasajeros] = boleto_clase3 + (boleto_clase3 * 0.12) + equipaje_liviano;
			SiNo
				valor_boleto[cant_pasajeros] = boleto_clase3 + (boleto_clase3 * 0.12) + equipaje_pesado;
			FinSi
		FinSi
		
		ganancia_total = ganancia_total + valor_boleto[cant_pasajeros];
		
		Escribir "¿Hay otro pasajero? 1) Si. 2) No. :";
		leer respuesta;
		
		Si (respuesta == 1) Entonces
			cant_pasajeros = cant_pasajeros + 1;
		SiNo
			band = 1;
		Fin Si
		
	Hasta Que (cant_pasajeros >= max || band == 1);
	
	Escribir "Cantidad de Boletos vendidos: ";
	Escribir "Primera Clase: ", clase1;
	Escribir "Segunda Clase: ", clase2;
	Escribir "Popular: ", clase3;
	
	si (clase1 + clase2 + clase3 == max) entonces
		Escribir "Se vendieron todos los boletos";
	SiNo
		Escribir "Quedaron ", max - clase1 - clase2 - clase3 , " Boletos.";
	FinSi
	
	Escribir "Pasajeros menores de 24 años: ", joven;
	Escribir "Pasajeros mayores de 60 años: ", viejo;
	
	Escribir "Pasajeros con su respectivo valor del boleto:";
	Para i=0 Hasta cant_pasajeros Con Paso 1 Hacer
		Escribir "Pasajero: ", cedula[i], " , ", valor_boleto[i], "$";
	Fin Para
	
	Escribir "Pasajero mas joven: ";
	Escribir "Nombre: ", nombre[pos_mas_joven]; 
	Escribir "Apellido: ", apellido[pos_mas_joven];
	Escribir "Cedula: ", cedula[pos_mas_joven]; 
	Escribir "Edad: ", edad[pos_mas_joven]; 
	Escribir "Genero: ", genero[pos_mas_joven]; 
	Escribir "Tipo de Pasaje. 1)Primera clase. 2)Segunda clase. 3)Popular: ", tipo_pasaje[pos_mas_joven];
	Escribir "Valor del pasaje: ", valor_boleto[pos_mas_joven], "$";
	
	Escribir "Pasajero mas viejo: ";
	Escribir "Nombre: ", nombre[pos_mas_viejo]; 
	Escribir "Apellido: ", apellido[pos_mas_viejo];
	Escribir "Cedula: ", cedula[pos_mas_viejo]; 
	Escribir "Edad: ", edad[pos_mas_viejo]; 
	Escribir "Genero: ", genero[pos_mas_viejo]; 
	Escribir "Tipo de Pasaje. 1)Primera clase. 2)Segunda clase. 3)Popular: ", tipo_pasaje[pos_mas_viejo];
	Escribir "Valor del pasaje: ", valor_boleto[pos_mas_viejo], "$";
	
	Escribir "Ganancia total obtenida: ", ganancia_total; 
	
FinAlgoritmo 
