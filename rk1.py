import pyperclip
from time import sleep
while True:
    i = pyperclip.paste()
    ni = i
    while ("  " in i): 
        i = i.replace("  ", " ")
    if (ni != i):
        print(ni, ">>", i)
        pyperclip.copy(i)
    sleep(0.1)


