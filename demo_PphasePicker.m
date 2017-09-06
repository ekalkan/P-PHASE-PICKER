%   This is a demo showing the use of PphasePicker using a set of sample
%   acceleration waveforms
%
%   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
%   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
%   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
%   NO EVENT SHALL THE COPYRIGHT OWNER BE LIABLE FOR ANY DIRECT, INDIRECT,
%   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
%   BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
%   OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
%   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
%   TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
%   USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
%   DAMAGE.
%
%   Written by Dr. Erol Kalkan, P.E. (ekalkan@usgs.gov)
%   $Revision: 2.0 $  $Date: 2017/02/17 16:30:00 $
clear; clc; close all;

%% Example 1 (ACCELERATION WAVEFORM)
% Load strong-motion acceleration waveform (component HNN of station
% CE.68150 record from the 2014 M6.0 South Napa earthquake in California).

load ('strong-motion.mat');    

%% Run PphasePicker with default picking parameters
type = 'SM'; % Input type is strong motion  
pflag = 'Y'; % To plot waveform and P-phase onset

[loc] = PphasePicker(x, dt, type, pflag);
pause(2);

% Run PphasePicker with optional picking parameters
Tn = 0.01;      % undamped natural period of oscillator in second 
xi = 0.6;       % damping ratio 
nbins = 200;    % histogram bin size
o = 'to_peak'   % 'to_peak' to take segment of waveform from beginning to
                % absolute peak value
[loc, snr_db] = PphasePicker(x, dt, type, pflag, Tn, xi, nbins, o);

pause(2); 

%% Example 2 (VELOCITY WAVEFORM WITH HIGH SAMPLING RATE)
% Load micro seismic velocity waveform with 6000 samples-per-second

load ('weak-motion.mat');    

%% Run PphasePicker with optional picking parameters
type = 'na'; % no bandpass filtering  
pflag = 'Y'; % To plot waveform and P-phase onset

Tn = 0.01;      % undamped natural period of oscillator in second 
xi = 0.6;       % damping ratio 
nbins = 200;    % histogram bin size
o = 'to_peak'   % 'to_peak' to take segment of waveform from beginning to
                % absolute peak value
[loc, snr_db] = PphasePicker(x, dt, type, pflag, Tn, xi, nbins, o);

%% Example 3 (ACCELERATION WAVEFORM WITH LOW SAMPLING RATE)
% Load acceleration waveform with 80 samples-per-second

load ('acc-motion_low_sampling.mat');    

%% Run PphasePicker with optional picking parameters
type = 'na'; % no bandpass filtering  
pflag = 'Y'; % To plot waveform and P-phase onset

% USE Tn = 0.1 for records with low sampling rate lower than 100 sps 
Tn = 0.1;       % undamped natural period of oscillator in second 
xi = 0.6;       % damping ratio 
nbins = 200;    % histogram bin size
o = 'to_peak'   % 'to_peak' to take segment of waveform from beginning to
                % absolute peak value
[loc, snr_db] = PphasePicker(x, dt, type, pflag, Tn, xi, nbins, o);

