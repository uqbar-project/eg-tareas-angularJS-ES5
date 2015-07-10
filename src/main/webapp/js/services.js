app.service('tareasService', function ($http) {

  this.findAll = function (callback, errorHandler) {
    $http.get('/tareas').success(callback).error(errorHandler);
  };

  this.update = function (tarea, callback, errorHandler) {
    $http.put('/tareas/' + tarea.id, tarea).success(callback).error(
      errorHandler);
  };

});


app.service('usuariosService', function ($http) {

  this.findAll = function (callback, errorHandler) {
    $http.get('/usuarios').success(callback).error(errorHandler);
  }

});