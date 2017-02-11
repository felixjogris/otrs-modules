#!/usr/bin/perl -w

package Kernel::System::Auth::Fail;

use strict;
use warnings;

our @ObjectDependencies = (
  "Kernel::Config",
  "Kernel::System::Log",
);

sub new ()
{
  my ($Type, %Param) = @_;

  my $Self = {};
  bless($Self, $Type);

  foreach (qw(Count)) {
    if (!defined $Param{$_}) {
      $Kernel::OM->Get("Kernel::System::Log")->Log(
        Priority => "error",
        Message  => "Got no $_!",
      );
      return;
    }
    $Self->{$_} = $Param{$_};
  }

  return $Self;
}

sub GetOption ()
{
  my ($Self, %Param) = @_;

  foreach (qw(What)) {
    if (!$Param{$_}) {
      $Kernel::OM->Get("Kernel::System::Log")->Log(
        Priority => "error",
        Message  => "Got no $_!",
      );
      return;
    }
  }

  my %Options = (
    PreAuth => 0,
  );

  return $Options{$Param{What}};
}

sub Auth ()
{
  my ($Self, %Param) = @_;

  my $UserName = $Param{User} || "";
  my $RemoteAddr = $ENV{REMOTE_ADDR} || "Got no REMOTE_ADDR env!";

  $Kernel::OM->Get("Kernel::System::Log")->Log(
    Priority => "error",
    Message  => "AUTHFAIL" . $Self->{Count} . ":" . $RemoteAddr . " USERNAME:" . $UserName,
  );

  return;
}

1;
