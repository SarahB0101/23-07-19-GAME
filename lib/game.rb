


class Game
	attr_accessor :human_player, :enemies

	def initialize(name)
		@human_player = HumanPlayer.new(name)
		@enemies = []
		#my_game = Game.new("Wolverine")
		
	end

	def kill_player(player)
		@enemies.delete(player) #supprimer un player du tableau enemies
	end

	def is_still_ongoing?
		if @human_player.life_points > 0 && @player.life_points > 0 #si human player et player ont plus de 0 retourne True sinon retourne false
			return true
		else
			return false
		end
	end

	def show_players
		@human_player.show_state #affiche l'état du joueur humain
		puts "Il reste #{enemies.size} ennemis en vue" # affiche le nombre d'ennemi retant
		
	end

	def menu

	 	puts "------------------------------------------------"
		puts "Quelle action veux-tu effectuer ?"
		puts

		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner "
		puts

		puts "attaquer un joueur en vue :"
		0.upto(enemies.size-1) do |index| #de 0 à la fin du tableau enemies
			print "#{index}" #affiche le nom de l'ennemi
			@enemies[index].show_state #montre l'état de chacun
	end
	

	def menu_choice
	 	puts "------------------------------------------------"

		
	end
end







	puts "Quelle action veux-tu effectuer ?"
	puts

	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	puts

	puts "attaquer un joueur en vue :"
	print "0 - "
	enemies[0].show_state
	print "1 - "
	enemies[1].show_state
	puts

	print ">"
	choice_thp_player = gets.chomp
	

	if choice_thp_player == "a"
		thp_player.search_weapon #trouver une arme
	elsif choice_thp_player == "s"
		thp_player.search_health_pack #trouver un kit de survie
	elsif choice_thp_player == "0"
		thp_player.attacks(enemies[0]) #attaquer l'ennemi 1
	elsif choice_thp_player == "1"
		thp_player.attacks(enemies[1])#attaquer l'ennemi 2
	end



