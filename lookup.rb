def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")
#puts (dns_raw)


def parse_dns(rec)
  hsh = {}
  rec.each{ |precord|
    k=precord.split
    #puts(k[0])
    #puts(k[1])
    hsh[k[1].chop] = {:type=k[0],:target=k[2]}
  return(hsh)
end

def resolve(d_records,lookup_chain,domain)
  ans=d_records[domain]
  if ans!=nil
    lookup_chain.push(ans);
    resolve(d_records,lookup_chain,ans)
  else
    return
  end
  return(lookup_chain)
end


# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
