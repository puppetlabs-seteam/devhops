class devhops::join_domain {
  dsc_xComputer { 'JoinDomain':
    dsc_name       => $trusted['certname'],
    dsc_domainname => $domainname,
    dsc_credential => {
      'user'     => 'Administrator',
      'password' => Sensitive($localadminpw)
    }
  }
}
