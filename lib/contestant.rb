class Contestant

	def initialize(name)
		@name = name
	end

	def name
		@name.capitalize
	end

	def to_s
		name
	end
end