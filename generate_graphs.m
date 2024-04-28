clear all
load longer_sim_data.mat outbreak_lengths outbreak_sizes

% control/noplaydates/nomeetings, inf_const, trial #

meanLengthsControl = NaN(1, 20);
meanLengthsNoPlaydates = NaN(1, 20);
meanLengthsNoMeetings = NaN(1, 20);
varLengthsControl = NaN(1, 20);
varLengthsNoPlaydates = NaN(1, 20);
varLengthsNoMeetings = NaN(1, 20);
meanSizesControl = NaN(1, 20);
meanSizesNoPlaydates = NaN(1, 20);
meanSizesNoMeetings = NaN(1, 20);
varSizesControl = NaN(1, 20);
varSizesNoPlaydates = NaN(1, 20);
varSizesNoMeetings = NaN(1, 20);

X = NaN(1, 20);
for i = 1:20
    inf_const = (i-1) * 0.05;
    X(i) = inf_const;
end

for x = 1:20
    for type = 1:3
        all_lengths = outbreak_lengths(type, x, :);
        mean_length = mean(all_lengths, "omitnan");
        var_of_lengths = var(all_lengths, "omitnan");
        all_sizes = outbreak_sizes(type, x, :);
        mean_size = mean(all_sizes, "omitnan");
        var_of_sizes = var(all_sizes, "omitnan");
        switch type
            case 1
                meanLengthsControl(x) = mean_length;
                varLengthsControl(x) = var_of_lengths;
                meanSizesControl(x) = mean_size;
                varSizesControl(x) = var_of_sizes;
            case 2
                meanLengthsNoPlaydates(x) = mean_length;
                varLengthsNoPlaydates(x) = var_of_lengths;
                meanSizesNoPlaydates(x) = mean_size;
                varSizesNoPlaydates(x) = var_of_sizes;
            case 3
                meanLengthsNoMeetings(x) = mean_length;
                varLengthsNoMeetings(x) = var_of_lengths;
                meanSizesNoMeetings(x) = mean_size;
                varSizesNoMeetings(x) = var_of_sizes;
        end
    end
end

close all

figure (1)

plot(X, meanLengthsControl, 'g', X, meanLengthsNoPlaydates, 'b', X, meanLengthsNoMeetings, 'r', LineWidth = 2);
title('Mean Lengths of Outbreak')
xlabel('Infectivity Constant')
ylabel('Mean Outbreak Length (Days)')
legend("Control", "No Playdates", "No Meetings")
ticks = 0:0.05:1;
xticks(ticks)

saveas(1, "meanLengths.jpg")

figure(2)

plot(X, varLengthsControl, 'g', X, varLengthsNoPlaydates, 'b', X, varLengthsNoMeetings, 'r', LineWidth = 2);
title('Variance of Outbreak Length')
xlabel('Infectivity Constant')
ylabel('Variance of Lengths of Outbreak')
legend("Control", "No Playdates", "No Meetings")
xticks(ticks)

saveas(2, "varLengths.jpg")


figure(3)

plot(X, meanSizesControl, 'g', X, meanSizesNoPlaydates, 'b', X, meanSizesNoMeetings, 'r', LineWidth = 2);
title('Mean Sizes of Outbreak')
xlabel('Infectivity Constant')
ylabel('Mean Outbreak Size (Proportion)')
legend("Control", "No Playdates", "No Meetings")
xticks(ticks)

saveas(3, "meanSizes.jpg")

figure(4)

plot(X, varSizesControl, 'g', X, varSizesNoPlaydates, 'b', X, varSizesNoMeetings, 'r', LineWidth = 2);
title('Variance of Outbreak Size')
xlabel('Infectivity Constant')
ylabel('Variance')
legend("Control", "No Playdates", "No Meetings")
xticks(ticks)

saveas(4, "varSizes.jpg")



%3. writeup methods and upload results

