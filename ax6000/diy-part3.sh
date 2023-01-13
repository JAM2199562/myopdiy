#!/bin/bash

# 避免alist依赖的go在feeds操作时被覆盖掉
rm -rf feeds/packages/lang/golang
svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
