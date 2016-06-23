class Tribe
	attr_reader :members

	GAME_COLORS = [:green, :white, :red]

	def initialize(options={})
		@name = options[:name]
		@members = options[:members]
		assign_color
		print_tribe_creation_message
	end

	def name
		@name.send(@color)
	end

	def to_s
		name
	end

	def tribal_council(options={})
		eliminated = @members.reject { |member| member == options[:immune] }.sample
		print_tribal_council_message(eliminated)
		@members.delete(eliminated)
	end

	private
	def assign_color
		@color = String.colors.reject { |color| GAME_COLORS.include? color }.shuffle.last
	end

	def print_tribe_creation_message
		puts "A new tribe has settled on the island. The tribes name - #{name}."
	end

	def print_tribal_council_message(eliminated)
		puts "The tribal council of #{name} has decided to eliminate #{eliminated.to_s.red}."
	end
end