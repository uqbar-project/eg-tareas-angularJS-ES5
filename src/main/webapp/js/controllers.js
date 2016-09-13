app.controller('TareasController', function(tareasService) {
	var self = this;

	function transformarATarea(jsonTarea) {
		return Tarea.asTarea(jsonTarea);
	}

	// TRAER LAS TAREAS - nueva función
	this.getTareas = function () {
		tareasService.findAll(function (response) {
		    self.tareas = _.map(response.data, transformarATarea);
        });
    }

	this.cumplir = function(tarea) {
	    tarea.cumplir();
	    tareasService.update(tarea, function() {
	        self.getTareas();
	    });
	}

	this.getTareas();
});