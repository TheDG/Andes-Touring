# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
include ActionView::Helpers::AssetUrlHelper

p 'Destroying all'

Comment.delete_all
SkiRoute.delete_all
User.delete_all
Picture.delete_all

p 'User'

User.create!(email: 'admin@admin.cl', full_name: 'Admin',
                      password: 123123, password_confirmation: 123123)

p 'Ski Routes'

portillo = SkiRoute.create!(
  user: User.first,
  title: 'Portillo – Super C',
  intro: 'Clásico chute de portillo, los patrullas del centro de esquí podrán entregar información acerca de las condiciones actuales en la línea y la subida.',
  distance: nil,
  vert: 600,
  time: 2.5,
  aspect: '',
  dificulty: 8,
  route_description: "Si no se quiere pagar ticket se parte subiendo desde el estacionamiento de portillo hasta arriba del andarivel de la roca jack (400 vert), luego seguir 477 vert aprox hasta un traverse expuesto a la izquierda.
  En el traverse se recomienda tener crampones y piolet por seguridad ya que una caída ahí probablemente sea fatal.
  Pasado el traverse hay que patear unos 200 vert más por el chute expuesto para llegar arriba de la super c.
  Idealmente coordinar con alguien que los recoja en la calle abajo de la super c para poderla esquiar completa y no tener que traversear para volver al estacionamiento.",
  location: 'Portillo',
  sector: 'valpo'
)
file = open('https://s3-sa-east-1.amazonaws.com/andes-touring/Pictures/super_c.jpg')
portillo.avatar.attach(io: file, filename: 'avatar.jpg')

3.times do |i|
  pic = Picture.create!(ski_route_id: portillo.id)
  file = File.open(Rails.root.join('app', 'assets', 'images', 'super_c', "#{i}.jpg"))
  pic.image.attach(io: file, filename: "img#{i}")
end

pic = Picture.create!(ski_route_id: portillo.id, description: "Traverse")
file = File.open(Rails.root.join('app', 'assets', 'images', 'super_c', "4.jpg"))
pic.image.attach(io: file, filename: "img4")

pic = Picture.create!(ski_route_id: portillo.id, description: "Traverse")
file = File.open(Rails.root.join('app', 'assets', 'images', 'super_c', "5.jpg"))
pic.image.attach(io: file, filename: "img5")

"-----"

parva = SkiRoute.create!(
  user: User.first,
  title: 'Anfiteatro Cerro Parva',
  intro: 'Clasico de Clasicos, el inicio de muchos de la zona central.',
  distance: nil,
  vert: 435,
  time: 2,
  aspect: 'S',
  dificulty: 4,
  route_description: "1) Si no se quiere pagar ticket se debe randonear desde los estacionamientos de La Parva, El Colorado o Valle Nevado hasta la laguna de Piuquenes (740 vert aprox).
  Luego se debe seguir el filo que llega al falsa parva hasta la cumbre (235 vert), la bajada más fácil del anfiteatro es la misma cara por la que se subió hasta este punto pero también hay bajadas con más pendiente hacia el sur de la subida.
  <br> 2) Pasando el falsa parva, si se sigue avanzando en el anfiteatro se pasarán varios chutes entre los cuales se encuentra el “chute principal del parva” hacia el sur del cerro parva (200 vert).
  <br> 3) Finalmente hay líneas hacia el este del parva, en las cuales hay hacer un pequeño traverse para bajar la segunda parte que vuelve al sector de la laguna de piuquenes.
  ".html_safe,
  location: 'La-Parva',
  sector: 'rm'
)
file = open('https://s3-sa-east-1.amazonaws.com/andes-touring/Pictures/parva.jpg')
parva.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: parva.id, description: "Subida Principal")
file = File.open(Rails.root.join('app', 'assets', 'images', 'parva', "0.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: parva.id, description: "Chute Principal")
file = File.open(Rails.root.join('app', 'assets', 'images', 'parva', "1.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: parva.id, description: "Lineas hacia el este")
file = File.open(Rails.root.join('app', 'assets', 'images', 'parva', "2.jpg"))
pic.image.attach(io: file, filename: "img2")

"---"

yeso = SkiRoute.create!(
  user: User.first,
  title: 'Cajón del Maipo – Embalse el Yeso',
  intro: 'Cerca de Santiago, una infinidad de lineas. El acceso en auto a estas puede ser muy complicado los fines de semana ya que el camino colapsa con la cantidad de turistas que lo visitan.
  Datos depende de cumbre a subir, los mostrados son los minimos',
  distance: nil,
  vert: 200,
  time: 1.5,
  aspect: '',
  dificulty: 6,
  route_description: "1) Una ruta clásica en el embalse parte estacionándose justo antes de la última cuesta al embalse (No estacionarse en la cuesta o a orillas del embalse ya que estorba el tránsito vehicular), subir caminando hasta la represa del embalse y luego cruzarla siguiendo el camino que bordea el agua (hay que saltar varios cercos en las orillas del lago, esta ruta pasa por propiedad privada por lo que es posible ser expulsado del lugar).
  Ver Foto ENTRADA
  <br> 2) Al acabarse el camino subir el roquerio a la izquierda para llegar al punto en el que se ve la subida.
  Ver FOTO ENLANCE
  <br>
  3) Desde la base, dependiendo de las condiciones elegir el punto más adecuado para subir, El que se muestra en la foto es por donde usualmente se sube pero no necesariamente es el mejor.
  VER FOTO ASCENSO
  <br>
  4) Una vez en el filo se pueden ver las dos lagunas, desde ahi subir por el filo hasta donde se quiera esquiar
  Se puede bajar por líneas desde 200 vert hasta más de 1000 vert, pero para esquiadores intermedios lo mas recomendado es bajar por la misma que subieron ya que de no haber inspeccionado bien la cara desde abajo podrían terminar atrapados sobre algún acantilado.
  ".html_safe,
  location: 'LagunillasSkiCenter',
  sector: 'rm'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "avatar.jpg"))
yeso.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: yeso.id, description: "ENTRADA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "entrada.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: yeso.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "enlace.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: yeso.id, description: "ASCENSO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "ascenso.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: yeso.id, description: "Vista desde el filo")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "top.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: yeso.id, description: "Linea de 1000 Vert")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "1000vert.jpg"))
pic.image.attach(io: file, filename: "img4")

pic = Picture.create!(ski_route_id: yeso.id, description: "Distancia y desnivel desde el auto a la base de las líneas")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cajon', "unnamed.jpg"))
pic.image.attach(io: file, filename: "img5")

"-----"

damas = SkiRoute.create!(
  user: User.first,
  title: 'Paso las Damas',
  intro: 'Ski + Camping. El acceso al paso es complicado debido a que no está habilitado, y el permiso hay que conseguirlo con privados (Se puede probar suerte contactando al  Parque outdoor valle lo mancilla).',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: 'N',
  dificulty: 5,
  route_description: "1) Una vez conseguida la autorización, se va en dirección a las termas del flaco, pero manteniéndose en todo momento a la derecha del río tinguiririca.
  <br> 2) Pasado las termas del flaco (se ven al otro lado del río), después de atravesar el túnel, ya puede comenzar la nieve en el camino, en el momento que ya no se pueda seguir en auto se debe estacionar (sin obstruir el camino ya que a veces pasan maquinas) y seguir randoneando.
  <br> 3) En la bifurcación que se separa hacia argentina tomar la izquierda y seguir hasta el río para armar campamento.
  <br> 4) Desde el campamento se puede acceder a una gran cantidad de líneas, pero el recorrido más clásico es cruzando el río se sube hacia el noroeste y luego hasta la cara al norte.
  <br> 5) Desde ahí se pueden elegir líneas para todos los niveles, siendo la más fácil por la que se subió, y la más difícil la que está pintada en azul (Ver foto LINEAS).
  ".html_safe,
  location: nil,
  sector: 'higgins'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "avatar.jpg"))
damas.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: damas.id, description: "ENTRADA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "entrada.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: damas.id, description: "Campamento Base")
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "camp.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: damas.id, description: "LINEAS")
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "lineas.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: damas.id, description: "Vista Aerea")
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "aereo.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: damas.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "avatar.jpg"))
pic.image.attach(io: file, filename: "img4")

pic = Picture.create!(ski_route_id: damas.id, description: "Distancia y desnivel")
file = File.open(Rails.root.join('app', 'assets', 'images', 'damas', "vert.jpg"))
pic.image.attach(io: file, filename: "img5")

"------"

vergara1 = SkiRoute.create!(
  user: User.first,
  title: 'Paso Vergara - Zona 1',
  intro: 'Anfiteatro de spines principal del lugar.
  Su orientación la hace conservar buenas condiciones de nieve.
  La cara es posible esquiarla casi por completo',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: 'S',
  dificulty: 6,
  route_description: "1)En GOOGLE MAPS buscar: “Paso Vergara, Mendoza, Argentina”.
  Seguir indicaciones hasta la salida correspondiente cerca de Curicó (al venir por el norte salir en LA MONTAÑA)
  <br> 2) Recorrer dos horas y media hacia la cordillera por camino de tierra en muy buen estado.
  <br> 3) Antes de llegar a la aduana, salir del camino hacia la derecha como indica la foto ACCESO
  Dependiendo de las condiciones, en este punto se hace NECESARIO 4x4/CADENAS por el estado del camino.
  <br> 4) Si no ha habido nevadas recientes, la primera parte hasta el punto (VRG) ESTACIONAMIENTO no se hace tan complicada.
  * Si no se quiere usar este camino, la caminata se hace extremadamente larga hasta la zona esquiable. Ver foto ENLACE.
  <br> Subir hasta el punto '(VRG) ESTACIONAMIENTO' marcado en la foto ENLACE. Son 30-40 minutos desde '(VRG) SALIDA'.
  <br> 5) Acceso es por la parte lateral izquierda del cerro. Ver foto VISTA AEREA
  ".html_safe,
  location: 'AltodelPadre',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "avatar.jpg"))
vergara1.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: vergara1.id, description: "Vista Frontal")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "avatar.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: vergara1.id, description: "ACCESO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "access.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: vergara1.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "enlace.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: vergara1.id, description: "VISTA AEREA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "aereo.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: vergara1.id, description: "Perfil de elevación desde la base hasta la cumbre")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "elevation.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

vergara2 = SkiRoute.create!(
  user: User.first,
  title: 'Paso Vergara - Zona 8',
  intro: 'A la derecha del anfiteatro principal.
  Las spines cambian de orientación a Sur-Este. Aumenta la pendiente, pasando a ser una zona de alta dificultad.
  Con trampas de terreno en casi toda la zona, se deben evaluar exhaustivamente las condiciones de estabilidad de la nieve.',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: 'SE',
  dificulty: 8,
  route_description: "1)En GOOGLE MAPS buscar: “Paso Vergara, Mendoza, Argentina”.
  Seguir indicaciones hasta la salida correspondiente cerca de Curicó (al venir por el norte salir en LA MONTAÑA)
  <br> 2) Recorrer dos horas y media hacia la cordillera por camino de tierra en muy buen estado.
  <br> 3) Antes de llegar a la aduana, salir del camino hacia la derecha como indica la foto ACCESO
  Dependiendo de las condiciones, en este punto se hace NECESARIO 4x4/CADENAS por el estado del camino.
  <br> 4) Si no ha habido nevadas recientes, la primera parte hasta el punto (VRG) ESTACIONAMIENTO no se hace tan complicada.
  * Si no se quiere usar este camino, la caminata se hace extremadamente larga hasta la zona esquiable. Ver foto ENLACE.
  <br> Subir hasta el punto '(VRG) ESTACIONAMIENTO' marcado en la foto ENLACE. Son 30-40 minutos desde '(VRG) SALIDA'.
  <br> 5) Acceso es por la parte lateral izquierda del cerro. Ver foto VISTA AEREA
  ".html_safe,
  location: 'AltodelPadre',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "avatar.jpg"))
vergara2.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: vergara2.id, description: "Vista Frontal")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "avatar.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: vergara2.id, description: "ACCESO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "access.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: vergara2.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "enlace.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: vergara2.id, description: "VISTA AEREA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "aereo.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: vergara2.id, description: "Perfil de elevación desde la base hasta la cumbre")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "elevation.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

vergara3 = SkiRoute.create!(
  user: User.first,
  title: 'Paso Vergara - Zona 3',
  intro: 'Atras a la izquierda del anfiteatro principal.
  Las spines cambian de orientación a Sur-Oeste.
  Una opción de facil acceso. Con pocos obstáculos y nieve medianamente regular es una buena opción para grupos con todos los niveles.',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: 'SW',
  dificulty: 5,
  route_description: "1)En GOOGLE MAPS buscar: “Paso Vergara, Mendoza, Argentina”.
  Seguir indicaciones hasta la salida correspondiente cerca de Curicó (al venir por el norte salir en LA MONTAÑA)
  <br> 2) Recorrer dos horas y media hacia la cordillera por camino de tierra en muy buen estado.
  <br> 3) Antes de llegar a la aduana, salir del camino hacia la derecha como indica la foto ACCESO
  Dependiendo de las condiciones, en este punto se hace NECESARIO 4x4/CADENAS por el estado del camino.
  <br> 4) Si no ha habido nevadas recientes, la primera parte hasta el punto (VRG) ESTACIONAMIENTO no se hace tan complicada.
  * Si no se quiere usar este camino, la caminata se hace extremadamente larga hasta la zona esquiable. Ver foto ENLACE.
  <br> Subir hasta el punto '(VRG) ESTACIONAMIENTO' marcado en la foto ENLACE. Son 30-40 minutos desde '(VRG) SALIDA'.
  <br> 5) Acceso es por la misma cara (línea amarilla) o bien llegando al final del valle y entrando por arriba. Ver foto VISTA AEREA
  ".html_safe,
  location: 'AltodelPadre',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "avatar.jpg"))
vergara3.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: vergara3.id, description: "Vista Frontal")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "avatar.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: vergara3.id, description: "ACCESO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "access.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: vergara3.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "enlace.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: vergara3.id, description: "VISTA AEREA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "aereo.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: vergara3.id, description: "Perfil de elevación desde la base hasta la cumbre")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara', "elevation.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

vergara4 = SkiRoute.create!(
  user: User.first,
  title: 'Paso Vergara - Chutes',
  intro: 'Líneas de mediana / alta dificultad, con fácil acceso por por detrás de los chutes',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: 'SE',
  dificulty: 7,
  route_description: "1)En GOOGLE MAPS buscar: “Paso Vergara, Mendoza, Argentina”.
  Seguir indicaciones hasta la salida correspondiente cerca de Curicó (al venir por el norte salir en LA MONTAÑA)
  <br> 2) Recorrer dos horas y media hacia la cordillera por camino de tierra en muy buen estado.
  <br> 3) Antes de llegar a la aduana, salir del camino hacia la derecha como indica la foto ACCESO
  Dependiendo de las condiciones, en este punto se hace NECESARIO 4x4/CADENAS por el estado del camino.
  <br> 4) Si no ha habido nevadas recientes, la primera parte hasta el punto (VRG) ESTACIONAMIENTO no se hace tan complicada.
  * Si no se quiere usar este camino, la caminata se hace extremadamente larga hasta la zona esquiable. Ver foto ENLACE.
  <br> Subir hasta el punto '(VRG) ESTACIONAMIENTO' marcado en la foto ENLACE. Son 30-40 minutos desde '(VRG) SALIDA'.
  <br> 5) Acceso es por la misma cara (línea roja) o bien subiendo por detrás(linea amarilla). Ver foto VISTA AEREA
  ".html_safe,
  location: 'AltodelPadre',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "avatar.jpg"))
vergara4.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: vergara4.id, description: "Vista Frontal")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "frontal.jpg"))
pic.image.attach(io: file, filename: "img0")

pic = Picture.create!(ski_route_id: vergara4.id, description: "Vista Frontal Cercana")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "avatar.jpg"))
pic.image.attach(io: file, filename: "img0.1")

pic = Picture.create!(ski_route_id: vergara4.id, description: "ACCESO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "access.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: vergara4.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "enlace.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: vergara4.id, description: "VISTA AEREA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "aereo.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: vergara4.id, description: "Perfil de elevación desde la base hasta la cumbre")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergaraC', "elevation.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

vergara5 = SkiRoute.create!(
  user: User.first,
  title: 'Paso Vergara - Lagunas de Teno',
  intro: 'Líneas con una buena vista a las lagunas de Teno.
  Con pendientes más amigables y terreno bastante regular, es una buena opción para grupos con nivel principiante-medio.
  Su orientación la hacen mantener muy bien la nieve. Por esta razón, se puede venir a esquiar sin problemas en octubre, noviembre y hasta diciembre.
  El ascenso es medianamente corto.
',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: 'S',
  dificulty: 7,
  route_description: "1)En GOOGLE MAPS buscar: “Paso Vergara, Mendoza, Argentina”.
  Seguir indicaciones hasta la salida correspondiente cerca de Curicó (al venir por el norte salir en LA MONTAÑA)
  <br> 2) Recorrer dos horas y media hacia la cordillera por camino de tierra en muy buen estado.
  <br> 3) Antes de llegar a la aduana, salir del camino hacia la derecha como indica la foto ACCESO
  Dependiendo de las condiciones, en este punto se hace NECESARIO 4x4/CADENAS por el estado del camino.
  <br> 4) Si no ha habido nevadas recientes, la primera parte hasta el punto (VRG) ESTACIONAMIENTO no se hace tan complicada.
  * Si no se quiere usar este camino, la caminata se hace extremadamente larga hasta la zona esquiable. Ver foto ENLACE.
  <br> Subir hasta el punto '(VRG) ESTACIONAMIENTO' marcado en la foto ENLACE. Son 30-40 minutos desde '(VRG) SALIDA'.
  <br> 5) Seguir por el camino hasta que donde se pueda (en invierno se tapa con nieve - se especifica con el punto “(VRG) LINEA DE NIEVE” donde generalmente no se puede seguir con el auto en invierno).
  Encontrar un buen estacionamiento y seguir por el camino randoniando o caminando.
  Por camino con poca pendiente (con algunas pasadas más complicadas), en 45-60 minutos se llega a las Lagunas de Teno. Ver foto ENLACE2
  <br> 5) El ascenso es medianamente corto y se hace por la misma cara. Ver foto VISTA AEREA
  <br> 6) Si se quiere ir a la parte derecha se asciende por la cara izquierda y se cruza por arriba.

  ".html_safe,
  location: 'AltodelPadre',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara5', "avatar.jpg"))
vergara5.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: vergara5.id, description: "ACCESO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara5', "access.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: vergara5.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara5', "enlace.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: vergara5.id, description: "ENLACE2")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara5', "enlace2.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: vergara5.id, description: "VISTA AEREA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara5', "aereo.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: vergara5.id, description: "Chute visto desde abajo")
file = File.open(Rails.root.join('app', 'assets', 'images', 'vergara5', "chute.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

maule  = SkiRoute.create!(
  user: User.first,
  title: 'Paso Pehuenche – Laguna del Maule',
  intro: 'El paso pehuenche es uno de los lugares más amigables de chile para esquiar ya que el camino llega justo a la base de la mayoría de las líneas por lo que en general no es necesario una gran aproximación y porque no se necesita ninguna autorización previa.
  Lo único que hay que tener en cuenta (si se quiere esquiar a la altura de la laguna) es que se cruza la aduana chilena por lo que se debe tener los papeles del auto y carnet de identidad.
  ',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: '',
  dificulty: 4,
  route_description: "1)En GOOGLE MAPS buscar: “Paso Pehuenche, Mendoza, Argentina”.
  <br> 2)Frente a la laguna hay líneas para todos los niveles y de fácil acceso, de haber poca nieve a esa altura se puede seguir hasta la frontera donde el camino llega a su máxima altura.
  La altura de este lugar junto con sus altas precipitaciones promedio hacen que en general sea de los lugares con más nieve en los andes durante toda la temporada.
  <br> 3) El único problema con el paso pehuenche es que se cierra el camino cuando hay tormentas o ha caído mucha nieve recientemente.
  En ese caso dependiendo de hasta adonde deje pasar carabineros hay varias otras opciones para esquiar:
  <br> 4) Si cortan en la aduana se pueden esquiar Las caras que caen hacia el proyecto hidroeléctrico de lo Aguirre, en donde también hay una gran variedad de terreno para todos los niveles.
  <br> 5) En caso que cierren antes de la cuesta a lo Aguirre, se puede esquiar en los cerros que caen a los baños del campanario, siendo posible terminar el día en las termas.
  ".html_safe,
  location: '',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'maule', "avatar.jpg"))
maule.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: maule.id, description: "Zonas en Lo Aguirre")
file = File.open(Rails.root.join('app', 'assets', 'images', 'maule', "lo_aguirre.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: maule.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'maule', "p1.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: maule.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'maule', "p2.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: maule.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'maule', "avatar.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

guaiquivilo  = SkiRoute.create!(
  user: User.first,
  title: 'Paso Pehuenche – Guaiquivilo',
  intro: 'Al estar a una altura bastante baja (la mayoría de las líneas se encuentran alrededor de los 1900 metros), en general presenta mejores condiciones en pleno invierno cuando las temperaturas se mantienen más bajas. Idealmente ir cuando haya nevado bajo los 1600 metros y este relativamente frío.
  Para acceder se debe haber contactado previamente al parque guaiquivilo http://parqueguaiquivilo.cl/ , si no se tiene 4x4 hay que coordinar con el parque para que los suba en el vehículo todoterreno que tienen ya que hay que subir una cuesta empinada y un camino que con nieve requiere de un“jeepeo” fuerte
  ',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: '',
  dificulty: 5,
  route_description: "1)En GOOGLE MAPS buscar: “Parque Guaiquivilo, Colbun, Región del Maule.
  <br> 2) Idealmente poner el campamento justo antes de donde el camino sale del bosque (1700 mts aprox), para que sea más fácil llegar a las distintas líneas del parque. Ver foto VISTA AEREA
  <br> 3) Cerca del camino se ven varias zonas fáciles/intermedias para testear las condiciones, si se quiere esquiar las líneas más empinadas (de haber las condiciones de estabilidad necesarias) hay que seguir el camino hasta su punto más alto, luego seguir el filo a la izquierda del camino hasta el punto donde se quiera esquiar.
  <br> 4) Para salir del cajón de atrás hay que subir donde empiezan los árboles  hasta volver al sector del camino.
  ".html_safe,
  location: '',
  sector: 'maule'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'guai', "front.jpg"))
guaiquivilo.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: guaiquivilo.id, description: "VISTA AEREA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'guai', "aereo.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: guaiquivilo.id, description: "El Laberinto")
file = File.open(Rails.root.join('app', 'assets', 'images', 'guai', "lab.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: guaiquivilo.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'guai', "front.jpg"))
pic.image.attach(io: file, filename: "img3")

"-----"

shangrila  = SkiRoute.create!(
  user: User.first,
  title: 'Chillán - Shangrila',
  intro: 'Las líneas en shangrila están a muy baja altura por lo que solo es recomendable ir cuando haya nevado bajo (menos de 1500 metros) y no haya hecho calor.
  ',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: '',
  dificulty: 7,
  route_description: "1) Hoy en día solo se puede llegar en auto hasta el estacionamiento del ecoparque Shangrila, desde ahí hay que seguir el camino hasta donde se cruza un portal de roca en su punto más alto. Ver foto ENLACE
  <br> 2) La subida más típica es pasado las rocas a la derecha, cruzando un pedazo de roca volcánica, cruzando el pequeño río y siguiendo por el filo hasta la cumbre. Ver Foto SUBIDA
  <br> 3) Desde ahí se puede caminar por el filo y elegir entre los diversos puntos para bajar.
  ".html_safe,
  location: 'Chillan',
  sector: 'bio'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'shangrila', "avatar.jpg"))
shangrila.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: shangrila.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'shangrila', "enlace.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: shangrila.id, description: "SUBIDA")
file = File.open(Rails.root.join('app', 'assets', 'images', 'shangrila', "subida.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: shangrila.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'shangrila', "front.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: shangrila.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'shangrila', "avatar.jpg"))
pic.image.attach(io: file, filename: "img4")

"-----"

arauco  = SkiRoute.create!(
  user: User.first,
  title: 'Araucanía - Camino a Galletue',
  intro: '',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: '',
  dificulty: 4,
  route_description: "1) Desde el pueblo de sierra nevada tomar el camino directo hacia la laguna galletue, en su punto más alto (1345m, a 19 km aprox de sierra nevada) se deja el auto para comenzar caminando por un portón a la derecha del camino. Ver foto ENLACE1 y ENLACE2
  <br> 2) Seguir el camino por unos 1800 mts aprox, atravesando un pequeño claro donde se pueden ver las líneas. Ver foto ENLACE3
  <br> 3) Desde ahí se debe comenzar a avanzar hacia el norte por el bosque, cruzando un río y subiendo hasta salir del bosque (puede ser útil tener algún dispositivo gps si no se tiene buena orientación en bosques).
  una vez arriba seguir el filo hasta donde se quiera bajar, estando las opciones más fáciles en la zona este del cerro. Ver foto ASCENSO
  ".html_safe,
  location: 'Lonquimay',
  sector: 'arauca'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "avatar.jpg"))
arauco.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: arauco.id, description: "ENLACE1")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "enlace.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: arauco.id, description: "ENLACE2")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "enlace2.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: arauco.id, description: "ENLACE3")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "enlace3.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: arauco.id, description: "Vista lineas desde el claro")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "claro.jpg"))
pic.image.attach(io: file, filename: "img4")

pic = Picture.create!(ski_route_id: arauco.id, description: "ASCENSO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "ascenso.jpg"))
pic.image.attach(io: file, filename: "img5")

pic = Picture.create!(ski_route_id: arauco.id, description: "Perfil de elevación desde el auto")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "elevation.jpg"))
pic.image.attach(io: file, filename: "img6")

pic = Picture.create!(ski_route_id: arauco.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "front.jpg"))
pic.image.attach(io: file, filename: "img7")

pic = Picture.create!(ski_route_id: arauco.id, description: "Vista desde arriba del anfiteatro hacia el filo por el que se sube")
file = File.open(Rails.root.join('app', 'assets', 'images', 'arauco', "avatar.jpg"))
pic.image.attach(io: file, filename: "img7")

"-----"

custodio  = SkiRoute.create!(
  user: User.first,
  title: 'Portezuelo Ibañez(Chute custodio)',
  intro: 'Esta es de las líneas más largas que se pueden bajar en el Portezuelo Ibañez.',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: '',
  dificulty: 4,
  route_description: "1) Desde el auto (justo antes de la cuesta a villa cerro castillo) hay que atravesar el bosque (bien empinado, rodeando rocas para no tener que escalar), luego travesear a la izquierda hasta la base del chute. Ver foto ENLACE
  <br> 2) Si la visibilidad es mala es recomendable patear por el chute directo para arriba
  <br> 2.5) De haber buena visibilidad seguir randoneando por el cajón para arriba. Ver foto ASCENSO
  <br> 3) Luego subir a la cumbre (las líneas más fáciles son de ahi mismo devuelta al cajón). Ver foto ASCENSO
  <br> 4) Seguir el filo hasta la cumbre del custodio donde se encuentra el chute. Ver foto ASCENSO
  ".html_safe,
  location: 'ElFraile',
  sector: 'aysen'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'custodio', "avatar.jpg"))
custodio.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: custodio.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'custodio', "enlace.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: custodio.id, description: "ASCENSO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'custodio', "ascenso.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: custodio.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'custodio', "run.jpg"))
pic.image.attach(io: file, filename: "img3")

"-----"

cofre  = SkiRoute.create!(
  user: User.first,
  title: 'Portezuelo Cofre',
  intro: 'Esta es de las líneas más largas que se pueden bajar en el Portezuelo Ibañez.',
  distance: nil,
  vert: nil,
  time: nil,
  aspect: '',
  dificulty: 4,
  route_description: "1) El portezuelo cofre se ubica en el camino entre cerro castillo y puerto tranquilo.
  Pasado la laguna cofre (desde cerro castillo), en el punto más alto del camino se deja el auto y se atraviesa el bosque a la derecha del camino por la linea de menos vegetación. Ver foto ENTRADA y ENLACE
  <br> 2) Luego subir bordeando el río hasta donde se quiera esquiar (siendo lo más fácil bajar esquiando junto al río). Ver foto ASCENSO
  <br> 2.5) En pleno invierno es posible esquiar pillows subiendo la cara a la izquierda del río.
  ".html_safe,
  location: 'ElFraile',
  sector: 'aysen'
)
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "avatar.jpg"))
cofre.avatar.attach(io: file, filename: 'avatar.jpg')

pic = Picture.create!(ski_route_id: cofre.id, description: "ENTRADA: Subida desde el camino")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "entrada.jpg"))
pic.image.attach(io: file, filename: "img1")

pic = Picture.create!(ski_route_id: cofre.id, description: "ENLACE")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "enlace.jpg"))
pic.image.attach(io: file, filename: "img2")

pic = Picture.create!(ski_route_id: cofre.id, description: "ASCENSO")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "ascenso.jpg"))
pic.image.attach(io: file, filename: "img3")

pic = Picture.create!(ski_route_id: cofre.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "avatar.jpg"))
pic.image.attach(io: file, filename: "img4")

pic = Picture.create!(ski_route_id: cofre.id, description: "Pillows")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "pillows.jpg"))
pic.image.attach(io: file, filename: "img5")

pic = Picture.create!(ski_route_id: cofre.id, description: "")
file = File.open(Rails.root.join('app', 'assets', 'images', 'cofre', "p1.jpg"))
pic.image.attach(io: file, filename: "img6")
