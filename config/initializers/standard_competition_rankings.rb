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
    @rank_points = [12, 10, 8, 6, 5, 4, 3, 2, 1, 0]
  end
 
  def sort_data!
    return if @options[:sort_direction].nil? or @options[:sort_direction] == false
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
 
    bucket_count = 0
    group_points = 0

    @data.each_with_index do |data, i|

      data[:points] = 0

      if i == 0

        bucket_count = bucket_count + 1
        group_points = group_points + @rank_points[i]
        data[:position] = 1

      elsif data.wins_in(@options[:rank_by]) == @data[i-1].wins_in(@options[:rank_by])

        bucket_count = bucket_count + 1
        group_points = group_points + @rank_points[i]
        data[:position] = @rankings[i-1][:position]

      else

        (1..bucket_count).each do |n|
          @rankings[i-n][:points] = group_points.to_f / bucket_count
        end

        bucket_count = 1
        group_points = @rank_points[i]
        data[:position] = i + 1
      end
      @rankings[i] = data
    end

    puts "*** dropped out of main loop... assigning last bucket"

    i = @rankings.size
  
    puts "*** i = #{i}"
    puts "*** group_points = #{group_points}"
    puts "*** bucket_count = #{bucket_count}"

    (1..bucket_count).each do |n|
      @rankings[i-n][:points] = group_points.to_f / bucket_count
    end
 
    @rankings
  end
 
end