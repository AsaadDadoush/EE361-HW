import random
from myhdl import *

ACTIVE_LOW, INACTIVE_HIGH = 0, 1

random.seed(3)
randrange = random.randrange


@block
def memory(addres, data_in, enable, clk, data_out, reset):

    memory32 = [Signal(intbv(0)[32:])for i in range(32)]

    @always_seq(clk.posedge, reset=reset)
    def write():
        if enable == 1:
            memory32[addres].next = data_in
        data_out.next = memory32[addres]
    return instances()

@block
def testbench():
    addres = Signal(intbv(0)[5:])
    data_in = Signal(intbv(0)[32:])
    data_out = Signal(intbv(0)[32:])
    enable = Signal(bool(0))
    clk = Signal(bool(0))
    reset = ResetSignal(0, active=1, isasync=True)
    ins = memory(addres, data_in, enable, clk, data_out, reset)

    @always(delay(1))
    def clkgen():
        clk.next = not clk

    @instance
    def monitor():
        print("addres |             data_in              |             data_out                | enable")

        enable.next = 1
        yield delay(2)
        for i in range(32):
            addres.next, data_in.next = i, randrange(2 ** 32)
            yield delay(2)
            print("%s  | %s |   %s  |  %s " % \
                  (bin(addres, 5), bin(data_in,32), bin(data_out,32), bin(enable)))

        enable.next = 0
        yield delay(2)
        for i in range(32):
            addres.next, data_in.next = i, randrange(2 ** 32)
            yield delay(2)
            print("%s  | %s |   %s  |  %s " % \
                  (bin(addres, 5), bin(data_in,32), bin(data_out,32), bin(enable)))
    return instances()

def convert():
    addres = Signal(intbv(0)[5:])
    data_in = Signal(intbv(0)[32:])
    data_out = Signal(intbv(0)[32:])
    enable = Signal(bool(0))
    clk = Signal(bool(0))
    reset = ResetSignal(0, active=1, isasync=True)
    tst = memory(addres, data_in, enable, clk, data_out, reset)
    tst.convert(hdl='Verilog')


convert()
tb = testbench()
tb.run_sim(2000)