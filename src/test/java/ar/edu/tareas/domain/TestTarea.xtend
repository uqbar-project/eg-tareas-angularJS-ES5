package ar.edu.tareas.domain

import java.util.Date
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestTarea {
	
	Tarea tareaOk
	Tarea tareaPendiente 
	
	@Before
	def void init() {
		tareaOk = new Tarea("desarrollar test", new Date)
		tareaOk.porcentajeCumplimiento = 100
		tareaPendiente = new Tarea("ser feliz", new Date)
		tareaPendiente.porcentajeCumplimiento = 20
	}
	
	@Test
	def void testTareaCumplida() {
		Assert.assertFalse(tareaOk.estaPendiente)
		Assert.assertTrue(tareaOk.estaCumplida)	
	}
	
	@Test
	def void testTareaNoCumplida() {
		Assert.assertTrue(tareaPendiente.estaPendiente)
		Assert.assertFalse(tareaPendiente.estaCumplida)	
	}
	
}