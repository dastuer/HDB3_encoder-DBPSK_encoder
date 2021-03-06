library verilog;
use verilog.vl_types.all;
entity BDPSK is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        clk_DA          : out    vl_logic;
        blank_DA_n      : out    vl_logic;
        sync_DA_n       : out    vl_logic;
        re              : out    vl_logic;
        data_PN         : out    vl_logic;
        dataout         : out    vl_logic_vector(7 downto 0)
    );
end BDPSK;
