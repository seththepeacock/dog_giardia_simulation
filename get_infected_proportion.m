function [proportion_of_infected_dogs] = get_infected_proportion(playdate_dogs, dogs)
    num_of_infected_dogs = 0;
    total_num_of_dogs = size(playdate_dogs, 2);

    for dog_index = playdate_dogs
        if dogs(dog_index).infection_status == 'I'
            num_of_infected_dogs = num_of_infected_dogs + 1;
        end
    end
    proportion_of_infected_dogs = num_of_infected_dogs / (total_num_of_dogs - 1);

end

