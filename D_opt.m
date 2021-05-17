%% Author: Chi-Kuang Yeh
% May 10 / 2017
% D optimality criterion
% Optimal designs for regression models using 2nd order LSE

%% the examples used
% Compartment model with 2 compartments
% theta = [ a1 = 1; b1 =0.1 ;a2 =1 ;b2 =1.0]
% range is from 0 to 50
% [d ,a,e] = D_opt(101,0,[1 0.1 1 1]',[0;50],@comp_2)

% Michaelis-Menten model
% theta = [ a=1 , b=1]
% range is from 0 to 4
% [d ,a,e] = D_opt(101,0,[1,1]',[0;4],@mm)

% Compartment model with 4 compartments
% [d ,a,e] = D_opt(101,0,[1, 0.1,1, 0.6, 1, 2.3, 1, 5.5]',[0;10],@comp_4)

%% function itself
function [del, ANS, error] = D_opt(N, t, theta, range, fun)
  %% initialization

  % these ones are used in solving the question
  u = linspace(range(1), range(2), N); %discretized equally spaced space
  w = zeros(N, 1); n = length(theta); del = 0;
  g1 = zeros(n, 1); G2 = zeros(n);

  %% cvx part
  cvx_begin quiet
  cvx_precision high
  variables w(N, 1) del(1) %design variable and upper bound
  minimize del(1)
  subject to
  %    constructing the B matrix
  for i = 1:N
    f = fun(u(i), theta);
    g1 = g1 + w(i) * f;
    G2 = G2 + w(i) * f * f';
  end

  % this is the improvement , do it later
  %       for i=1:N
  %         f(i,:)=fun(u(i),theta);
  %       end
  %       g1 = sum(w*f);
  %       G2=sum(w*f*f');
  B = [1, sqrt(t) * g1'; sqrt(t) * g1, G2];
  % constrains
  -log_det(B) <= del;
  -w <= zeros(length(w), 1);
  sum(w) == 1;
  cvx_end

  %% propose the outputs
  kk = find(w > 1e-4); % because the computer does not have exact zero
  ANS = [u(kk); w(kk)']; % return the answer

  %% checking condition, from M-A
  % prepare the variables
  A = G2 - t * g1 * g1';
  inv_A = inv(A);
  phi_D = zeros(N, 1);

  for i = 1:N
    f = fun(u(i), theta);
    fg1 = f - g1;
    phi_D(i) = (1 - t) * f' * inv_A * f + t * fg1' * inv_A * fg1;
  end

  q = n * ones(N, 1);

  % update the error
  error = max(phi_D - q);

  %% plot
  % first, we increase the graphing domain
  new_range = [0; 0]; add_dist = (range(2) - range(1)) / 20;
  new_range(1) = range(1) - add_dist;
  new_range(2) = range(2) + add_dist;

  % first plot, plot out the design points
  figure
  stem(u, w, 'kd');
  xlim(new_range); % increase the domain, so the points wont be on the edge
  ylim([0, max(w) + 0.1]);
  xlabel('design space', 'FontSize', 16) % x-axis label
  ylabel('weights', 'FontSize', 16) % y-axis label
  title('Discretized weight distribution', 'FontSize', 20)

  % directional derivative plot
  fx = @(x) fun(x, theta);
  ff = @(x) (1 - t) .* fx(x)' * inv_A * fx(x) + t .* (fx(x) - g1)' * inv_A * (fx(x) - g1) - n;

  figure
  plot(u, phi_D - q, '+'); %discretized
  hold on
  fplot(ff, [range(1), range(2)], '-'); %function
  hold on
  plot(u(kk), zeros(1, length(kk)), 'pg'); %supporting points
  legend('Discretized', 'd(x,\theta)', 'Supporting point');
  % title('Directional derivative plot','FontSize',20);
  xlabel('design space', 'FontSize', 16) % x-axis label
  ylabel('Directional Derivative', 'FontSize', 16) % y-axis label
  hold on
  line([range(1), range(2)], [0, 0], 'Color', 'red');
  hold off
end
