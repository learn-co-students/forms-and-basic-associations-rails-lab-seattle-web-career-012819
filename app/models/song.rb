class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name
    self.genre&.name
  end

  def genre_name= (name)
    self.genre = Genre.find_by(name: name)
    raise "Genre does not exist" unless self.genre
  end

  def artist_name
    self.artist&.name
  end

  def artist_name= (name)
    artist = Artist.find_or_create_by(name: name)
    artist.songs << self
  end

  def note_contents
    self.notes.collect{|n| n.content}
  end

  def note_contents= (contents)
    contents.each do |content|
      self.notes << Note.create(content: content) unless content.empty?
    end
  end
end
