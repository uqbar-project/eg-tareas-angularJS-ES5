package ar.edu.tareas.domain

import ar.edu.tareas.errors.BusinessException
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
class Tarea extends Entity {
	static int TAREA_COMPLETA = 100
	
	String descripcion
	String iteracion
	int porcentajeCumplimiento
	@JsonIgnore Usuario asignatario
	Date fecha
	
	new() {
		initialize()	
	}
	
	new(String descripcion, Date fecha) {
		initialize()
		this.descripcion = descripcion
		this.fecha = fecha	
	}
	
	def void initialize() {
		descripcion = ""
		iteracion = ""
		fecha = new Date
		porcentajeCumplimiento = 0	
	}
	
	def validar() {
		if (descripcion.equals("")) {
			throw new BusinessException("Debe ingresar descripcion")
		}
		if (fecha == null) {
			throw new BusinessException("Debe ingresar fecha")
		}
	}
	
	def estaCumplida() {
		porcentajeCumplimiento == TAREA_COMPLETA
	}
	
	def estaPendiente() {
		!estaCumplida
	}
	
	override toString() {
		descripcion
	}

	@JsonProperty("asignadoA")
	def String getAsignadoA() {
		if (asignatario == null) {
			return ""
		}
		asignatario.nombre
	}
	
	def asignarA(Usuario usuario) {
		this.asignatario = usuario
	}
	
}