require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	puts "\n"
	puts "Stage 1"
	8.times do
		puts "-" * 60
		immune_tribe = @borneo.immunity_challenge
		@borneo.tribes.find { |tribe| tribe != immune_tribe }.tribal_council
	end
	puts "\n"
end

def phase_two
	puts "\n"
	puts "Stage 2"
	3.times do
		puts "-" * 60
		immune_member = @borneo.individual_immunity_challenge
		@merge_tribe.tribal_council immune_member: immune_member
	end
	puts "\n"
end

def phase_three
	puts "\n"
	puts "Stage 3"
	7.times do
		puts "-" * 60
		immune_member = @borneo.individual_immunity_challenge
		@jury.add_member @merge_tribe.tribal_council(immune_member: immune_member)
	end
	puts "\n"
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
