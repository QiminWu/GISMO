function plot(w)

%PLOT plot fourier transform of a waveform
% PLOT(WAVEFORM) creates a simple plot of the frequency vs. amplitude 
% spectrum of the traces in WAVEFORM. This function requires that the 
% FFT_AMP and FFT_FREQ fields have been filled using WF_FFT.COMPUTE
%
% see also wf_fft.compute

% Author: Michael West, Geophysical Institute, Univ. of Alaska Fairbanks
% $Date$
% $Revision$
% TODO: written pretty hastily and inefficiently - MEW 6/18/2007


% CHECK ARGUMENTS
if ~strcmpi(class(w),'waveform')
    error('First input must be a waveform object');
end

Fs = round(get(w,'Fs'));
if ~isempty(find(Fs-mean(Fs)))
   error('Waveforms must have the same sample rate'); 
end


%if ~isfield(w,'FFT_AMP')
%    error('waveform must contain FFT fields. Run WF_FFT.COMPUTE first');
%end;



% MAKE LOG PLOT
figure('Color','w','Position',[50 200 800 600]);
set(gcf,'DefaultAxesFontSize',14);
hold on; box on; grid on;
cmap = lines;
for n = 1:numel(w)
    col = round(size(cmap,1)*rand(1));
    col = cmap(col,:);
    plot( get(w(n),'FFT_FREQ') ,  get(w(n),'FFT_AMP') , 'Color' , col );
end;
set(gca,'XScale','log');
%set(gca,'YScale','log');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

