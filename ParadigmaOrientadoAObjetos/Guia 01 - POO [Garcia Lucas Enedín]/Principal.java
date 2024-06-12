package EjerciciosGuia1;

import java.util.Calendar;
public class Principal {

	public static void main(String[] args) {
		
		Calendar FechaNac = Calendar.getInstance();
		FechaNac.set(Calendar.DATE, 22); 				//Día: 22
		FechaNac.set(Calendar.MONTH, Calendar.AUGUST); 	//Mes: Agosto
		FechaNac.set(Calendar.YEAR, 1997);				//Año: 1997

		Persona Per1 = new Persona("Juan Perez",123456789, FechaNac);
		Persona Per2 = new Persona("Juan Perez",123456789, FechaNac);
		
	
		//Ejercicio 1: Concepto de Identidad de un objeto
		if(Per1.equals(Per2)) {
			System.out.println("Son iguales");
		}else {
			System.out.println("Son Distintos");
		}
		
		//Ejercicio 2: Mostrar información de la persona 
		System.out.println(Per1.Mostrar());
	
		
		//Ejercicio 3: Implementacion de las clases en el diagrama UML
		
		Calendar fechaNacimiento1 = Calendar.getInstance();
		fechaNacimiento1.set(1990, Calendar.NOVEMBER, 11);
		Persona oPersona1 = new Persona("Alumno1", 11111111, fechaNacimiento1);

		Calendar fechaNacimiento2 = Calendar.getInstance();
		fechaNacimiento2.set(1990, Calendar.DECEMBER, 12);
		Persona oPersona2 = new Persona("Alumno2", 22222222, fechaNacimiento2);
		
		Calendar fechaNacimiento3 = Calendar.getInstance();
		fechaNacimiento3.set(1993, Calendar.AUGUST, 22);
		Persona oPersona3 = new Persona("Alumno3", 33333333, fechaNacimiento3);
		
		Facultad oFacultad = new Facultad("FICH");
		
		Carrera oCarrera1 = new Carrera("Ingeniería en Informática", oFacultad);	
		Carrera oCarrera2 = new Carrera("Ingeniería en Recursos Hídricos", oFacultad);
		
		new Alumno(oCarrera1, oPersona1);
		new Alumno(oCarrera1, oPersona2);
		new Alumno(oCarrera2, oPersona3);
		
		oFacultad.MostrarCarrerasyAlumnos();
		
		//Ejercicio 4: Agregar atributo password y validar la clave
		oPersona1.CrearPassword("password1");
		System.out.println("Clave correcta? " + oPersona1.validarPassword("password1"));
		
		
	}

}
