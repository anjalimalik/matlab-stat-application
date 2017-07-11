function [D1,D2] = diffoperators(z)

N = size(z,1);

%set differential operator for 1st derivative
D1 = (-diag(ones(N-1,1),-1) + diag(ones(N-1,1),1))/2;
D1(1,1:3) = [-3 4 -1]/2;
D1(N,N-2:N) = [1 -4 3]/2;
D1 = D1 * (N-1);

%set differential operator for 2nd derivative
D2 = - 2*diag(ones(N,1),0) + diag(ones(N-1,1),-1) + diag(ones(N-1,1),1);
D2(1,1:4) = [2 -5 4 -1];
D2(N,N-3:N) = [-1 4 -5 2];
D2 = D2 * (N-1)^2;

% compute metric terms
g = 1./(D1*z); % = deta/dz
g2 = diag(g)*D1*g; % = d2eta/dz2

% apply metric terms
D2 = diag(g.^2)*D2 + diag(g2)*D1;
D1 = diag(g)*D1;

end