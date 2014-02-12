class SCR
 
  def self.test
    athletes = Athlete.active
    foosball = Sport.find(1)
    lb = SCR.new(athletes, :rank_by => foosball, :sort_direction => :desc)
    blb = lb.calculate
  end

  def initialize(data, options = {})
    @data = data
    @options = options.reverse_merge(:rank_by => Sport.find(1) , :sort_direction => :desc)
  end
 
  def sort_data!
    return if @options[:sort_direction].nil? or @options[:sort_direction] == false
    puts "In Sort Data"
    case @options[:sort_direction]
    when :desc then @data.sort! {|a, b| b.wins_in(@options[:rank_by]) <=> a.wins_in(@options[:rank_by]) }
    when :asc  then @data.sort! {|a, b| a.wins_in(@options[:rank_by]) <=> b.wins_in(@options[:rank_by]) }
    else raise ArgumentError, "Sort direction can only be :asc or :desc"
    end
  end
 
  def calculate
    return @rankings if @rankings.present?
 
    @rankings = []
 
    sort_data!
 
    @data.each_with_index do |data, i|
      if i == 0
        data[:position] = 1
      elsif data.wins_in(@options[:rank_by]) == @data[i-1].wins_in(@options[:rank_by])
        data[:position] = @rankings[i-1][:position]
      else
        data[:position] = i + 1
      end
      @rankings[i] = data
    end
 
    @rankings
  end
 
end