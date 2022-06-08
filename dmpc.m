function [d_omega, d_V] = dmpc(omega, omega_s, V, Vmin, Vmax V_s, d_theta, P, Q, aij,Smax, a)
    %all inputs are 4-element vector
    %step 4:
    omega_overline = (omega(a) + sum(aij*omega))/ 1+sum(aij);
    V_overline = (V(a) + sum(aij*V))/ 1+sum(aij);
    %step 5: update matrices
    Ai = zeros(3,9);
    Ai(1,4) = 1;
    Ai(2,4) = -1;
    Ai(3,5) = sign(P(a));
    Ai(3,6) = sign(Q(a));

    Bi = zeros(3,1);
    Bi(1,1) = Vmin;
    Bi(2,1) = -Vmax;
    Bi(3,1) = Smax(a) -(abs(P(a))+abs(Q(a))) + sign(P(a))*P(a) + sign(Q(a))*Q(a);
    
    Aeq = [1 0 0 0 0 0 0 0 0; 0 1 0 0 0 0 0 0 0];
    Beq = [wref; Vref];
    
    H = zeros(9);
    H(1,1) = 2*lambda1(a);
    H(2,2) = 2*lambda2(a);
    H(6,6) = 2*lambda5(a)/Smax(a);
    H(7,7) = H(6,6)*lambda6(a)/lambda5(a);
    H(8,8) = 2*lambda3(a);
    H(9,9) = 2*lambda4(a);

    F = zeros(9,1);
    F(1,1) = -2*lambda1(a);
    F(2,1) = -2*lambda2(a);
    F(6,1) = -2*lambda5(a)*sum(aij*P/Smax)*P(a)/Smax(a);
    F(7,1) = -2*lambda6(a)*sum(aij*P/Smax)*P(a)/Smax(a);

    [x, exitflag] = mpcActivSetSolver(H, F, Ai, Bi, Aeq, Beq, false(2,1), opt);
    d_omega = x(8);
    d_V = x(9);

end 