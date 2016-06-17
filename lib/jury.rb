class Jury
	attr_accessor :members

	def initialize
		@members = []		
	end

	def add_member(contestant)
		@members.push contestant
	end

	def cast_votes(finalists)
		votes = Hash[finalists.product([0])]
		@members.each do |member|
			vote = finalists.sample
			votes[vote] += 1
			print_member_vote(member, vote)
		end
		return votes
	end

	def report_votes(final_votes)
		final_votes.each do |finalist, votes|
			puts "#{finalist}: #{votes}"
		end
	end

	def announce_winner(final_votes)
		final_votes.max_by { |finalist, votes| votes }.first
	end

	private
	def print_member_vote(member, vote)
		puts "#{member} has voted for #{vote}."
	end

end