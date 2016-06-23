class Tribe
	attr_reader :name, :members

	def initialize(options={})
		@name = options[:name]
		@members = options[:members]
		print_tribe_creation_message
	end

	def to_s
		@name
	end

	def tribal_council(options={})
		immune_member = @members.delete(options[:immune])
		eliminated = @members.sample
		print_tribal_council_message(eliminated)
		@members.push(immune_member) if immune_member
		@members.delete(eliminated)
	end

	private
	def print_tribe_creation_message
		puts "A new tribe has settled on the island. The tribes name - #{name}."
	end

	def print_tribal_council_message(eliminated)
		puts "The tribal council of #{name} has decided to eliminate #{eliminated}."
	end
end