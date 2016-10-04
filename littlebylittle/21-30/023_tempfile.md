## What is tmpfile?

Ruby Tempfile objects act almost identically to regular File objects, but have a couple of advantages for transient processing or uploading tasks:

* Tempfiles' filenames are unique, so you can put them in a shared tmp directory without worrying about name collision.
* Tempfiles' files are deleted when the Tempfile object is garbage collected. This prevents a bunch of extra files from accidentally accumulating on your machine. (But you should of course still explicity close Tempfiles after working with them.)

## ERB File

* erb.result(binding) -> using for creating a ERB template for temp file to
  write from . 
