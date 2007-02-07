source config/config.sh
source build/otherlibs-targets.sh
source build/camlp4-targets.sh
STDLIB_BYTE="stdlib/stdlib.cma stdlib/std_exit.cmo \
             stdlib/camlheader stdlib/camlheader_ur"
OCAMLLEX_BYTE=lex/ocamllex$EXE
OCAMLC_BYTE=ocamlc$EXE
OCAMLOPT_BYTE=ocamlopt$EXE
OCAMLBUILD_BYTE="ocamlbuild/ocamlbuildlib.cma \
                 ocamlbuild/ocamlbuildlightlib.cma \
                 ocamlbuild/ocamlbuild.byte$EXE \
                 ocamlbuild/ocamlbuildlight.byte$EXE"
TOPLEVEL=ocaml$EXE
TOOLS_BYTE="tools/ocamldep.byte$EXE tools/profiling.cmo \
            tools/ocamlprof.byte$EXE tools/ocamlcp.byte$EXE \
            tools/ocamlmktop.byte$EXE tools/ocamlmklib$EXE \
            tools/scrapelabels.byte tools/addlabels.byte \
            tools/dumpobj.byte$EXE"
if [ ! -z "$DEBUGGER" ]; then
  DEBUGGER=debugger/ocamldebug$EXE
fi
OCAMLDOC_BYTE="ocamldoc/ocamldoc$EXE ocamldoc/odoc_info.cma"
STDLIB_NATIVE="stdlib/stdlib.cmxa stdlib/std_exit.cmx"
case $PROFILING in
prof) STDLIB_NATIVE="$STDLIB_NATIVE stdlib/stdlib.p.cmxa stdlib/std_exit.p.cmx";;
noprof) ;;
*) echo "unexpected PROFILING value $PROFILING"; exit 1;;
esac
OCAMLC_NATIVE=ocamlc.opt$EXE
OCAMLOPT_NATIVE=ocamlopt.opt$EXE
OCAMLLEX_NATIVE=lex/ocamllex.opt$EXE
TOOLS_NATIVE=tools/ocamldep.native$EXE
OCAMLDOC_NATIVE="ocamldoc/ocamldoc.opt$EXE ocamldoc/odoc_info.cmxa ocamldoc/stdlib_man/Pervasives.3o"
OCAMLBUILD_NATIVE="ocamlbuild/ocamlbuildlib.cmxa \
                   ocamlbuild/ocamlbuildlightlib.cmxa \
                   ocamlbuild/ocamlbuild.native$EXE \
                   ocamlbuild/ocamlbuildlight.native$EXE"
if [ -x boot/myocamlbuild.native ]; then
  OCAMLBUILD=./boot/myocamlbuild.native
else
  OCAMLBUILD="./boot/ocamlrun boot/myocamlbuild"
fi