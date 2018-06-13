sys = tf([5, 7], [1, 5, 5,4]);
t = 0:0.1:1000;
y = step(sys, t);
plot(t, y);
axis([0,50,0,5])