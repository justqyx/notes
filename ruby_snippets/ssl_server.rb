require 'socket'
require 'openssl'

def main
  server = TCPServer.new 4481

  ctx = OpenSSL::SSL::SSLContext.new
  ctx.cert, ctx.key = create_self_signed_cert(
    1024,
    [["CN", "localhost"]],
    "Generate by Ruby/OpenSSL"
  )
  ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER

  ssl_server = OpenSSL::SSL::SSLServer.new(server, ctx)

  connection = ssl_server.accept

  connection.write("Bah now")
  connection.close
end

def create_self_signed_cert(bits, cn, comment)
  rsa = OpenSSL::PKey::RSA.new(bits) {|p, n|
    case p
    when 0; $stderr.putc "."
    when 1; $stderr.putc "+"
    when 2; $stderr.putc "*"
    when 3; $stderr.putc "\n"
    else; $stderr.putc "*"
    end
  }

  cert = OpenSSL::X509::Certificate.new
  cert.version = 2
  cert.serial = 1
  name = OpenSSL::X509::Name.new(cn)
  cert.subject = name
  cert.issuer = name
  cert.not_before = Time.now
  cert.not_after = Time.now + (365*24*60*60)
  cert.public_key = rsa.public_key

  ef = OpenSSL::X509::ExtensionFactory.new(nil, cert)
  ef.issuer_certificate = cert
  cert.extensions = [
    ef.create_extension("basicConstraints", "CA:FALSE"),
    ef.create_extension("keyUsage", "keyEncipherment"),
    ef.create_extension("subjectKeyIdentifier", "hash"),
    ef.create_extension("extendedKeyUsage", "serverAuth"),
    ef.create_extension("nsComment", comment)
  ]
  aki = ef.create_extension("authorityKeyIdentifier", "keyid:always,issuer:always")

  cert.add_extension(aki)
  cert.sign(rsa, OpenSSL::Digest::SHA1.new)

  return [cert, rsa]
end

main
