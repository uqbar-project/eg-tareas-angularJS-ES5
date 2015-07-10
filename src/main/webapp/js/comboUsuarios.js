'use strict';

app.directive('comboUsuarios', function () {
  return {
    restrict: 'E',
    templateUrl: 'templates/asignar_usuarios.html',
    controllerAs: 'usuariosCtrl',
    bindToController: true,
    scope: {
      callback: "&",
      tarea: "="
    },
    controller: function (usuariosService) {
      var self = this;
      this.asignatario = null;
      this.asignar = this.callback();
      this.asignatariosPosibles = [];

      usuariosService.findAll(function (data) {
        self.asignatariosPosibles = data;
      }, function () {
        self.errors.push(mensaje);
      });
    }

  };
});
