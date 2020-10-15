import time 
def worker(n=3):
    res = 2
    for i in range(2*10**n):
        for _ in range(100):
            res *= 2
        # time.sleep(0.1)
        for _ in range(100):
            res *= 2
    return res


def main():
    worker()

if __name__ == "__main__":
    main()
