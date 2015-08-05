class resolvconf (
  $header     = 'This file is managed by Puppet, do not edit',
  $nameserver = [],
  $domain     = '',
  $search     = [],
  $sortlist   = [],
  $options    = [],
) {

  resolvconf::file { '/etc/resolv.conf':
    header     => $header,
    nameserver => $nameserver,
    domain     => $domain,
    search     => $search,
    sortlist   => $sortlist,
    options    => $options,
  }

}
