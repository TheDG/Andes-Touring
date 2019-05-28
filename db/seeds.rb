# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Destroying all'

SkiRoute.delete_all
User.delete_all

p 'User'

User.create!(email: 'admin@admin.cl', full_name: 'Admin',
                      password: 123123, password_confirmation: 123123)

p 'Ski Routes'

SkiRoute.create!(
  user: User.first,
  title: 'Portillo – Super C',
  intro: 'Clásico chute de portillo, los patrullas del centro de esquí podrán entregar información acerca de las condiciones actuales en la línea y la subida.',
  distance: 4.2,
  vert: 600,
  time: 2.5,
  aspect: 'S',
  dificulty: 9,
  route_description: "Si no se quiere pagar ticket se parte subiendo desde el estacionamiento de portillo hasta arriba del andarivel de la roca jack (400 vert), luego seguir 477 vert aprox hasta un traverse expuesto a la izquierda.
  En el traverse se recomienda tener crampones y piolet por seguridad ya que una caída ahí probablemente sea fatal.
  Pasado el traverse hay que patear unos 200 vert más por el chute expuesto para llegar arriba de la super c.
  Idealmente coordinar con alguien que los recoja en la calle abajo de la super c para poderla esquiar completa y no tener que traversear para volver al estacionamiento.",
  location: 'Portillo'
)
