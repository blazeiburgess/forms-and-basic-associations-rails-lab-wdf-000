class Song < ActiveRecord::Base  
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    genre.name
  end

  def artist_name=(artist_name)
    update({:artist => Artist.find_or_create_by({:name => artist_name}) })
  end

  def artist_name
    artist.name rescue ""
  end

  def genre_name=(genre_name)
    update({:genre => Genre.find_or_create_by({:name => genre_name})})
  end

  def genre_name
    genre.name
  end

  def note_contents
    notes.map(&:content).select {|cont| !cont.empty?}
  end

  def note_contents=(note_contents)
    note_contents.each do |note|
      notes << Note.find_or_create_by({:content => note})
    end
  end

end

