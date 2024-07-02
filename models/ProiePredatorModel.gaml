/**
* Name: ProiePredatorModel
* Based on the internal empty template. 
* Author: rluca
* Tags: 
*/


model ProiePredatorModel

// initalise all agents 
global{
	image_file wolf_png<-image_file("../includes/icons/icons8-wolf-60.png");
	image_file rabbit_png <- image_file("../includes/icons/icons8-rabbit-66.png");
	image_file carrot_png <- image_file("../includes/icons/icons8-carotte-94.png");

	init{
		create Wolf number:6;
		create Rabbit number:15;
		create Carrot number:50;
	}
}

// Define AGENTS
species Wolf{
	float wolf_size <- 2.5;
	float wolf_zone <- 2.0;
	list <Wolf> former_partners;
	
	aspect base{
		draw wolf_png size: wolf_size;
	}
	reflex hunt{
		list <Rabbit> rabbit_list <- Rabbit where ((each distance_to self)< wolf_zone);
		
		if(length(rabbit_list) > 0){
			Rabbit rabbit_item <- first(rabbit_list);
			ask rabbit_item{
				myself.location <- location;
				if(myself.wolf_size < 3.5){
					myself.wolf_size <- myself.wolf_size+rnd(1);
				}
				do die;
			}
		}
		else{			
			location<-point(location.x+rnd(-2.0, 2.0), location.y + rnd(-2.0, 2.0));
		}
		
	}
	
	reflex reproduce{
		list <Wolf> wolves <- Wolf where ((each distance_to self)< wolf_zone);
		
		// Filter wolves which has not been reproduced yet
		if(length(wolves) = 2){
			bool can_reproduce <- true;
						
	        loop wolf over: wolves {
	        	if(wolf in former_partners){
	        		can_reproduce <- false;
	        	}
	        	else{
	        		add item:wolf to: former_partners;
	        	}
			}
			
			if(can_reproduce and length(Wolf.population) < 30){
	        	create Wolf number: 1;
	        	write "reproduced WOLF";				
			}
		}
	}
}
species Rabbit{
	float rabbit_size <- 1.5;
	float rabbit_zone <- 1.5;
	list<Rabbit> former_partners;
	
	aspect base{
		draw circle(rabbit_zone) color:#red;
		draw rabbit_png size:rabbit_size;
	}
	
	reflex grow {
		list <Carrot> carrot_list <- Carrot where ((each distance_to self)< rabbit_zone);
		// write carrot_list;
		
		if(length(carrot_list) > 0){
			Carrot carrot_item <- first(carrot_list);
			ask carrot_item{
				myself.location <- location;
				if(myself.rabbit_size < 3 ){
					myself.rabbit_size <- myself.rabbit_size+rnd(0.5);
				}
				do die;
			}
		}
		else{
			location<-point(location.x +rnd(-1,1), location.y + rnd(-1,1));
		}
		
	}
	
	reflex reproduce{
		list <Rabbit> rabbits <- Rabbit where ((each distance_to self)< rabbit_zone);
		
		// Filtrer les lapins qui ne sont pas des anciens partenaires
		if(length(rabbits) = 2){
			bool can_reproduce <- true;
						
	        loop rabbit over: rabbits {
	        	if(rabbit in former_partners){
	        		can_reproduce <- false;
	        	}
	        	else{
	        		add item:rabbit to: former_partners;
	        	}
			}
			
			if(can_reproduce){
	        	create Rabbit number: 1;
	        	write "reproduced RABBIT";				
			}
		}
	}
}
species Carrot{
	float carrot_size <- 1.0;
	
	aspect base{
		draw carrot_png size:carrot_size;
	}
	reflex grow{
		carrot_size <- carrot_size+rnd(0.05);
		if(carrot_size > 1.5 ){
			do die;
		}
		
		// create new carrots
		if(length(Carrot.population)<25){
			create Carrot number: int (rnd(20, 50));
		}
	}
}

experiment track type:gui{
	output{
		display main{			
			species Wolf aspect:base;
			species Rabbit aspect:base;
			species Carrot aspect:base;
		}
	}
}

/* Insert your model definition here */

