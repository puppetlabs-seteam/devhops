class devhops::join_domain {
  dsc_xDSCDomainjoin { 'JoinDomain':
    dsc_domain     => $domainname,
    dsc_credential => {
      'user'     => 'Administrator',
      'password' => Sensitive($localadminpw)
    }
  }
}
