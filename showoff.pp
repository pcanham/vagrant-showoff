node default {

  package { 'git':
		ensure => installed,
	}

  package { 'ImageMagick-devel':
		ensure => installed,
		before => Package['rmagick'],
	}

  package { 'thin':
    ensure   => '1.3.1',
    provider => gem,
    before   => Package['showoff'],
  }

  package { [ 'rmagick', 'pdfkit', 'showoff']:
    ensure   => installed,
    provider => gem,
  }
}

