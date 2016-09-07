package ar.edu.tareas.repos

import ar.edu.tareas.domain.Tarea
import ar.edu.tareas.domain.Usuario
import java.util.Date
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo

class RepoTareas extends CollectionBasedRepo<Tarea> {

	RepoUsuarios repoUsuario

	/* Singleton */
	static RepoTareas repoTareas

	def static RepoTareas getInstance() {
		if (RepoTareas.repoTareas == null) {
			RepoTareas.repoTareas = new RepoTareas
		}
		RepoTareas.repoTareas
	}

	private new() {
		repoUsuario = RepoUsuarios.instance
		this.crearTarea("Desarrollar componente de envio de mails", "Marcos Pavelek", new Date(), "Iteración 1", 0)
		this.crearTarea("Implementar single sign on desde la extranet", null, new Date(9, 9, 114), "Iteración 1", 76)
		this.crearTarea("Cancelar pedidos que esten pendientes desde hace 2 meses", "Rodrigo Grisolia", new Date(3, 2, 115),
			"Iteración 1", 22)
		this.crearTarea("Mostrar info del pedido cuando esta finalizado", null, new Date(8, 10, 114), "Iteración 2", 90)
	}

	def crearTarea(String unaDescripcion, String responsable, Date date, String unaIteracion, int cumplimiento) {
		new Tarea => [
			if (responsable != null) {
				asignatario = repoUsuario.searchByExample(new Usuario(responsable)).get(0)
			}
			descripcion = unaDescripcion
			if (date == null) {
				fecha = new Date
			} else {
				fecha = date
			}
			iteracion = unaIteracion
			porcentajeCumplimiento = cumplimiento
			this.create(it)
		]
	}

	override protected Predicate<Tarea> getCriterio(Tarea example) {
		new Predicate<Tarea> {

			override evaluate(Tarea tarea) {
				example.descripcion.contains(tarea.descripcion)
			}

		}
	}

	override createExample() {
		new Tarea
	}

	override getEntityType() {
		typeof(Tarea)
	}

	def tareasPendientes() {
		allInstances.filter [ it.estaPendiente ].toList
	}

}
