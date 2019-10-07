<project xmlns="com.autoesl.autopilot.project" name="x-order_filter" top="x_order_fir">
    <files>
        <file name="../../fir_src/fir_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas"/>
        <file name="../../fir_src/input.dat" sc="0" tb="1" cflags=" -Wno-unknown-pragmas"/>
        <file name="../../fir_src/out.gold.dat" sc="0" tb="1" cflags=" -Wno-unknown-pragmas"/>
        <file name="fir_src/x_order_fir.cpp" sc="0" tb="false" cflags=""/>
        <file name="fir_src/fir_coef.dat" sc="0" tb="false" cflags=""/>
    </files>
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags=""/>
    </Simulation>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

