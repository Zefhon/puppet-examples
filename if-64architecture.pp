#checks 64 architecture
if $::architecture =~ /64/ {
  notify {'64 bit os installed': }
} else {
  notify {'upgrade to 64bit.This is the future, old man': }
fail('Not 64 Bit')
}