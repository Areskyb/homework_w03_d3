require('pry')
require_relative('../model/artist.rb')
require_relative('../model/album.rb')


artist1 = Artist.new({ 'name' => 'prince' })
artist1.save()
artist2 = Artist.new({ 'name' => 'keith' })
artist2.save()

album1 = Album.new({'name' => 'purple', 'genre' => 'unique', 'artist_id' => artist1.id})
album1.save()

album2 = Album.new({'name' => 'white', 'genre' => 'black metal', 'artist_id' => artist2.id})
album2.save()

album3 = Album.new({'name' => 'purple: the return', 'genre' => 'unique', 'artist_id' => artist1.id})
album3.save()

albums = Album.all()

albums_id = Album.find_albums_by_artist(1)

artist_name = album1.find_artist(album1.artist_id)

binding.pry
nil
