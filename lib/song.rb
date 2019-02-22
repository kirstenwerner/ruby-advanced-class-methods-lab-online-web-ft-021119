class Song
  attr_accessor :name, :artist_name
  @@all = []
  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    self.all << song 
    song 
  end 
  
  def self.new_by_name(song_name)
    song = Song.new 
    song.name = song_name
    song 
  end 
  
  def self.create_by_name(song_name)
    song = Song.new 
    song.name = song_name 
    self.all << song 
    song 
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil 
      self.create_by_name(song_name)
    else 
      self.find_by_name(song_name)
    end
  end 
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 
  
  def self.create_from_filename(file_name)
    song = Song.new 
    song.name = file_name.split(".").pop.to_s 
    self.all << song 
    song
  end 
 
end
