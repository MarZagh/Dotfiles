#!/bin/python

from rofi import Rofi
import os
r = Rofi()

options  = [
#        'Shutdown     ⏻', 
#        'Reboot       ', 
#        'Sleep        ', 
#        'Quit i3      ', 
#        'Lock         '
        'Shutdown', 
        'Reboot', 
        'Sleep', 
        'Hibernate',
        'Quit Desktop', 
        'Lock'
        ]

commands = [
        '~/bin/util/shutdown.sh', 
        'reboot', 
        '~/bin/util/sleep.sh', 
        '~/bin/util/hibernate.sh',
        '~/bin/util/quit.sh', 
        '~/bin/util/lock.sh'
        ]

index, key = r.select('Exit', 
        options, 
        lines=len(options)+1, 
        width=30)

if key == 0:
    confirm = r.select('Are you sure?', 
            ['Yes', 'No'], 
            lines=3, 
            width=20)[0]
    print(confirm)

    if confirm == [0]:
        os.system(commands[int(index[0])])
