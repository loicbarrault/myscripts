#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Convert SGM file with document information into separate document
Optionally add a date to match the format of the ALLIES LLMT evaluation campaign
"""

import sys
import os
import re
import pathlib

from datetime import datetime
import argparse

parser = argparse.ArgumentParser(description="SGM to documents for ALLIES LLMT eval campaigns.", epilog="The files will be named like this dest_dir/prefix-date-NUM-DOCID.txt, where NUM is a 3 digits integer incrementing for each file and DOCID is the document ID provided in the SGM file",
formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-s', '--sgm', type=str, required=True, help='Input file in SGM format with document information')
parser.add_argument('-o', '--odir', type=str, required=True, help='Output directory')
parser.add_argument('-p', '--prefix', type=str, default='corpus', help="Prefix identifying the corpus/source [default: 'corpus'], e.g.  'nc' for NewsCommentary, 'ep' for Europarl")
parser.add_argument('-d', '--date', type=str, default=datetime.today().strftime('%Y%m%d'), help="Date in the format YYYYMMDD [default: today's date]")

args = parser.parse_args()

if os.path.exists(args.odir):
    print("ERROR: {} exists already, please remove it before or choose another destination directory.".format(args.odir))
    sys.exit(0)
else:
    pathlib.Path(args.odir).mkdir(parents=True, exist_ok=True)

#<doc sysid="dummy" docid="1009-lemondefr" genre="news" origlang="fr">
pdocid = re.compile("<doc.*docid=\"([^\"]+)\"")
penddoc = re.compile("</doc>")
pseg = re.compile("<seg id=\"[^\"]*\">(.*)</seg>")

ofile = None
NUM=0

with open(args.sgm, 'r') as fd:
    for line in fd:
        if ofile is None:
            m = pdocid.search(line)
            if m:
                docid = m.group(1)
                NUM += 1
                #print("Found document #{} {}".format(NUM, docid))
                ofile = open("{}/{}-{}-{:03d}-{}".format(args.odir, args.prefix, args.date, NUM, docid), 'w')
        else:
            m = enddoc = penddoc.search(line)
            if m:
                ofile.close()
                ofile =  None
            else:
                m = pseg.search(line)
                if m:
                    #print("SEG: #{}#".format(m.group(1)))
                    ofile.write("{}\n".format(m.group(1)))
                else:
                    print(" ---- BAD SGM FILE FORMAT for document = {}, was expecting <seg ...> or </doc> balisa".format(docid))
                    sys.exit(0)




