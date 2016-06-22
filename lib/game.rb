class Game
	attr_reader :tribes

	def initialize(tribe1, tribe2)
		@tribes = [tribe1, tribe2]
	end

	def add_tribe(tribe)
		@tribes.push tribe
	end

	def immunity_challenge
		@tribes.sample
	end

	def clear_tribes
		@tribes.clear
	end

	def merge(name)
		members = []
		@tribes.each do |tribe|
			members.concat tribe.members
		end
		@combined_tribe = Tribe.new name: name, members: members
	end

	def individual_immunity_challenge
		@tribes.first.members.sample
	end

end