
import time
import math
# 0.00001 --> 16%
import multiprocessing


def worker(sleepduration=0, loop=1):
    while True:
        for i in range(loop):
            math.sqrt(33)
        time.sleep(sleepduration)


# libc = ctypes.CDLL('libc.so.6')

def main():
    cpu_count = 2
    loop = 10
    sleepduration = 0.00001
    for i in range(cpu_count):
        x = multiprocessing.Process(target=worker, args=[sleepduration, loop])
        x.start()


if __name__ == "__main__":
    main()
