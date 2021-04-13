file = "test.txt"
f = open(file,'r')
text = f.read()
f.close()
words = text.split()
i = 0;
while i < len(words):
    words[i] = words[i].lower()
    if not words[i].isalpha():
        if words[i][:len(words[i])-1].isalpha():
            words[i] = words[i][:len(words[i])-1]
    i += 1
words.sort()
word_dict = {}
i = 0;
while i < len(words):
    if words[i] not in word_dict:
        word_dict[words[i]] = 1
    else:
        word_dict[words[i]] += 1
    i += 1
print(word_dict)