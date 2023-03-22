function [y2] = dataaq_simple()
% [y2] = dataaq_simple()
%Wait for beep to start speaking, stop after the second beep, wait 5
%second, repeat.

%%to check hardware id
% audiodevinfo

fs=8000;
bitrate=16;
num_of_channels=1;
channelID=1;
duration=6;

%record object
recobj=audiorecorder(fs,bitrate,num_of_channels,channelID);

%recording audio to object
beep
disp('record start')
recordblocking(recobj,duration);
disp('record stop')
beep
y=getaudiodata(recobj)';
pause(5);
beep
disp('record start')
recordblocking(recobj,duration);
disp('record stop')
beep
y2=getaudiodata(recobj)';
%this is to prevent recording buggs at the beginning of recording
y=y(fs+1:length(y)-fs);
y2=y2(fs+1:length(y2)-fs);
y=[y,y2];
clear y2
%playback
% play(recobj);

% %data filtering
y2=filter([1,-0.95],1,10*y);

