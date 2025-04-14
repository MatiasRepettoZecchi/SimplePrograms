clear all;
vSigEp3 = zeros(1000,2);
vSigEp4 = zeros(1000,2);
f = 0;
i = 1;
L = 34.7;
S3 = ((0.32)*(0.32)*pi)/4;
S4 = ((0.4)*(0.4)*pi)/4;
Ea = 2.1*10^(6);
while i <= 1000
  if vSigEp3(i, 2) > 0.12;
    vSigEp3(i, 2) = vSigEp3(i, 2);
  elseif
    vSigEp3(i, 2) = (((f*L)/(S3*Ea)));
    vSigEp3(i, 1) = (f);
  endif
  if vSigEp4(i, 2) > 0.12;
    vSigEp4(i, 2) = vSigEp4(i, 2);
  elseif
    vSigEp4(i, 2) = (((f*L)/(S4*Ea)));
    vSigEp4(i, 1) = (f);
  endif
  f = f+1 ;
  i = i+1;
end
figure(1)
plot(vSigEp3(:, 2), vSigEp3(:, 1));
title('(Electrodo 3,2mm)')
xlabel 'Epsilon';
ylabel 'Sigma';
figure(2)
plot(vSigEp4(:, 2), vSigEp4(:, 1));
title('(Electrodo 4,0mm)')
xlabel 'Epsilon';
ylabel 'Sigma';
