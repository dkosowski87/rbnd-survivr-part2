class Game
	attr_reader :tribes

	def initialize(*tribes)
		@tribes = tribes
	end

	def add_tribe(tribe)
		@tribes.push tribe
	end

	def immunity_challenge
		immune_tribe = @tribes.sample
		print_immunity_challenge_message(immune_tribe)
		return immune_tribe
	end

	def clear_tribes
		@tribes.clear
	end

	def merge(name)
		members = @tribes.map(&:members).flatten
		add_tribe Tribe.new(name: name, members: members)
		tribes.last
	end

	def individual_immunity_challenge
		immune_member = @tribes.last.members.sample
		print_individual_immunity_challenge_message(immune_member)
		return immune_member
	end

	private
	def print_immunity_challenge_message(immune_tribe)
		puts "#{immune_tribe} has won the immunity challenge."
	end

	def print_individual_immunity_challenge_message(immune_member)
		puts "#{immune_member.to_s.green} has won the individual immunity challenge."
	end

end