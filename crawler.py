import bs4 as bs
import asyncio as aio
import os
from urllib.request import urlopen


async def download_problem(index):
    r = urlopen("https://projecteuler.net/problem={}".format(index))
    soup = bs.BeautifulSoup(r.read())
    problem_name = soup.select('h2')[0].text
    filename = "{:0>3}_{}.hs".format(index, problem_name.replace(' ', '_').replace('/', '_').lower())
    if os.path.exists(filename):
        print("Skipped problem {:0>3}".format(index))
        return

    problem_content = '\n'.join(
            "-- " + p.text for p in soup.select(".problem_content")[0].find_all('p')) + "\n"
    with open(filename, 'w') as f:
        f.write(problem_content)
    print("Downloaded problem {:0>3}".format(index))


def get_last():
    r = urlopen("https://projecteuler.net/recent")
    soup = bs.BeautifulSoup(r.read())
    return int(soup.select("#problems_table")[0].find_all('td')[0].text)


async def download_all(first=1):
    last = get_last()
    await aio.wait([download_problem(i) for i in range(first, last + 1)])


def main():
    aio.get_event_loop().run_until_complete(download_all())


if __name__ == '__main__':
    main()
