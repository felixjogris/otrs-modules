AuthFail
========

Authentication module which always fails. It was written with Fail2ban in mind.

Usage
-----
1. Copy scripts/fail2ban/jail.d/otrs.local and scripts/fail2ban/filter.d/otrs.local to /etc/fail2ban/jail.d and /etc/fail2ban/filter.d, respectively (or wherever your Fail2ban configuration resides). Edit both files to suit your environment and restart Fail2ban.
2. Add these 2 lines to Kernel/Config.pm:
```
$Self->{"AuthModule10"} = 'Kernel::System::Auth::Fail';
$Self->{"Customer::AuthModule10"} = 'Kernel::System::Auth::Fail';
```
