#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os, time, sys, shutil

# defined
beforeDay = 10
dir_path_set = [{'path':'D:\\website\\image.xx.com\\Contract', 'beforeday': 2},
                ]


def delFiles(dirpath, day_num):
    beforeSec = time.time() - 3600 * 24 * day_num
    for i in os.listdir(dirpath):
        filepath = "%s%s%s" %(dirpath, os.sep, i)
        if os.path.getmtime(filepath) < beforeSec:
            try:
                if os.path.isfile(filepath):
                    os.remove(filepath)
                else:
                    shutil.rmtree(filepath)

            except Exception as e:
                print(e)

if __name__ == '__main__':
    
    for dir_path_inst in dir_path_set:
        if dir_path_inst.has_key('beforeday'):
            delFiles(dir_path_inst['path'], dir_path_inst['beforeday'])
        else:
            delFiles(dir_path_inst['path'], beforeDay)