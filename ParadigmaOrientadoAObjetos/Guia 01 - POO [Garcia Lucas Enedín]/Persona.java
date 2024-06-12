package EjerciciosGuia1;

import java.util.Calendar;
import java.util.Locale;
import java.util.Vector;

public class Persona {
	//--------------------------atributos----------------------------
	private String nombre;
	private Integer documento;
	private Calendar fechaNacimiento;
	private Vector<Alumno> inscripciones;
	private String password;
	

	//---------------------------------------------------------------
	//------------------------------Constructor-----------------------------------
	public Persona(String nombre, Integer Documento, Calendar Nacimiento) {
		this.nombre = nombre;
		this.documento = Documento;
		fechaNacimiento = Nacimiento;
		this.inscripciones = new Vector<Alumno>();
		this.password = null;
	}
	//----------------------------------------------------------------------------
	//--------------------------Comportamiento-------------------------------------
	public String Mostrar() {
		Calendar DiaCumpleanios = Calendar.getInstance();
		
		//Copio el dia y mes (en números) de la fecha de nacimiento
		DiaCumpleanios.set(Calendar.MONTH, fechaNacimiento.get(Calendar.MONTH));
		DiaCumpleanios.set(Calendar.DATE, fechaNacimiento.get(Calendar.DATE));
		
		String Dia = DiaCumpleanios.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
		return this.nombre + " - "+ this.documento+" Edad: "+CalcularEdad()+" años. Día del cumpleaños este año: "+Dia;
	}

	private Integer CalcularEdad(){
		Calendar Hoy = Calendar.getInstance();
		//Coloco cada fecha en un entero de la forma aaaammdd (año, mes y dia) para luego calcular la diferencia entre las fechas
		Integer FechaPersona = fechaNacimiento.get(Calendar.YEAR)*10000 + fechaNacimiento.get(Calendar.MONTH)*100 + fechaNacimiento.get(Calendar.DATE);
		Integer FechaActual = Hoy.get(Calendar.YEAR)*10000 + Hoy.get(Calendar.MONTH)*100 + Hoy.get(Calendar.DATE);
		Integer Edad = ((FechaActual - FechaPersona)/10000); 
		return Edad.intValue(); 
	}
	
	public String ToString() {
		return nombre + " - " + documento;
	}

	public void AgregarInscripcion(Alumno oAlumno) {
		this.inscripciones.add( oAlumno );		
	}
	
	public void CrearPassword(String password) {
		if(this.password == null) {
			String claveEncriptada = StringMD.getStringMessageDigest(password, StringMD.SHA256);
			this.password = claveEncriptada;
		}
		
	}
	
	public Boolean validarPassword(String clave) {
		Boolean respuesta = false; 
		String claveEncriptada = StringMD.getStringMessageDigest(clave, StringMD.SHA256);
		if(this.password.equals(claveEncriptada)) {
			respuesta = true;
		}
		return respuesta;
	}
	
}
