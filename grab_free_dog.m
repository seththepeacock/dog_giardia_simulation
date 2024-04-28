function [selected_dog_index, dogs_already_playing, dog_group_to_add_to] = grab_free_dog(start_index, last_index, dogs_already_playing, dog_group_to_add_to)
    %find the list of eligible dogs within the start and end indices
    indices = start_index:last_index;
    eligible_dogs = setdiff(indices, dogs_already_playing);

    %pick a dog at random from this list
    num_of_eligible_dogs = size(eligible_dogs, 2);
    r = randi(num_of_eligible_dogs); 
    selected_dog_index = eligible_dogs(r);
    
    %add this dog to both the general already playing list and the current group
    dogs_already_playing(end + 1) = selected_dog_index;
    dog_group_to_add_to(end + 1) = selected_dog_index;
end
    
