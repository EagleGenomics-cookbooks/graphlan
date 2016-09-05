name 'graphlan'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures graphlan'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'

source_url 'https://github.com/EagleGenomics-cookbooks/graphlan'
issues_url 'https://github.com/EagleGenomics-cookbooks/graphlan/issues'

depends 'apt'
depends 'magic_shell'
depends 'poise-python', '~> 1.4.0'
depends 'mercurial', '~> 2.0.4'
