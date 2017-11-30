name 'graphlan'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures graphlan'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.3'

source_url 'https://github.com/EagleGenomics-cookbooks/graphlan'
issues_url 'https://github.com/EagleGenomics-cookbooks/graphlan/issues'

depends 'apt'
depends 'magic_shell'
depends 'poise-python'
depends 'mercurial', '~> 2.0'
