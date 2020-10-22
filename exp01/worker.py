
from sys import argv
import time
import math
import sys
# 0.00001 --> 16%
import multiprocessing

levels = [
    (1, 0.01)      ,# %
    (1, 0.001)     ,# %
    (1, 0.0001)    ,# %
    (10, 0.0001)   ,# %
    (50, 0.0001)   ,# %
    (100, 0.0001)  ,# %
    (300, 0.0001)  ,# %
    (800, 0.0001)  ,# %
    (1000, 0.0001) ,# %
    (2000, 0.0001) ,# %
    (5000, 0.0001) ,# %
    (10000, 0.0001),# %
    (1, 0)          # %
]


def worker(sleepduration=0, loop=1):
    while True:
        for i in range(loop):
            math.sqrt(33)
        time.sleep(sleepduration)


# libc = ctypes.CDLL('libc.so.6')

def main():

    cpu_count = int(sys.argv[1])
    loop , sleepduration = levels[int(argv[2])]
    for i in range(cpu_count):
        x = multiprocessing.Process(target=worker, args=[sleepduration, loop], daemon=False)
        x.start()


if __name__ == "__main__":
    main()
