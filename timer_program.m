clear; clc;
%Prepare the alarm sound vector

secTone = 0.2;%Indicates how many seconds the tone will last
hertz = [300 400 500];%an array of pitches in Hz
sample_rate = 8192;%The default sample rate of the sound function is 8,192 samples per second
timeTone = [0:1/sample_rate:secTone];%Creates a time vector with secTone*sample_rate elements that lasts "secTone" seconds
toneSeq = [sin(2*pi*hertz(1)*timeTone); sin(2*pi*hertz(2)*timeTone); sin(2*pi*hertz(3)*timeTone)];%Creates vectors for the "hertz" Hz sine waves

secSilence = 0.1;%Seconds of silence between tones
timeSilence = [0:1/sample_rate:secTone];%Creates a time vector that lasts for "secSilence" seconds
silenceSeq = timeSilence * 0;%Creates a vector of sound wave for the silence

alarmSoundSeq = [toneSeq(1,:) silenceSeq toneSeq(2,:) silenceSeq toneSeq(3,:)];%Concatenates the sound and silence vectors

ifContinue = 1;
while ifContinue == 1
    numSec = input('Input a number to count down from: ');
    if numSec > 0
        pause(numSec); %pause for specified number of seconds
        disp('Time is up');
        sound(alarmSoundSeq) %Play the sound
    else
        ifContinue = 0; %end loop
    end
end
disp('The program has ended');