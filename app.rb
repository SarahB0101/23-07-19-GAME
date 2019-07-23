require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("Pattern")
player2 = Player.new("Stéphane")

while player1.life_points > 0 && player2.life_points > 0 # tant que m les payers 1 && 2 ont plus de 0 = fait la boucle
	puts "Voici l'état de chaque joueur :"
	puts player1.show_state 
	puts player2.show_state

	puts "Passons à la phase d'attaque :"
	puts player1.attacks(player2)

		if player2.life_points <= 0 # player2.life_points <= 0 il doit etre mort donc on sort de la boucle
			break
		else
			puts player2.attacks(player1)
		end

end
