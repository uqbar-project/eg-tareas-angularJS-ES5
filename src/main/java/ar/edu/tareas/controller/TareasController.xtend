package ar.edu.tareas.controller

import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils

@Controller
class TareasController {

	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(TareasController, 9000)
	}

}
