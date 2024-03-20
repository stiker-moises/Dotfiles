#!/usr/bin/env python

import sys
from lifxlan import LifxLAN, Light

def main ():
    #bedroom
    computer1 = Light("d0:73:d5:71:9d:75", "192.168.1.74")
    computer2 = Light("d0:73:d5:6a:fa:56", "192.168.1.113")
    stairs = Light("d0:73:d5:72:0b:74", "192.168.1.230")
    living = Light("d0:73:d5:71:a4:a2", "192.168.1.117")
    #icecream
    close = Light("d0:73:d5:72:0a:b0", "192.168.1.218")
    #bathroom
    bathroom1 = Light("d0:73:d5:6a:2a:41", "192.168.1.43")
    bathroom2 = Light("d0:73:d5:6a:31:e0", "192.168.1.200")
    bathroom3 = Light("d0:73:d5:68:bd:df", "192.168.1.73")
    close.set_power(0, 0.2)
if __name__=="__main__":
    main()
