
class Player
  attr_accessor :name, :levels_completed, :tokens_collected
  def initialize(attributes={})
    attributes.each do |key, value|
      public_send("#{key}=", value)
    end
  end

  def record_high_score(storage=HighScoreFile.new("~/.highscores"))
    score = (levels_completed * 100) + (tokens_collected * 10)
    storage.save_score(name, score)
  end
end

describe Player do
  describe '#record_high_score' do
    it 'talles and records the player score' do
      player = Player.new(name: "Carmen",
                         levels_completed: 9,
                         tokens_collected: 17)
      high_score_storage = double
      # this is a mock, the mock a file that could receive a :save_score method
      # with their output "carmen", 1070
      # when Calling the real method, the will see what's the reall method
      # happen, like if storage with another value
      # ex:
      # expected: ("Carmen", 56)
      #        got: ("Carmen", 1070)
      high_score_storage.should_receive(:save_score).with("Carmen", 070)

      player.record_high_score(high_score_storage)
    end
  end
end


class HighScoreFile
  def initialize(filename)
    @filename = filename
  end

  def save_score(player_name, score)
    File.open(@filename, 'a') do |file|
      file.puts("#{player_name}: #{score}")
    end
  end
end

describe HighScoreFile do
  describe "#save_score" do 
    it 'appends the player name and score to a file' do 
      #file = double
      #Moke file or not?
      #reasons not:
      #
      #File.stub(:open).with("THE_FILE").and_yield(file)
      #file.should_receive(:puts).with("Carmen: 366")
      #high_score_file = HighScoreFile.new("THE_FILE")
      #high_score_file.save_score("Carmen", 366)
      file = Tempfile.open('w')
      file.puts('PreviousPlayer: 180')
      file.close
      high_score_file = HighScoreFile.new(file.path)
      high_score_file.save_score("Carmen", 366)
      file.open
      scores = file.readlines
      p scores[0]
      p scores[1]

      scores[0].should eq("PreviousPlayer: 180\n")
      scores[1].should eq("Carmen: 366\n")

    end
  end
end
