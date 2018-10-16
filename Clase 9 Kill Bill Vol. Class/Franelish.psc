SubProceso comprobar_franelish(precio Por Referencia, cantidad Por Referencia, nombre Por Referencia, tipo Por Referencia)
	
	Repetir
		Mostrar "Ingrese el Nombre del Comprador:" Sin Saltar
		Leer nombre
		Si nombre = "" Entonces
			Mostrar "ERROR: INGRESE UN NOMBRE VALIDO"
		FinSi
	Hasta Que nombre <> ""
	nombre = Mayusculas(Subcadena(nombre,1,1)) + Minusculas(Subcadena(nombre,2,Longitud(nombre)))
	
	Repetir
		Mostrar "Ingrese el Tipo de Franela (S/M/L/XL)" Sin Saltar
		Leer tipo
		tipo = Mayusculas(tipo)	
		
		Segun tipo Hacer
			"S": precio = 2250
			"M": precio = 3000
			"L": precio = 4500
			"XL": precio = 5750
			De Otro Modo:
				Mostrar "ERROR: EL TIPO DE TALLA INGRESADO NO ES VALIDO"
		FinSegun
		
		Mostrar "El Precio por Franela es: " precio "§"
	Hasta Que tipo = "S" O tipo = "M" O tipo = "L" O tipo = "XL"
	
	Mostrar ""
	Repetir
		Mostrar "Ingrese la Cantidad de Franelas que Desea Comprar:" Sin Saltar
		Leer cantidad
		si cantidad <= 0 Entonces
			Mostrar "ERROR: INGRESE UNA CANTIDAD VALIDA"
		FinSi
	Hasta Que cantidad > 0
	
FinSubProceso

SubProceso calculos(cantidad, precio, monto Por Referencia, monto_final Por Referencia, desc_porcentaje Por Referencia, monto_descontado Por Referencia)
	
	Si cantidad >= 6 y cantidad <= 11 Entonces
		descuento = 0.05
	Sino
		Si cantidad >= 12 Y cantidad <=24 Entonces
			descuento = 0.10
		Sino
			Si cantidad >= 25 Entonces
				descuento = 0.15
			Sino
				descuento = 0
			FinSi
		FinSi
	FinSi
	
	desc_porcentaje = descuento * 100
	monto = cantidad * precio
	monto_descontado = monto * descuento
	monto_final = monto - monto_descontado
	
FinSubProceso

SubProceso recibo(nombre, tipo, precio, cantidad, monto, desc_porcentaje, monto_descontado, monto_final)
	
	Mostrar ""
	Mostrar "Procesando Compra, Espere un Momento" Sin Saltar
	Esperar 1 Segundos
	Mostrar "." Sin Saltar
	Esperar 1 Segundos
	Mostrar "." Sin Saltar
	Esperar 1 Segundos
	Mostrar "." 
	Esperar 1 Segundos
	Mostrar ""
	Mostrar "Presione Cualquier Tecla para Continuar"
	Esperar Tecla
	Esperar 1 Segundos
	Limpiar Pantalla

	Mostrar "-------Recibo de Compra-------"
	Mostrar ""
	Mostrar "Nombre del Comprador: " nombre
	Mostrar ""
	Mostrar "Tipo de Franela: " tipo
	Mostrar "Precio Unitario: " precio "§"
	Mostrar "Cantidad: " cantidad
	Mostrar ""
	Mostrar "Monto: " monto "§"
	Mostrar "Descuento (" desc_porcentaje "%): " monto_descontado "§"
	Mostrar "Monto Final: " monto_final "§"
	
FinSubProceso
	
Algoritmo Franelish
	
	Limpiar Pantalla
	
	Definir precio Como Real
	Definir cantidad Como Entero
	Definir nombre Como Caracter
	Definir tipo Como Caracter
	Definir monto Como Real
	Definir monto_final Como Real
	Definir desc_porcentaje Como Real
	Definir monto_descontado Como Real
	
	comprobar_franelish(precio, cantidad, nombre, tipo)
	calculos(cantidad, precio, monto, monto_final, desc_porcentaje, monto_descontado)
	recibo(nombre, tipo, precio, cantidad, monto, desc_porcentaje, monto_descontado, monto_final)
	
	Esperar Tecla
	
FinAlgoritmo
