
classdef Dog
    properties
        index {mustBeInteger}
        infection_status = 'S'
        group {mustBeInteger}
        days_infectious {mustBeInteger} = 1
        days_latent {mustBeInteger} = 1
    end

    methods
        function dog = infection(dog)
            dog.infection_status = 'E';
        end
        function dog = become_infectious(dog)
            dog.infection_status = 'I';
        end
        function dog = recovery(dog)
            dog.infection_status = 'R';
        end
        function dog = next_infectious_day(dog)
            dog.days_infectious = dog.days_infectious + 1;
        end
        function dog = next_latent_day(dog)
            dog.days_latent = dog.days_latent + 1;
        end

    end
    
end
