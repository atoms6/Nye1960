% we are starting with the equation dq/dx+dh/dt = a(x,t) where a is the
% accumulation rate, q is the flow and x is in space and t is in time. We
% are assuming no change in ice volume.

%using a no flux boundary at t = 0

%we will be using forward Euler here.

%% c is the Courant number which is how we calculate the space and time
%% steps we will be using c=1 because this is when the result will be stable
%% and accurate

%% we will need to figure out some better intial conditions for these
%% should we run for like a year? 
v = 1; %m/s
tf = 2.592e+6; %seconds
n = 2000;
dx = 2000;
x = linspace(0 , 2000000, n);
Cor = 1;
dt = Cor*(dx)/v;
nt = ceil(tf/dt);

Q_t0 = 0; 
%% what do we do here? for our inital conditions what do we use? what should we use for our second equation=

Q = nan(n,nt);

Q(:,1) = Q_t0;

M = spdiags([Cor.*ones(n,1),1-Cor.*ones(n,1)],-1:0,n,n);% can i use this same matrix stucture
%% how do we incorperate the a and the c
%% should our c be a ocillating cycle of ablation and accumulation or can we
%% use a constant


M(1,1) = 1;
M(1,2) = 0;
M(2,1) = 1;
M(2,2) = 1-Cor;

%boundary

for k = 1:nt-1
    Q(:,k+1) = M*Q(:,k);
end
out = 'done'
figure
plot(x,Q(:,1:86400/dt:end))
xlabel('Distance(m)')
ylabel('Time(s)')
title('Advection using C = 1')
legend


%we will be using another method idk which


