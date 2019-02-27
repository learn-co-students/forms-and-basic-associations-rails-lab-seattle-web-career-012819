class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes
  #setter
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  #getter
  def genre_name
    #self.genre.name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    #self.artist.name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(note)
    note.each do |content|
      if content.strip != ''
        self.notes << Note.create(content: content)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
