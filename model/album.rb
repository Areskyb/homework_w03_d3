require('pg')
require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_accessor :name, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id']
  end

  def find_artist(id)
    sql = "SELECT name FROM artists WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results[0]['name']

  end

  def self.find_albums_by_artist(id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Album.new(result)}
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map{ |result| Album.new(result)}
  end

end
