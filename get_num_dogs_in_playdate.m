function [num] = get_num_dogs_in_playdate()
    x = rand;
    if x < 0.5208
        num = 2;
    elseif x < 0.5208 + 0.25
        num = 3;
    elseif x < 0.5208 + 0.25 + 0.0417
        num = 4;
    elseif x < 0.5208 + 0.25 + 0.0417 + 0.0625
        num = 5;
    elseif x < 0.5208 + 0.25 + 0.0417 + 0.0625 + 0.0833
        num = 6;
    elseif x < 0.5208 + 0.25 + 0.0417 + 0.0625 + 0.0833 + 0.0208
        num = 7;
    else
        num = 9;
    end
end

