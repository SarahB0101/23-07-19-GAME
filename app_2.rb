require 'bundler'
require 'pry'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry



puts "------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts
puts "Tape sur ENTRÉE pour commencer :) "
gets
puts "Quel est ton prénom ?"
print ">"

thp_player = HumanPlayer.new(gets.chomp) # nouveau player avec le prénom demandé

#création des ennemies
player1 = Player.new("Pattern")
player2 = Player.new("Stéphane")


enemies = [player1, player2] #tableau avec les ennemis


# fait la boucle tant que thp_player > 0 et enemie1 ou enemis2 > 0
while (thp_player.life_points > 0) && (enemies[0].life_points > 0 || enemies[1].life_points > 0) # tant que m les payers 1 && 2 ont plus de 0 = fait la boucle
	
	puts "------------------------------------------------"
	puts "Voici l'état du joueur :"
	thp_player.show_state 
 	puts "------------------------------------------------"
 	puts
 	puts

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

 	puts "------------------------------------------------"
	puts "Les autres joueurs t'attaquent !"
	enemies.each do |enemy|
		if enemy.life_points > 0 # ennemy.life_points > 0 il peut attaquer
			enemy.attacks(thp_player)
		end  	
	end

end





#------------------------ FIN DE LA PARTIE ------------------------

puts
puts "------------------------------------------------"
puts "La partie est finie"  
	if thp_player.life_points > 0 # si thp_player à vaincu les ennemies
		puts "BRAVO ! TU AS GAGNÉ !"
	else #si il n'a pas gagner
		 puts "Loser ! Tu as perdu !"
	end











