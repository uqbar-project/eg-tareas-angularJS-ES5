'use strict';

app.controller('TareasController', function (tareasService, $timeout) {

  var self = this;

  self.errors = [];
  self.$timeout = $timeout;

  function notificarErrorTareas(infoError) {
  	notificarError(self, infoError);
  	self.getTareas();
  }

  function transformarATarea(jsonTarea) {
    return Tarea.asTarea(jsonTarea);
  }

  // TRAER LAS TAREAS
  this.getTareas = function () {
    tareasService.findAll(function (response) {
      self.tareas = _.map(response.data, transformarATarea);
    }, function() {
    	notificarError(self)
    });
  }

  // CUMPLIR TAREA
  this.cumplir = function (tarea) {
    tarea.cumplir();
    tareasService.update(tarea, function () {
      self.getTareas();
    }, notificarErrorTareas);
  }

  // FUNCIONES PARA ASIGNAR
  // Llamamos al popup de Tareas
  this.beginAsignar = function (tarea) {
    self.tareaSeleccionada = tarea;
  };

  // Se produce la asignación propiamente dicha
  this.asignar = function (asignatario) {
	self.tareaSeleccionada.asignadoA = asignatario;
    tareasService.update(self.tareaSeleccionada, function () {
      }, notificarError);
  };


  self.getTareas();
});


// TODO: Agendar que en realidad el cumplir tiene que ir antes de llamar al
// server
// Y si hay error tirar un getTareas() y a la lona.
// hay que armar
// 1) En el index.html el popup
// 2) En el controllers.js a) el beginAsignar que levanta el popup, b) nos
// traemos los asignatarios posibles,
// con lo cual hay que generar oooootro service, y tambien en el server un
// AsignatarioController,
// porque asi funciona REST.
// armar una directiva para el combo de asignatarios
