#!/usr/bin/env python

import argparse
import os
from sets import Set


EXCLUDE = (
    '.DS_STORE',
    'install.py',
    'README.md',
    'LICENSE-MIT.txt',
    '.git',
    'init',
    'update_submodules.sh'
)

def get_files(current_dir):

    files = os.listdir(current_dir)
    files = Set([f for f in files if os.path.isfile(f)])

    return files - Set(EXCLUDE)


def backup_existing(dest, dry_run=False):
    backup_path = "%s.bak"
    if os.path.exists(dest):
        print "Destination file %s exists" % dest
        print "Moving to backup %s" % backup_path % dest
        if not dry_run:
            backup = backup_path % dest
            os.rename(dest, backup)
            return backup


def create_link(src, dest, dry_run=False):
    msg = "Creating link from %s to %s" % (src, dest)
    if not dry_run:
        os.symlink(src, dest)
    else:
        msg = "Not %s (dry run)" % msg

    print msg


def create_links(current_dir, files, dry_run=False):
    msg = """
################################################################################
#                               Symlinking Files                               #
################################################################################
    """

    print msg
    home = os.path.expanduser("~")
    for f in files:
        src = os.path.join(current_dir, f)
        dest = os.path.join(home, f)
        backup_existing(dest, dry_run)
        create_link(src, dest, dry_run)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=(
            "Install dotfiles by symlinking to the home directory. "
            "If a file exists it will be renamed with a bak extension "
            "All files in this directory will be symlinked excluding: "
            "%s"
        ) % ', '.join(EXCLUDE)
    )
    parser.add_argument(
        '--dry_run',
        help='Print actions without performing them.',
        action='store_true'
    )
    args = parser.parse_args()
    current_dir = os.path.dirname(os.path.abspath(__file__))
    create_links(current_dir, get_files(current_dir), dry_run=args.dry_run)


