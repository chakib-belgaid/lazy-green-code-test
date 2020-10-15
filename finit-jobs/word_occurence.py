
# Created by sarathkaul on 17/11/19
# Modified by Arkadip Bhattacharya(@darkmatter18) on 20/04/2020
from collections import defaultdict


def word_occurence(sentence: str) -> dict:
    """
    >>> from collections import Counter
    >>> SENTENCE = "a b A b c b d b d e f e g e h e i e j e 0"
    >>> occurence_dict = word_occurence(SENTENCE)
    >>> all(occurence_dict[word] == count for word, count
    ...     in Counter(SENTENCE.split()).items())
    True
    >>> dict(word_occurence("Two  spaces"))
    {'Two': 1, 'spaces': 1}
    """
    occurrence = defaultdict(int)
    # Creating a dictionary containing count of each word
    for line in sentence:
        for word in line.split():
            occurrence[word] += 1
    return occurrence


if __name__ == "__main__":
    i=0
    for i in range(10**3):
        with open("../../pyinstrument/lab/shekspear.txt", 'r')as f:
            i=0
            for word, count in word_occurence(f.readlines()).items():
                # print(f"{word}: {count}")
                i+=count
                # x=count
    print(i)
