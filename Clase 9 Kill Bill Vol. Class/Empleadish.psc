SubProceso entradas(genero Por Referencia, sueldo Por Referencia, edad Por Referencia)
	
	Repetir
		Mostrar "Ingrese Nombre del Empleado:" Sin Saltar
		Leer nombre
		Si nombre = "" Entonces
			Mostrar "ERROR: INGRESE UN NOMBRE VALIDO"
		FinSi
	Hasta Que nombre <> ""
	
	Repetir
		Mostrar "Ingrese Genero del Empleado (F/M):" Sin Saltar
		Leer genero
		genero = Mayusculas(genero)
		Si genero <> "F" Y genero <> "M" Entonces
			Mostrar "ERROR: INGRESE UN VALOR VALIDO"
		FinSi
	Hasta Que genero = "F" O genero = "M"
	
	Repetir
		Mostrar "Ingrese Edad del Empleado:" Sin Saltar
		Leer edad
		genero = Mayusculas(genero)
		Si edad <= 0 Entonces
			Mostrar "ERROR: INGRESE UN VALOR VALIDO"
		FinSi
	Hasta Que edad > 0
	
	Repetir
		Mostrar "Ingrese el Sueldo del Empleado:" Sin Saltar
		Leer sueldo
		Si sueldo <= 0 Entonces
			Mostrar "ERROR: INGRESE UN VALOR VALIDO"
		FinSi
	Hasta Que sueldo > 0
	
FinSubProceso

SubProceso evaluar_empleados()
	Definir cantidad_empleados Como Entero
	Definir cant_mujer_50años Como Entero
	Definir cant_hombre Como Entero
	Definir sueldo_30años Como Real
	Definir genero Como Caracter
	Definir sueldo Como Real
	Definir edad Como Entero
	
	cantidad_empleados = 0
	cant_mujer_50años = 0
	cant_hombre = 0
	sueldo_30años = 0
	
	Repetir
		cantidad_empleados = cantidad_empleados + 1
		Mostrar "Empleado Nº" cantidad_empleados
		Mostrar ""
		entradas(genero, sueldo, edad)
		Mostrar ""
		Si genero = "F" Y edad >= 50 Entonces
			cant_mujer_50años = cant_mujer_50años + 1
		FinSi
		Si genero = "M" Entonces
			cant_hombre = cant_hombre + 1
		FinSi
		Si edad >= 30 Entonces
			sueldo_30años = sueldo_30años + sueldo
		FinSi
		Repetir
			Mostrar "Desea Ingresar un Empleado mas (S/N)?:" Sin Saltar
			Leer continuar
			continuar = Mayusculas(continuar)
			Si continuar <> "S" Y Continuar <> "N"
				Mostrar "ERROR: RESPUESTA NO VALIDA"
			FinSi
			Mostrar ""
		Hasta Que continuar = "S" O continuar = "N"
	Hasta Que continuar = "N"
	Mostrar "Cantidad de Empleados Evaluados: " cantidad_empleados
	Mostrar "Cantidad de Mujeres Mayores de 50 años: " cant_mujer_50años
	Mostrar "Cantidad de Hombres: " cant_hombre
	Mostrar "Sueldo de los Empleados Mayores de 30 años: " sueldo_30años
	Esperar Tecla
FinSubProceso

Algoritmo Empresish
	
	evaluar_empleados()
	
FinAlgoritmo
