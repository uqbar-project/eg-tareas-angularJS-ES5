function Tarea() {

  this.asignadoA = null;
  this.fecha = new Date();
  this.descripcion = '';
  this.porcentajeCumplimiento = 0;

}

Tarea.prototype.cumplir = function () {
  this.porcentajeCumplimiento = 100;
}

Tarea.prototype.estaPendiente = function () {
  return this.porcentajeCumplimiento != 100;
}

Tarea.prototype.sePuedeCumplir = function () {
  return this.estaPendiente() && this.estaAsignada();
}

Tarea.prototype.estaAsignada = function () {
  return this.asignadoA != null && this.asignadoA !== '';
}

Tarea.asTarea = function (jsonTarea) {
  // funca pero no es lo que quiero this.__proto__ = Object.create(Tarea.prototype);
  // esto sí me gusta
  return angular.extend(new Tarea(), jsonTarea);
};

