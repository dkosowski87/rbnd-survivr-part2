class Jury
	attr_accessor :members

	def initialize
		@members = []		
	end

	def add_member(contestant)
		@members.push contestant
		print_add_member_message(contestant)
	end

	def cast_votes(finalists)
		votes = Hash[finalists.product([0])]
		@members.each do |member|
			vote = finalists.sample
			votes[vote] += 1
			print_member_vote_message(member, vote)
		end
		return votes
	end

	def report_votes(final_votes)
		final_votes.each do |finalist, votes|
			puts "#{finalist} has got #{votes} votes."
		end
	end

	def announce_winner(final_votes)
		winner = final_votes.max_by { |finalist, votes| votes }.first
		print_winner_message(winner)
		return winner
	end

	private
	def print_member_vote_message(member, vote)
		puts "#{member} has voted for #{vote}."
	end

	def print_add_member_message(member)
		puts "#{member} has been appointed as a jury member."
	end

	def print_winner_message(winner)
		puts "*" * 30
		puts "The winner is #{winner}.".green
	end

end