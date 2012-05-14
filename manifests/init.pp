class postgis {
  case $operatingsystem {
    Debian: {
      case $lsbdistcodename {
        etch,lenny :  { include postgis::debian::v8-3 }
        squeeze    :  { include postgis::debian::v8-4 }
        default: { fail "postgis not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    Ubuntu: {
      case $lsbdistcodename {
        lucid  :   { include postgis::ubuntu::v8-4 }
        oneiric,precise :   { include postgis::ubuntu::v9-1 }
        default:   { fail "postgis not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}
