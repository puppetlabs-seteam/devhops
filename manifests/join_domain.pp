class devhops::join_domain {
  dsc_xComputer { 'JoinDomain':
    dsc_name       => $trusted['certname']
    dsc_domain     => $domainname,
    dsc_credential => {
      'user'     => 'Administrator',
      'password' => Sensitive($localadminpw)
    }
  }
}
