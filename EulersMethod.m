function [x y] = EulersMethod(h, x0, y0, T, F) % a function that graphs
                                               % and approximation of
                                               % the inputted function
       
    h_array = [h .1*h .01*h]; % creates 3 h-values, or time steps
    colors = ['r','b','g']; % creates an array of colors for each graph
    
    for m = 1:3 % creates a for loop that runs 3 times
        h = h_array(m); % picks the right h for each succession of the loop
        
    t0 = 0; % initial time
    span = [t0:h:T]; % the number of time steps
    x = x0; % initial x value
    y = y0; % initial y value
    x_val = [x;y]; % a matrix of the initial x and y values

    n = 1; % a step value for the while loop
    points = []; % creates an array to store the x and y points

    while (n) <= max(size(span)); % creates a while loop that 
                                  %loops as many times as 
                                  %there are time steps
        x_val = x_val + h*(F(x,y)); % returns a sequence of points
        x = x_val(1); % updates the x value for each loop
        y = x_val(2); % updates the y value for each loop
        points = [points, x_val]; % adds the x and y values to 
                                  % the points matrix in two
                                  % rows
        n = n+1; %increments the n-step of the while loop
    end % terminate while loop
    Px = points(1,:); % gets the x-coordinates from the points matrix
    Py = points(2,:); % gets the y-coordinates from the points matrix
   
    hold on % adds more graphs to current graph
    plot(Px, Py, colors(m)) % plots the x and y coordinates in one of
                            % the three colors from the colors array, 
                            % depending on the current loop of the
                            % for loop
    end % terminates the for loop
   
    xlabel('X') % labels the x-axis of the graph
    ylabel('Y') % labels the y-axis of the graph
    title('Eulers Method', 'FontSize', 12) % creates a title for the graph

end % ends the program

