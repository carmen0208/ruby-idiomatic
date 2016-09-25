## What can fetch do?
* makes error more specific
* makes default value

[exampe](012_fetch_for_default.rb)

## What's the different between or and fetch?

[example](012_fetch_for_default_or_diff.rb)

## Issue of Or

[example](012_fetch_for_default_or_issue.rb)

## what about fetch?

[example](012_fetch_for_default_fetch.rb)

## Conclusion

When you want to provide default value for a missing hash key, consider
carefully whether you want an explicitly supplied nil or false to be treated the
same as a missing key. If not, use #fetch to provide the default value.
