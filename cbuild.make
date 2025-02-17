'darray'

output 'libdarray.a'
compile 'gcc' '-O2 -fPIC'
link 'custom' 'ar rcs $(OUTPUT) $(SOURCE)'

