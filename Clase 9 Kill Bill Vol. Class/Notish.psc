SubProceso entradas(nota Por Referencia)
	
	Repetir
		Mostrar "Ingrese Nombre del Alumno:" Sin Saltar
		Leer nombre
		Si nombre = "" Entonces
			Mostrar "ERROR: INGRESE UN NOMBRE VALIDO"
		FinSi
	Hasta Que nombre <> ""

	Repetir
		Mostrar "Ingrese Nota de la Evaluacion (/100):" Sin Saltar
		Leer nota
		si nota < 0 O nota > 100
			Mostrar "ERROR: INGRESE UNA NOTA VALIDA"
		FinSi
	Hasta Que nota >=0 y nota <=100
	
FinSubProceso

SubProceso evaluar_seccion(contador1 Por Referencia, contador2 Por Referencia, contador3 Por Referencia, contador4 Por Referencia, acumulador1 Por Referencia, acumulador2 Por Referencia, acumulador3 Por Referencia)
	Definir cantidad Como Entero
	
	contador1 = 0
	contador2 = 0
	acumulador1 = 0
	acumulador2 = 0
	acumulador3 = 0
	
	Mostrar "Ingrese la Cantidad de Alumnos en la Seccion:" Sin Saltar
	Leer cantidad
	Mostrar ""
	Repetir
		contador1 = contador1 + 1
		Mostrar "Estudiante Nº" contador1
		Mostrar ""
		entradas(nota)
		Mostrar ""
		Esperar 1 Segundos
		Si nota = 100
			contador2 = contador2 + 1
		FinSi
		acumulador1 = acumulador1 + nota
		Si nota >= 50 Entonces
			acumulador2 = acumulador2 + nota
			contador3 = contador3 + 1 
		Sino
			acumulador3 = acumulador3 + nota
			contador4 = contador4 + 1
		FinSi
		Mostrar ""
	Hasta Que contador1 = cantidad
	
FinSubProceso

SubProceso calculos(acumulador1, acumulador2, acumulador3, contador1, contador3, contador4, promedio1 Por Referencia, promedio2 Por Referencia, promedio3 Por Referencia)
	
	promedio1 = acumulador1 / contador1
	promedio1 = TRUNC(promedio1)
	Si contador3 > 0 Entonces
		promedio2 = acumulador2 / contador3
		promedio2 = TRUNC(promedio2)
	FinSi
	Si contador4 > 0 Entonces
		promedio3 = acumulador3 / contador4
		promedio3 = TRUNC(promedio3)
	FinSi
	
FinSubProceso

SubProceso salidas(contador2, promedio1, promedio2, promedio3, contador3, contador4)
	
	Si contador2 = 0 Entonces
		Mostrar "Ningun Alumno Obtuvo 100pts"
	Sino
		Si contador2 = 1 Entonces
			Mostrar "Solo un Alumno Obtuvo 100pts"
		Sino
			Si contador2 >= 2 Entonces
				Mostrar contador2 " Alumnos Obtuvieron 100pts"
			FinSi
		FinSi
	FinSi
	Mostrar "El Promedio de los Alumnos fue: " promedio1 "pts"
	Si contador3 > 0 Entonces
		Mostrar "El Promedio de los Alumnos Aprovados fue: " promedio2 "pts"
	FinSi
	Si contador4 > 0 Entonces
		Mostrar "El Promedio de los Alumnos Reprovados fue: " promedio3 "pts"
	FinSi

	
FinSubProceso
	
Algoritmo Notas
	
	Definir contador1 Como Entero
	Definir contador2 Como Entero
	Definir contador3 Como Entero
	Definir contador4 Como Entero
	Definir acumulador1 Como Real
	Definir acumulador2 Como Real
	Definir acumulador3 Como Real
	Definir promedio1 Como Real
	Definir promedio2 Como Real
	Definir promedio3 Como Real
	
	evaluar_seccion(contador1, contador2, contador3, contador4, acumulador1, acumulador2, acumulador3)
	calculos(acumulador1, acumulador2, acumulador3, contador1, contador3, contador4, promedio1, promedio2, promedio3)
	salidas(contador2, promedio1, promedio2, promedio3, contador3, contador4)
	
FinAlgoritmo
