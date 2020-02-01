#!/usr/bin/env python

import subprocess
import optparse
import re

def get_arguments():
    parser = optparse.OptionParser()
    parser.add_option("-i", "--interface", dest="interface", help="interface to change the mac address")
    parser.add_option("-m", "--mac", dest="new_mac", help="new mac address")
    #parser.parse_args() retorna los valores ingresados pero parseados (los convierte al tipo de dato correspondiente y ademas retorna el argumento al cual corresponde)
    #options = user imput and arguments = --interface --mac
    (options, arguments) = parser.parse_args()
    if not options.interface:
        parser.error("[-] You have to specify an interface, use --help for more info.")
    elif not options.new_mac:
        parser.error("[-] You have to specify a new mac, use --help for more info.")
    return options

def mac_checker(interface):
    # checkea y guaarda la salida del comando ifconfig en la variable ifconfig_check
    ifconfig_check = subprocess.check_output(["ifconfig", interface])

    # iguala la variable a una forma de un patron de alfanumericos con : para poder filtrar solo mac por regex
    mac_address_check_result = re.search(r"\w\w:\w\w:\w\w:\w\w:\w\w:\w\w", ifconfig_check)

    #verificamos las macs y retornamos valor de funcion si se encuentra

    if mac_address_check_result:
        return mac_address_check_result.group(0)
    else:
        print("[-] Could not find a MAC in this interface")

def mac_changer(interface, new_mac):
    print("[+] Changing mac address for " + interface + " to " + new_mac)
    subprocess.call(["ifconfig", interface, "down"])
    subprocess.call(["ifconfig", interface, "hw", "ether", new_mac])
    subprocess.call(["ifconfig", interface, "up"])


#iguala la variable options a lo que se retorna de la funcion get arguments
#(se retorna solo las opciones que ingreso el usuario no los argumentos debido a que no se necesitan)
options = get_arguments()

#verifica la mac actual
current_mac = mac_checker(options.interface)
print("Current MAC = " + str(current_mac))

#inicia la funcion mac_changer y ademas setea los valores obtenidos de los argumentos
mac_changer(options.interface, options.new_mac)

#checkea si la mac se cambio a la que el usuario queria
current_mac = mac_checker(options.interface)
if current_mac == options.new_mac:
    print("[+] Mac address was successfully changed to " + current_mac)
else:
    print("[-] Mac did not get changed")