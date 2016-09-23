app.service('tareasService', function($http) {
    this.findAll = function(callback) {
        $http.get('/tareas').then(callback);
    }

    this.update = function(tarea, callback) {
     	$http.put('/tareas/' + tarea.id, tarea).then(callback)
	}
});

