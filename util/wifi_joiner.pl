#!/usr/bin/perl

my @network_data = 
(
	{ 
    essid => 'HD036',
    desc => 'Seems like the best signal so far',
    key  => '34353453656544453238396233',
  },
  {
    essid => 'baro bax',
    desc => 'doesnt seem to work now',
    key  => '68616D6564686F6A6174323430',
  },
  {
    essid => 'sharmini',
    desc => 'first wep only key, bad signal',
    key  => '0321430835',
  },
  {
    essid => 'tenda',
    desc => 'terrible signal :(',
    key  => '68616D65643133353831333539',
    #key  => '68616D65643133353831333539',
  },
  {
    essid => '0661B0',
    desc => 'dunno',
    key  => '661B01FFB0',
  },
  {
    essid => 'X-Zone',
    desc => '?',
    key  => '31323334353637383930616263',
  },
  {
    essid => 'GetronicsKL',
    desc => 'lots of clients',
    key  => '476574726F6E69637331323334',
  },
);

    my $i = 0;
    foreach my $network (@network_data)
    {
      print '['.$i.'] essid['.$network->{'essid'}
        .'] note['.$network->{'desc'}."]\n";
      $i++;
    }
    print '>>Join which network: ';
    my $selection = <STDIN>;
    chomp $selection;
    print '>>joining['.$selection.']'."\n";
# joining

my $command;
# eth1 down
print '>>taking eth1 down...'."\n";
$command = 'ifconfig eth1 down';
exec_and_print($command);
# put card in managed mode
print '>>put eth1 in managed mode...'."\n";
$command = 'iwconfig eth1 mode managed';
exec_and_print($command);

print '>>joining network...'."\n";
$command = 
'iwconfig eth1 essid "'
. $network_data[$selection]->{'essid'}
. '" key restricted '
. $network_data[$selection]->{'key'};

exec_and_print($command);

print '>>bringing eth1 up...'."\n";
$command = 
'ifconfig eth1 up';
exec_and_print($command);

print '>>dhcp on eth1'."\n";
$command = 
'dhclient eth1';
exec_and_print($command);

sub exec_and_print
{
  my $command = shift;
  print 'executing['.$command.']'."\n";
  print `$command`;
}


