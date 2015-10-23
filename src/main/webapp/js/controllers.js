app.controller('TareasController', function(tareasService) {

	var self = this;
	
	this.getTareas = function() {
	    tareasService.findAll(function(data) {
	    	self.tareas = _.map(data.data, Tarea.asTarea);
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

