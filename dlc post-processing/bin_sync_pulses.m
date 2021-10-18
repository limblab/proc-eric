function binned_sync_pulses = bin_sync_pulses(video_sync_pulses, bin_width, analog_fs)
% turns out this is a fool's errand, going to need to fix the actual pulse
% width

on_off = [];
for ts = 1:length(video_sync_pulses)
    if video_sync_pulses(ts)<10
        on_off(ts) = 0;
    else on_off(ts) = 1;
    end
end

DF = 1/bin_width; %desired frequency
SF = 1/analog_fs; %sample frequency

pulse_change = ischange(on_off);
change_idx = find(pulse_change);

on = change_idx(1:2:end);
off = change_idx(2:2:end);
avg_pulse_width = mean(off - on);
pulse_width_seconds = avg_pulse_width * SF;
pulse_width_bins = pulse_width_seconds * DF;

DF = 1/bin_width; %desired frequency
SF = 1/analog_fs; %sample frequency
[p,q]=rat(DF/SF,.001);

binned_sync_pulses = resample(on_off,q,p);

for ts = 1:length(binned_sync_pulses)
    if binned_sync_pulses(ts)<0.098
        binned_sync_pulses(ts) = 0;
    else binned_sync_pulses(ts) = 1;
    end
end


binned_sync_pulses = round(down);
