package EjerciciosGuia1;

import java.util.Vector;

public class Facultad {

	private String Nombre;
	private Vector<Carrera> Carreras;

	public Facultad(String nombre) {		
		this.Nombre = nombre;
		this.Carreras = new Vector<Carrera>();
	}
	
	public void MostrarCarrerasyAlumnos() {
		
		System.out.println(this.ToString());
		
		for(Carrera oCarrera : Carreras) {
			oCarrera.mostrarAlumnos();
		}
	}
	

	public String ToString() {
		return "Facultad " + Nombre;
	}

	public void AgregarCarrera(Carrera carrera) {
		this.Carreras.add(carrera);		
	}
}
