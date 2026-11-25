// PARTE 1

/****************************** SOLUCION PREVIA  *******************************/


// Por consola fiestita.agregarInvitado(ariel)
/********************************************************************************/

/*
class Presidenta2 {
  var aniosPresidenta = 0
  method brillo() = 100 + 5 * aniosPresidenta
}
class Sirena2 {
  var brillo = 60
  method brillo() = brillo
}
class Astronauta2 {
  var cantMisiones = 0
  method brillo() = 10 * cantMisiones
}
object alan2 {
  method brillo() = 1
}

class Barbie2 {
  method brillo() = 0
}
class Fiesta2 {
  const invitados = []
  method agregarInvitado(inv) {
  invitados.add(inv)
}
}

const ariel2 = new Sirena2(brillo=80)
const fiestita2 = new Fiesta2()


  2) V o F
    a. Verdadero
      La solucion actual, plantea que la Barbie no tenga una profesion, no existe atributo que la relacione con una profesion.
      Sumando que para las Barbies sin profesion, el metodo  brillo() debe dar 0.

    b) Falso
      La solucion actual, plantea a las profesiones y a las Barbies como algo completamente distintos.
      En caso de buscar una conexion, no deberia ser via "Herencia". Sino que las profesiones sean un objeto que se instancia en toda Barbie.
      Para agregar, de querer una barbie sin profesion creemos una profesion especial que de brillo() = 0.

    c) Falso
      En esta solucion no existe ninguna clase abstracta. Porque para que exista una clase abstracta esta debe tener metodos abstractos.
      Lo cual no tenemos en esta situacion. 
      Aclaración: 
      Los métodos abstractos se definen como un método común, pero sin cuerpo. 
      Luego, sus subclases pueden aportar su implementación particular.
    
    d) Falso
      No hay forma de que una Barbie cambie de profesion. Para hacerlo las profesiones deberian ser un atributo variable
      en las Barbies. Pero, actualmente son clases completamente distintas.

*/

// 3) 

// Creo clase Barbie
class Barbie {
  var property profesion = new SinProfesion()

  method brillo() {
    return profesion.brillo()
  }

  method cambiarProfesion(nuevaProfesion) {
    profesion = nuevaProfesion
  }

  method esFashion() {
    return self.brillo() > 0
  }
}

// Creo a Alan, lo importante que alan responda a sus metodos
object alan {
  method brillo() = 1
  method esFashion() = false
}

// Creo las Profesiones
class Profesion {
  method brillo()
}

// Creo las Profesiones
class SinProfesion inherits Profesion{
  override method brillo() = 0
}

// Creo las Presidentas
class Presidenta inherits Profesion{
  var property aniosPresidenta = 0

  override method brillo() = 100 + 5 * aniosPresidenta
}

// Creo las Sirenas
class Sirena inherits Profesion{
  var property brilloMaritimo
  override method brillo() = brilloMaritimo
}

// Creo las Astronautas
class Astronauta inherits Profesion{
  var property misionesCumplidas = 0
  
  override method brillo() = 10 * misionesCumplidas
}


const ari = new Barbie(profesion = new Sirena(brilloMaritimo = 80))
const fiestita1 = new Fiesta()

// PARTE 2

/*
  a) Falso.
    Que no acepte invitado es parte de la logica / alcance de mi programa. 
    No es un caso extraño o alejado de nuestro entorno. No hace fala aplicar excepciones.

  b) Verdadero.
    Para definir si esEpica() una fiesta, tenemos varias alternaticas mas declarativas que la que encontramos ahora.
    Buscamo el "que", no el "como" de la situacion actual. Los calculos o preguntas podemos delegar en otros modulos aparte.

  c) Verdadero.
    Sobre la solucion actual existen varias formas de agregar estos filtros de "admisión". 
    Como clases, las cuales sean alternativas/hijas de Fiesta, pero la condicion de invitar se modifica.
    Fiesta siempre aceptara un invitado, pero las demas aplicaran su logica propia.

*/

// 5)
// Creo clase Fiesta
class Fiesta {
  var property invitados = []

  method condicionFiesta(unInvitado) = true

  method invitar(unInvitado) {
    if(self.condicionFiesta(unInvitado))
    {
      invitados.add(unInvitado)
    }
  }

  method esEpica() {
    return invitados.all({i => i.brillo() > 50})
  }

  method tamanio() = invitados.size()
}

// Creo clase FiestaExclusive
class FiestaExclusive inherits Fiesta{
  var property brilloPedido

  override method condicionFiesta(unInvitado)  {
    return unInvitado.brillo() >= brilloPedido
  }
}

// Creo clase FiestaVip
class FiestaVip inherits Fiesta{
  override method condicionFiesta(unInvitado)  {
    return unInvitado.esFashion()
  }
}

// Creo clase FiestaCupo
class FiestaCupo inherits Fiesta{
  var property cupo

  override method condicionFiesta(unInvitado)  {
    return self.tamanio() < cupo
  }
}

// PARTE 3

// 6)
/*
  Verdadero, no deberia modificar el codigo existente, sus clases o logica.
  Unicamente he de crear una clase grupo que sea polimorfica con el resto de invitados, 
  de esa forma los metodos de fiesta los tratan por igual
*/

// 7)
class Grupo {
  var property integrantes = []

  method sumarIntegrante(integrante) {
    integrantes.add(integrante)
  }

  method sacarIntegrante(integrante) {
    integrantes.remove(integrante)
  }

  method brillo() {
    return integrantes.sum({i => i.brillo()}) * 2
  }

  method losFashions() {
    return integrantes.count({i => i.esFashion()})
  }

  method losNoFashion() {
    return integrantes.count({i => !i.esFashion()})
  }

  method gananLosFashion() {
    return self.losFashions() > self.losNoFashion()
  }

  method esFashion() {
    return self.gananLosFashion()
  }
}