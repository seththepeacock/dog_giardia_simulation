function [num] = get_num_playdates()
    x = rand;
    if x < 0.1364
        num = 0;
    elseif x < 0.1364 + 0.2727
        num = 1;
    elseif x < 0.1364 + 0.2727 + 0.1818
        num = 2;
    elseif x < 0.1364 + 0.2727 + 0.1818 + 0.3182
        num = 3;
    else
        num = 5;
    end
end

