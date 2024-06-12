package EjerciciosGuia1;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Alumno {

	private Carrera oCarrera;
	private Persona oPersona;
	private Calendar FechaInscripcion;
	
	public Alumno(Carrera oCarrera, Persona oPersona) {
	
		this.oCarrera = oCarrera;
		this.oPersona = oPersona;
		this.FechaInscripcion = Calendar.getInstance();
		
		oCarrera.AgregarAlumno(this);
		oPersona.AgregarInscripcion(this);
	}
	
	public String ToString() {	
		SimpleDateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
		return oPersona.ToString() + " - " + fecha.format(this.FechaInscripcion.getTime());
	}
	
}
