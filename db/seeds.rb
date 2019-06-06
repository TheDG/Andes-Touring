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
