class devhops::join_domain {
  $joinpassword = lookup('devhops::windows_domain::join_password')
  $query        = "inventory[facts] { facts.hostname ~ 'windchops' }"
  $response     = puppetdb_query($query)
  $dcip         = $response[0]['facts']['ipaddress']

  dsc_xdnsserveraddress { 'dnsserveraddress':
    dsc_address        => $dcip,
    dsc_interfacealias => 'ethernet',
    dsc_addressfamily  => 'ipv4',
    before             => Dsc_xComputer['JoinDomain']
  }

  dsc_xComputer { 'JoinDomain':
    dsc_name       => $trusted['certname'],
    dsc_domainname => lookup('devhops::windows_domain::domainname'),
    dsc_credential => {
      'user'     => lookup('devhops::windows_domain::join_user'),
      'password' => Sensitive($joinpassword)
    }
  }
}
