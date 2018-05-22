class devhops::join_domain {
  $joinpassword = lookup('devhops::windows_domain::join_password')

  dsc_xComputer { 'JoinDomain':
    dsc_name       => $trusted['certname'],
    dsc_domainname => lookup('devhops::windows_domain::name'),
    dsc_credential => {
      'user'     => lookup('devhops::windows_domain::join_user'),
      'password' => Sensitive($joinpassword)
    }
  }
}
