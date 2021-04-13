%Prepare the alarm sound vector
secTone = 0.5;%Indicates how many seconds a tone in our example will last
hertz = 440;%The tone is a standard pitch (440Hz) in our example
sample_rate = 8192;%The default sample rate of the sound function is 8,192 samples per second
timeTone = [0:1/sample_rate:secTone];%Creates a time vector that has about secTone*sample_rate elements and will last for "secTone" seconds for the tone when played by the sound function
toneSeq = sin(2*pi*hertz*timeTone);%Creates a vector of a "hertz" Hz sine wave for the tone with the time vector

secSilence = 0.5;%Indicates how many seconds of silence between each instance of the sine wave of the tone
timeSilence = [0:1/sample_rate:secTone];%Creates a time vector that will last for "secSilence" seconds for the silence when played by the sound function
silenceSeq = timeSilence * 0;%Creates a vector of sound wave for the silence

alarmSoundSeq = [toneSeq silenceSeq toneSeq silenceSeq toneSeq];%Creates a longer sound signal vector by concatenating (and assembling) previously-created vectors. The square brackets made a larger row vector by "mixing" the two row vectors we created before

%Sound output: Play the alarm sound
sound(alarmSoundSeq) %Play the sound based on the sequence of the alarmSoundSeq vector
