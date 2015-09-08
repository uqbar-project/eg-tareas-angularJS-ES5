app.service('tareasService', function ($http) {

  this.findAll = function (callback, errorHandler) {
    $http.get('/tareas').then(callback, errorHandler);
  };

  this.update = function (tarea, callback, errorHandler) {
    $http.put('/tareas/' + tarea.id, tarea).then(callback, errorHandler);
  };

});


app.service('usuariosService', function ($http) {

  this.findAll = function (callback, errorHandler) {
    $http.get('/usuarios').then(callback, errorHandler);
  }

});
