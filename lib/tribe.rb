class Tribe
	attr_reader :name, :members

	def initialize name:, members:
		@name = name
		@members = members
		print_tribe_creation_message
	end

	def to_s
		@name
	end

	def tribal_council immune:
		immune_member = @members.delete(immune)
		eliminated = @members.sample
		@members.push immune_member
		@members.delete(eliminated)
	end

	private
	def print_tribe_creation_message
		puts "A new tribe has settled on the island. The tribes name - #{name}."
	end
end