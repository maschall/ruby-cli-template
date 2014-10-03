require 'formula'

class <%= project_name %> < Formula
  homepage 'https://github.com/maschall/<%= project_name %>'
  url 'https://maschall.github.io/<%= project_name %>/<%= project_name %>-__VERSION__.tar.gz'
  sha1 '__SHA__'

  def install
    prefix.install 'defaults', 'vendor'
    prefix.install 'lib' => 'rubylib'

    bin.install 'src/<%= project_name %>'
  end

  test do
    system "#{bin}/<%= project_name %>", '--version'
  end
end
