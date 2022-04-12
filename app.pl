#!/bin/perl

# author:   Bayu Riski A.M
# github:   Speedrun-bash
# license:  MIT License
# version:  1.0
# date:     2022-04-12

use strict;
use warnings;

use Term::ANSIColor;
use File::Basename qw(dirname);
use feature qw(say);
use POSIX qw(strftime);
use lib '.';
use lib::shell qw(cli);

use threads;
use Socket;
require Net::DNS::Nslookup;

my $bi = color("bold blue");
my $ku = color("bold yellow");
my $m = color("bold magenta");
my $ij = color("bold green");
my $me = color("bold red");
my $hi = color("black");
my $cy = color("bold cyan");
my $pu = color("bold white");
my $st = color("bold reset");

sub machine {

    my $random1 = int(rand(0 - 99999999999) % 250);
    my $random2 = int(rand(0 - 99999999999) % 250);
    my $random3 = int(rand(0 - 99999999999) % 250);
    my $random4 = int(rand(0 - 99999999999) % 250);
    no warnings 'uninitialized';
    my $addr = "$random1.$random2.$random3.$random4";
    say("${ku}<${me}address${ku}> \033[0;1;41mBOT IP $st\t$addr");
    my $a = gethostbyaddr(inet_aton($addr), AF_INET) and print("") or return "Not Found";
    if (defined("$a")) {
        print;
    }
    if (!defined($a)) {
        print;
    } else {
        return "$a";
    }
}

sub resol {
    my ($host,$dummy) = @_;

    my $machine = Net::DNS::Nslookup->get_ips($host);
    $machine =~ s/$host//g;
    $machine =~ s/\n//g;
    my @array = split(',',$machine);

    return "$array[1]";
}

sub machine::domain::ip {
     my ($files) = @_;
     #no warnings "Unquoted";
     open(my $file,'<:encoding(UTF-8)',$files) or die "tidak bisa membuka file tersebut";
     while (my $row = <$file>) {
        chomp($row);
        my $res = resol($row);
        open(my $fh,">>","result.txt") or die $!;

        say("${ij}> \033[0;1;41mBOT INFO$st \tDone");
        say("${bi}> \033[0;1;42mHOSTNAME$st$ij \t$row");
        say("${ku}> \033[0;30;47mLIST FILE$st \t$files");
        print("${me}> \033[0;1;46mADDR IP$st$hi  \t$res");
        say("\n");

        say $fh "Result $row => [$res]";
        close($fh);
     }

}

sub banner {
    system("clear");
    say("${m}╔═╗${cy}┌─┐┌┬┐┌─┐╦    ${m}╔═╗${me}┌─┐┌┐┌┌┬┐┌─┐┌─┐┌┬┐$ku | ${hi}* Author  : Speedrun (polygon)");
    say("${m}║  ${cy}├─┤│││├┤ ║    ${m}╠═╝${me}├─┤│││ │ ├┤ └─┐ │$ku  | ${hi}* github  : Speedrun-bash & Bayu12345677");
    say("${m}╚═╝${cy}┴ ┴┴ ┴└─┘╩═╝  ${m}╩  ${me}┴ ┴┘└┘ ┴ └─┘└─┘ ┴$ku  | ${hi}* youtube : pejuang kentang");
    say("  ${ij} threading           $bi process");
    say("${m}-----------------------------------------------------------------------");
    say("${me}1${st}.${hi} generator ip ${ku}(${me}fast${ku})");
    say("${me}2${st}.${hi} domain to ip ${ku}(${me}fast${ku})");
    say("${m}-----------------------------------------------------------------------");
    print("${me}Chosse${me}> $st");
    my $app = <>;
    chomp($app);

    if (not defined($app) && $app ne "") {
        say "";
        say("${me}msg$pu :${ku} input not found");
        exit;
    }

    if ($app == 1 or $app == 01) {
        say('');
        say("${me}>${ij} bot $hi\tsystem start");
        say("${ku}>$me msg $hi\tstarting\n");

        while (1) {
            my $sys = threads->create(\&machine);
            my $thr = $sys->join();

            say("${me}<${pu}system${ku}>  \033[0;1;41mBOT INFO$st  \t${ij}process");
            say("${ku}<${pu}system${ku}>  \033[0;1;42mMSG BOT$st   \t${ku}DONE");
            say("${cy}<${pu}output${cy}>  \033[0;1;46mBOT RESULT$st $hi\t$thr$st\n");
        }
    } elsif ($app == 02 && $app == 2) {
        say "";
        say("${ku}*$pu times    $hi\t",strftime("%H:%M:%S",localtime));
        say("${cy}*$pu bot type $hi\tRESOLVEIP$st\n");
        print("${me}your files${ij}> ");
        my $p = <>;
        chomp($p);

        say "";

        if (not defined($p) and $app ne "") {
            say "${me}>$hi input not found$st";
            exit;
        }

        my $thr_token = threads->create(\&machine::domain::ip,"$p");
        my $send = $thr_token->join();
    }
}

{
    system("clear");
    say("${ku}#$hi subscribe pejuang kentang$st");
    sleep 4;
    system("xdg-open https://www.youtube.com/channel/UCtu-GcxKL8kJBXpR1wfMgWg");
    banner();
}