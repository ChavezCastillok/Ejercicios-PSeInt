Algoritmo CasoCaldera
	definir temp Como Entero
	escribir 'Indique temperatura actual de la caldera (0 a 200)'
	leer temp
	si (temp >= 0 && temp <= 30) Entonces
	escribir ' Temperatura baja'
		sino si (temp >= 31 && temp <= 100) entonces
		escribir ' Temperatura optima'
			sino si (temp >= 101 && temp <= 159) entonces
			escribir ' Temperatura alta '
				sino si (temp >= 160 && temp <= 200) entonces
				escribir '¡PELIGRO! Temperatura demasiado alta '
					sino si (temp < 0) entonces
					escribir ' Temperatura bajo 0 '
						sino escribir ' Temperatura exagerada, ingrese un valor valido '
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo
