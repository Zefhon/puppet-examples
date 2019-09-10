#elsif branches
#checks if the timezone is utc or greenwich
if $::timezone == 'UTC' {
  notify { 'Universal time coordinated'a: }
} elsif $::timezone == 'GMT' {
  notify { 'Greenwich Mean Time': }
} else {
  notify { "$::timezone is not UTC": }
}
