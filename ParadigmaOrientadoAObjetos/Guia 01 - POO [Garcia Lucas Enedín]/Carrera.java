package EjerciciosGuia1;

import java.util.Vector;

public class Carrera {

	private String Nombre;
	private Facultad oFacultad;
	private Vector<Alumno> Alumnos;
	
	public Carrera(String nombre, Facultad oFacultad) {
		this.Nombre = nombre;
		this.oFacultad = oFacultad;
		this.Alumnos = new Vector<Alumno>();
		
		oFacultad.AgregarCarrera(this);
		
	}
	
	
	public String ToString() {	
		return "Carrera: " + this.Nombre;
	}

	public void mostrarAlumnos() {
		System.out.println( this.ToString() );
		for(Alumno oAlumno : Alumnos) {
			System.out.println(oAlumno.ToString());
		}
	}

	public void AgregarAlumno(Alumno oAlumno) {
		this.Alumnos.add( oAlumno );		
	}
	
	
}