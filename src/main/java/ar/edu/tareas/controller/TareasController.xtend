package ar.edu.tareas.controller

import ar.edu.tareas.domain.Tarea
import ar.edu.tareas.repos.RepoTareas
import ar.edu.tareas.repos.RepoUsuarios
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.tareas.xtrest.JSONPropertyUtils

@Controller
class TareasController {

	extension JSONUtils = new JSONUtils
	extension JSONPropertyUtils = new JSONPropertyUtils

	@Get("/tareas")
	def Result tareas() {
		val tareas = RepoTareas.instance.allInstances //tareasPendientes
		response.contentType = ContentType.APPLICATION_JSON
		ok(tareas.toJson)
	}

	@Get('/tareas/:id')
	def Result tarea() {
		response.contentType = "application/json"
		val iId = Integer.valueOf(id)
		try {
			ok(RepoTareas.instance.searchById(iId).toJson)
		} catch (UserException e) {
			notFound("No existe la tarea con id " + id + "");
		}
	}

	@Get('/tareas/search')
	def Result buscar(String descripcion) {
		val tareaBusqueda = new Tarea
		tareaBusqueda.descripcion = descripcion
		ok(RepoTareas.instance.searchByExample(tareaBusqueda).toJson)
	}

	@Put('/tareas/:id')
	def Result actualizar(@Body String body) {
		try {
			//if (true) throw new RuntimeException("ACHALAY")
			val actualizado = body.fromJson(Tarea)

			val asignadoA = body.getPropertyValue("asignadoA")
			val asignatario = RepoUsuarios.instance.allInstances.findFirst[it.nombre.equalsIgnoreCase(asignadoA)]
			actualizado.asignarA(asignatario)

			if (Integer.parseInt(id) != actualizado.id) {
				return badRequest('{ "error" : "Id en URL distinto del cuerpo" }')
			}

			RepoTareas.instance.update(actualizado)
			ok('{ "status" : "OK" }');
		} catch (Exception e) {
			badRequest(e.message)
		}
	}

	@Get("/usuarios")
	def Result usuarios() {
		val usuarios = RepoUsuarios.instance.allInstances
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}

	def static void main(String[] args) {
		XTRest.start(TareasController, 9000)
	}

}
