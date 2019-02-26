class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre ? self.genre.name : nil
  end

  def note_contents=(arr)
    arr.each do |content|
      self.notes.build(content: content) if !content.empty?
    end
  end

  def note_contents
    if !self.notes.empty?
      self.notes.map{|note| note.content}
    else
      nil
    end
  end 

end
