function [dogs] = do_infections(dogs, current_group, inf_const, inf_prop, printouts)
    for dog_index = current_group
        dog = dogs(dog_index);
        inf_prob = 1 - (inf_const)^(inf_prop);
        if dog.infection_status == 'S'
            if rand < inf_prob
                if printouts
                    disp("EVENT: Dog #" + dog.index + " got infected")
                end
                dog = infection(dog);
                %add the updated dog back to the main array
                dogs(dog_index) = dog;
            end
        end
    end
end

