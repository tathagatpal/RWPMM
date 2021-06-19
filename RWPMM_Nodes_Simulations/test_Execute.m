%Testing Random Waypoint mobility model.


s_input = struct('V_POSITION_X_INTERVAL',[0 5],...%(m)
                 'V_POSITION_Y_INTERVAL',[0 5],...%(m)
                 'V_SPEED_INTERVAL',[1 2],...%(m/s)
                 'V_PAUSE_INTERVAL',[10 30],...%pause time (s)
                 'V_WALK_INTERVAL',[2.00 6.00],...%walk time (s)
                 'V_DIRECTION_INTERVAL',[-180 180],...%(degrees)
                 'SIMULATION_TIME',100,...%(s)
                 'NB_NODES',5);
s_mobility = Generate_Mobility(s_input);

timeStep = 0.1;%(s)
test_Animate(s_mobility,s_input,timeStep);

