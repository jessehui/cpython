
import time
import multiprocessing as mp

def job():
    print(1)

start = time.time()

if __name__ == '__main__':
    mp.set_start_method('spawn')
    pool = mp.Pool(processes=4)
    for i in range(4):
        pool.apply(job)
        print("total time {}".format(time.time() - start))


