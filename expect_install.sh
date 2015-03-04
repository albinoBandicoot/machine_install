#!/usr/bin/expect

set prog [lindex $argv 0];
set machine [lindex $argv 1];
set password [lindex $argv 2];

set timeout -1

spawn ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no "labmin@$machine"

expect "password" {send "$password\n"}

expect "$ " {send "sudo apt-get install -y $prog\n"}
expect "password" {send "$password\n"}

expect "$ " {send "exit\n"}

