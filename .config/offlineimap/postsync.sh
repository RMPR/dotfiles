#!/bin/sh
notmuch new
notmuch tag -inbox +sent from:akoudanilo@gmail.com
notmuch tag +sent -- folder:Sent and not tag:sent
notmuch tag -inbox folder:Archive
