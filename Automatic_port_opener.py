#!/usr/bin/env python3

import os

def server_opener(port, name):
    print("oppening port " + port + " for server " + name)
    os.system("netsh advfirewall firewall add rule name=%s dir=in action=allow protocol=TCP localport=%s" % (name, port))

print("Developed by Matias Repetto")
	
port1 = input("Insert port to open: ")
name1 = input("Name for the service (server): ")

server_opener(port1, name1)

