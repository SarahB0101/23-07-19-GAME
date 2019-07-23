


class Player
	attr_accessor :name, :life_points 

	def initialize(name)
		@name = name #nom des joueurs
		@life_points = 10 #points de vie
		
	end

	def show_state #montrer les points de vie des joueurs
		puts "#{name} à #{life_points} points de vie"
		
	end

	def gets_damage(num) 
		@life_points = life_points - num #retirer de life_points le nombre associer au damage

		if @life_points <= 0 #si le joueur atteint 0 point de vie
			puts "le joueur #{name} n'a plus de joker, c'est un Pirate !" # it's over
		end

	end


	def attacks(player) #Player = joueur qui subit l'attaque
		puts "#{name} attaque #{player.name}" #player.name applique le nom qu'on lui à donné
		pts_damage = compute_damage #je stock le resultat aléatoire dans une variable appelé pts_damage
		puts "il lui inflige #{pts_damage} points de dommages"
		player.gets_damage(pts_damage) #player.methode =  applique à player la methode pour retirer des points
	end



	def compute_damage
		return rand(1..6)
	end
end







class HumanPlayer < Player #HumanPlayer hérite de la classe Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end



	def show_state #montrer les points de vie des joueurs
		puts "#{@name} à #{@life_points} points de vie et une arme de niveau #{@weapon_level}"		
	end



	def compute_damage #dommage aléatoire
		return rand(1..6) * @weapon_level
	end



	def search_weapon 
		new_weapon_level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

		if new_weapon_level > @weapon_level
			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
			@weapon_level = new_weapon_level

		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end



	def search_health_pack
		result_rand = rand(1..6)
		
		if result_rand == 1 #si le nombre aléatoire == 1
			puts "Tu n'as rien trouvé... "
		
		elsif (result_rand >=2) && (result_rand <=5) #si rand est entre 2 et 5
			@life_points += 50 #life pount prend 50pts
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		
		elsif result_rand == 6 #si le nombre aléatoire == 6
			@life_points += 80
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end	



		if @life_points > 100 #si les points de vie ont +de 100pts reste à 100pts
			@life_points = 100
		end	
	end



end



