require"pry"
def get_first_name_of_season_winner(data, season)
  # code here
  data[season].find {|x| x["status"] == "Winner"}["name"].split(" ").first
end

def get_contestant_name(data, occupation)
  data.map do |season, contestants|
    contestants.find do |person_info|
      person_info ["occupation"] == occupation
    end
  end.compact.first["name"]
end

def count_contestants_by_hometown(data, hometown)
  same_home = []
  data.each do |season, contestants|
    contestants.each do |person_info|
      if person_info["hometown"] == hometown
        same_home << person_info["hometown"]
      end
    end
  end
  same_home.length
end

def get_occupation(data, hometown)
  data.map do |season, contestants|
    contestants.find do |person_info|
      person_info ["hometown"] == hometown
    end
  end.compact.first["occupation"]
end

def get_average_age_for_season(data, season)
  container_of_ages = []
  data[season].each do |person_info|
    container_of_ages << person_info["age"].to_i
  end
  x = container_of_ages.inject{|sum, x| sum + x}.to_f / container_of_ages.size
  x.round
end
