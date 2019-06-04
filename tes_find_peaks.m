x = linspace(0,1,1024);
Pos = [0.1 0.13 0.15 0.23 0.25 0.40 ...
 0.44 0.65  0.76 0.78 0.81];
Hgt = [ 4  5   3   4  5  4.2 2.1 4.3  3.1 5.1 4.2];
Wdt = [.005 .005 .006 .01 .01 .03 .01 .01  .005 .008 .005];
PeakSig = zeros(size(x));
  for n =1:length(Pos)
    PeakSig = ...
PeakSig + Hgt(n)./( 1 + abs((x - Pos(n))./Wdt(n))).^4;
  end 
% find peaks with defaults
[pks,locs] = findpeaks(PeakSig);
plot(x,PeakSig); hold on;
% offset values of peak heights for plotting
plot(x(locs),pks+0.05,'k^','markerfacecolor',[1 0 0]);