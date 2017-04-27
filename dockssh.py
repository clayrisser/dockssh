#!/usr/bin/env python

import os
from cement.core.foundation import CementApp
from cement.utils.misc import init_defaults

defaults = init_defaults('dockssh')
defaults['dockssh']['debug'] = False

class DockSSH(CementApp):
    class Meta:
        label = 'dockssh'
        config_defaults = defaults

with DockSSH() as app:
    app.args.add_argument('-e', '--exec', action='store_true', dest='execute')
    app.args.add_argument('image')
    app.run()
    if app.pargs.image:
        res = 0
        app.log.info('trying bash')
        if app.pargs.execute:
            res = os.system('docker exec -it ' + app.pargs.image + ' /bin/bash')
        else:
            res = os.system('docker run -it --entrypoint /bin/bash ' + app.pargs.image)
        if (res > 0):
            app.log.info('trying sh')
            if app.pargs.execute:
                res = os.system('docker exec -it ' + app.pargs.image + ' /bin/sh')
            else:
                res = os.system('docker run -it --entrypoint /bin/sh ' + app.pargs.image)
            if (res > 0):
                app.log.error('failed to ssh into docker image')
                exit(1)
