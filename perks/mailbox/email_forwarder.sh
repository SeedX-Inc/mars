#!/bin/sh
#chmod is -rwxrwxr-x OR 775

export HOME=/home/deploy
#export PATH=/home/deploy/.rvm/wrappers/ruby-3.0.0@r6131-email/ruby
export PATH=/home/deploy/.rvm/gems/ruby-3.0.0@r6131-email/bin:/home/deploy/.rvm/gems/ruby-3.0.0@global/bin:/home/deploy/.rvm/rubies/ruby-3.0.0/bin:/home/deploy/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/deploy/.rvm/bin
cd /home/deploy/eproto && /home/deploy/.rvm/wrappers/ruby-3.0.0@r6131-email/ruby bin/rails action_mailbox:ingress:postfix URL='http://seedx.space/rails/action_mailbox/relay/inbound_emails' INGRESS_PASSWORD='qwerty'
