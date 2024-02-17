% harcore poisson points
% direct pin

close all; clear all; clc

N     = 15;
N_rep = 100000;

L     = 2;
s     = .05;

LL = (L-2*N*s);

if LL <= 0
    disp('L <= 2 N s');
    return
end

L_s = repmat((2.*(1:N)'-1).*s,1,N_rep);

L_x = rand(N,N_rep).* LL;
L_x = sort(L_x) + L_s;

% test of distances
L_dx = [repmat(-s,1,N_rep);L_x;repmat(L+s,1,N_rep)];
L_dx = diff(L_dx);


if any(L_dx(:)<2*s)
    disp('violation of hardcore constraint')
    diff(L_dx)
end


[L_p,xx] = hist(L_x(:),1000);
L_p = (L_p./(N*N_rep))./(xx(2)-xx(1));
plot(xx,L_p.*L); hold on
plot(xx,ones(size(xx)),'-k')
axis([0 L 0 4])







