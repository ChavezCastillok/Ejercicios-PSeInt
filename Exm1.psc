Algoritmo PseudoCodigo1
	Definir nombre, apellido Como Caracter;
	definir edad Como Entero;
	
	escribir "Nombre cliente: "; leer nombre;
	escribir "Apellido cliente: "; leer apellido;
	escribir "Edad del cliente: "; leer edad;
	
	definir harina, aceite, azucar Como Entero;
	Definir base, totalp, totalf, totaliva, descuento Como Real;
	
	harina = 20; aceite = 180; azucar = 30;
	base = harina + aceite + azucar;
	totalf = harina+(aceite*1.16)+(azucar*1.16);
	totaliva = (aceite+azucar)*0.16;
	// Realizado por Kevin Chavez...
	si (edad < 30) entonces
		descuento = totalf*0.05;
		sino si (edad >= 30 && edad < 60) entonces
			descuento = totalf*0.10;
			SiNo
				descuento = totalf*0.15;
		FinSi
	FinSi
	
	totalp = base + totaliva;
	totalf = totalf - descuento;
	
	escribir " ";
	escribir "Cliente: ", nombre," ", apellido, " de ", edad, " años.";
	escribir " ";
	escribir "Monto base      : ", base, " BsS";
	escribir "IVA 16%         : ", totaliva, " BsS";
	escribir "Total           : ", totalp, " BsS";
	escribir "Descuento x edad: ", descuento, " BsS";
	escribir "Total a pagar   : ", totalf, " BsS";
	
FinAlgoritmo
