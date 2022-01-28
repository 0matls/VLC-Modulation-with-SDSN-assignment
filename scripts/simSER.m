clear; clc; close all;


%%
% the constellation we designed (x coordinate is the real part
% and y coordinate is the imaginary part)
s = [0; 0.1830+0.3169i; 0.5+0.5i; 0.1830+0.6830i;...
    0+1i; -0.183+0.683i; -0.5+0.5i; -0.1830+0.3169i];
ns = length(s);

[slope, constant_term] = create_lines(s);
section_points = find_section_points(s);

SNR = 0:30;
m = length(SNR);
SER = zeros(1,m);
numErrors = zeros(1,m);
signalSize = 500000;
maxNumErrors = 100000;
maxIter = 500;
%%
% we stop only after the number of errors is equal to maxNumErrors
% or after we have completed maxIter iterations

for i = 1 : m
    iter = 0;
    countSER = 0;
    tic;
    while numErrors(i) < maxNumErrors && iter < maxIter
        iter = iter + 1;
        data = randi([1 ns],signalSize,1);

        modData = s(data);
        rxSig = add_noise(modData,SNR(i));

        demodData = demodulate(rxSig, s, section_points);

        a = find(demodData == 0);
        if ~isempty(a)
            fprintf('At %d SNR with %d errors\n', SNR(i), length(a));
        end
        [ne, ser] = symerr(data,demodData);
        numErrors(i) = numErrors(i) + ne;
        countSER = countSER + ser;
    end
    dt = toc/60;
    SER(i) = countSER / iter;
    flag = SER(i) == 0;
    fprintf('I finished; SNR = %d dB with SER = %f after %2f min and %d iterations (%d)\n', SNR(i), SER(i), dt, iter, flag);
    if flag
        break;
    end
end
m = i-1;
index = 1 : m;
SNR = SNR(index);
SER = SER(index);

%%

figure(1);clf;
semilogy(SNR,SER)
xlabel('SNR (dB)'); 
ylabel('SER');
title('Simulated SER on designed constellation');
grid on;

figure(3);clf;
for i = 1 : ns
    xv = section_points{i,1};
    yv = section_points{i,2};
    plot(xv,yv)
    hold on
    plot(real(s(i)), imag(s(i)), 'rs', 'Linewidth', 2);
end
ylim([-0.3 1.3])
xlim([-0.6 0.6])
% plot(real(rxSig), imag(rxSig),'o')

