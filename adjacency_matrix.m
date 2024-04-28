
x = readtable('5421adjmat','ReadVariableNames',false,'NumHeaderLines',0);
dat = table2array(x); %attendance of dogs at 48 playdates
c = unique(dat); %find unique values in the matrix of all playdates
dogs = c(2:39); %concatenate the unique values to omit the empty value
v = zeros(48,1);

for i = 1:48
    for j=1:9
        if isempty(dat{i,j})
            v(i) = j-1;
            break 
        end
        v(i)=9;
    end
end

 

%disp(v) %number of dogs on each playdate

A = zeros (38,38);
for k = 1:48
    n_cur = v(k); % number of dogs for current playdate
    for i = 1:n_cur - 1
        for j = i+1:n_cur

            dog_i = dat (k,i);

            dog_j = dat (k,j);

            exact_match_mask = strcmp (dogs, dog_i);

            ind_i = find (exact_match_mask);

            exact_match_mask = strcmp (dogs, dog_j);

            ind_j = find (exact_match_mask);

            A(ind_i,ind_j) = A(ind_i,ind_j) + 1;

            A(ind_j,ind_i) = A(ind_j,ind_i) + 1;
        end
    end
end

G = graph(A);

figure(1);
h = plot(G,'Layout','force','NodeColor','black','MarkerSize',10);
title('OSU 4 Paws for Ability Clusters', 'FontSize',14)
[modules,inmodule] = louvain(A, G);



cluster = 1;

for i = 1:size(modules, 2)
    t = modules(i);
    module = t{1};
    if size(module, 2) > 1 
        if cluster == 1
            color = 'green';
            cluster = cluster + 1;
        elseif cluster == 2
            color = 'cyan';
            cluster = cluster + 1;
        elseif cluster == 3
            color = 'red';
            cluster = cluster + 1;
        elseif cluster == 4
            color = 'magenta';
            cluster = cluster + 1;
        elseif cluster == 5
            color = 'blue';
        end
        for j = 1:size(module, 2)

            highlight(h, module(j), 'NodeColor', color)
        end
    end

end

saveas(1, "colored_graph.jpg")


% num_dogs = 38;
% for i = 1:num_dogs
%     switch idx(i)
%         case 1
%             color = 'yellow';
%         case 2
%             color = 'blue';
%         case 3
%             color = 'green';
%         case 4
%             color = 'cyan';
%         case 5
%             color = 'red';
%         case 6
%             color = 'magenta';
%         case 7
%             color = 'black';
%         case 8
%             color = [0.4940 0.1840 0.5560];
%         case 9
%             color = [0 0.4470 0.7410];
%         case 10
%             color = [0.8500 0.3250 0.0980];
%         case 11
%             color = [0.9290 0.6940 0.1250];
%         case 12
%             color = [0.4660 0.6740 0.1880];
%         case 13
%             color = [0.3010 0.7450 0.9330];
%         case 14
%             color = [0.6350 0.0780 0.1840];
%     end
%     highlight(h, i, 'NodeColor', color)
% end
% 
% 
