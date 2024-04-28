outbreak_sizes = NaN(3, 20, 2000);
outbreak_lengths = NaN(3, 20, 2000);
% control/noplaydates/nomeetings, inf_const, trial #


% function [outbreak_size, outbreak_length] = run_sim(inf_const, playdates, meetings, printouts)

n = 1;

num_sims = 2000;

for i = 1:20
    inf_const = (i-1) * 0.05;
    for j = 1:num_sims
        [outbreak_size, outbreak_length] = run_sim(inf_const, true, true, false);
        outbreak_sizes(1, i, j) = outbreak_size;
        outbreak_lengths(1, i, j) = outbreak_length;

        [outbreak_size, outbreak_length] = run_sim(inf_const, false, true, false);
        outbreak_sizes(2, i, j) = outbreak_size;
        outbreak_lengths(2, i, j) = outbreak_length;

        [outbreak_size, outbreak_length] = run_sim(inf_const, true, false, false);
        outbreak_sizes(3, i, j) = outbreak_size;
        outbreak_lengths(3, i, j) = outbreak_length;

        n = n + 1;
        disp(n + "/" + "40,000")
    end
end

save longer_sim_data.mat outbreak_sizes outbreak_lengths