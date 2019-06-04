function graph_spectral_entropy_day(SE, crs)


spen = SE;
spen(isnan(spen)) = nanmedian(spen);
mins=1;
%crs = 'MCS';
 
% Compute Wavelet
%%%% 1st argument, spectral entropy series
%%%% 2nd argument, number of points of the series
%%%% 3rd argument, sampling rate
%%%% 4th argument, choice of the mother wavelet 1->Morlet
%%%% 5th argument, number of trials (1)
[waveerp,freqs,zcale,paramout,Fk] = CMP_wavelets(spen,length(spen),1/(mins*60),1,1);
%%%%%%% consider only periodicities between 20 and 130 minutes
waveerp = squeeze(waveerp);

%%%% consider only periodicities between 20 and 200 minutes %%%%
ex1 = find(1./(freqs*60) > 20);
ex1 = ex1(1)-1;
waveerp(1:ex1,:) = [];
freqs(1:ex1) = [];
zcale(1:ex1) = [];
ex2 = find(1./(freqs*60) <= 200);
ex2 = ex2(end)+1;
waveerp(ex2:end,:) = [];
freqs(ex2:end) = [];
old_freqs =  freqs;
zcale(ex2:end) = [];
waves = abs(waveerp); 

%%%%%% time-frequency representation of spectral entropy  amplitude spectra %%%%%%%
figure(1);    
pcolor(1:length(spen),(freqs),(waves));
shading('interp')
hold on
set(gca,'YScale','log')
tic
%%%%%%%%%%%% adjust the image based on the time-series length and number of
%%%%%%%%%%%% estimated frequencies: TO BE ADAPTED TO THE SPECIFIC ANALYSIS
set(gca,'YTick',[fliplr(freqs(1:5:end-2)) ],'YTickLabel',[fliplr(round(1./(freqs(1:5:end-2)*60)))],...
        'FontName','Calibri','FontSize',7,'XTick',0:24:72,'XTickLabel',0:120:360)%,'Ylim',[.000105 .0010])
xlabel('min','FontName','Calibri','FontSize',8)
ylabel('min','FontName','Calibri','FontSize',8)
title(crs,'FontName','Calibri','FontSize',9)
a = colormap(hot(256));
colormap(flipud(a))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(2);

cr = 'r';
hold on


%%%%%%%% plot Spectral Entropy time course %%%%%%%%
Xrec = invcwt_ap(waves, 'Morlet', zcale, paramout, Fk);
mins_MAX = size(waves,2);

delta_min = floor(mins_MAX/72);
t_min_downsample = downsample([0:1:mins_MAX],delta_min);

%aux = interp1(1:mins:61,Xrec,1:mins*72,'cubic');
aux = interp1(1:mins:mins_MAX,Xrec,1:mins*72,'cubic');
hold on
%plot(1:72,aux,'linewidth',1,'color',cr,'linewidth',1)
plot((t_min_downsample(1:72))',aux,'linewidth',1,'color',cr,'linewidth',1)

title('SE time course','FontName','Calibri','FontSize',9)
%set(gca,'Xlim',[0 360],'XTick',[0:60:360],'FontName','Calibri','FontSize',8)

%set(gca,'Xlim',[0 mins_MAX],'XTick',[0:60:mins_MAX],'FontName','Calibri','FontSize',8)
set(gca,'Xlim',[0 mins_MAX],'XTick',(t_min_downsample(1:72))' ,'FontName','Calibri','FontSize',8)
xlabel('min','FontName','Calibri','FontSize',8)
%%%% again image parameters are to be adjusted depending on the time-series
%%%% under analysis %%%%%%

aux = waves;
ci = bootci(500,{@mean,aux'},'alpha',.05);
aux = nanmean(aux,2);
pws = aux;
pws_std1 = ci(1,:);
pws_std2 = ci(2,:);
[a,b] = sort(aux,'descend');
freqs = freqs(b);
zcale = zcale(b);
aux = aux(b);

%%%%% plot the descriptive statistic of amplitude spectrum (sa) as a function of
%%%%% periodicity expressed in minutes (thick red line is the mean value, thin lines represent the 95% confidence
%%%%% interval on the mean value estimated based on 500 bootstrap of the original series) %%% 
h = figure(3);
aux = pws;
%save save_aux aux;
hold on
aux = pws;
aux1 = pws_std1;
aux2 = pws_std2;
plot(1./(old_freqs(1:end)*60),(aux(1:end)),'color',cr,'linewidth',1)
hold on
plot(1./(old_freqs(1:end)*60),aux1,'color',cr,'linewidth',4.5)
plot(1./(old_freqs(1:end)*60),(aux2),'color',cr,'linewidth',2.5)
time = 1./(old_freqs(1:end)*60);
save('save_aux', 'aux', 'time');
pwers = aux(1:end)';
hold on
ex = 1./(old_freqs(1:end)*60);
ex1 = ceil(ex(1));
ex2 = floor(ex(end));
 
set(gca,'Xlim',[ex1 ex2],'FontName','Calibri','FontSize',8,'XTick',[ex1 60 100 ex2])%,'XTickLabel',{'20','70','120'})
xlabel('min','FontName','Calibri','FontSize',10)
ylabel('sa','FontName','Calibri','FontSize',10)
title(crs,'FontName','Calibri','FontSize',12)

end
