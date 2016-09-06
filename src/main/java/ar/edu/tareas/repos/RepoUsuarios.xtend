package ar.edu.tareas.repos

import ar.edu.tareas.domain.Usuario
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo

class RepoUsuarios extends CollectionBasedRepo<Usuario> {

	/* Singleton */
	static RepoUsuarios repoUsuarios

	def static RepoUsuarios getInstance() {
		if (repoUsuarios == null) {
			repoUsuarios = new RepoUsuarios
		}
		repoUsuarios
	}

	new() {
		this.create(new Usuario("Fernando Dodino"))
		this.create(new Usuario("Rodrigo Grisolia"))
		this.create(new Usuario("Javier Casaubon"))
		this.create(new Usuario("Marcos Pavelek"))
	}

	override createExample() {
		new Usuario
	}

	override getEntityType() {
		typeof(Usuario)
	}

	override protected Predicate<Usuario> getCriterio(Usuario example) {
		new Predicate<Usuario> {

			override evaluate(Usuario usuario) {
				usuario.nombre.contains(example.nombre)
			}

		}
	}

}
